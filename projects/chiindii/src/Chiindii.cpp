#include "Chiindii.h"

#include <avr/io.h>
#include <avr/power.h>
#include <avr/wdt.h>
#include <util/delay.h>
#include <string.h>

#include <PID.h>
#include <SerialAVR.h>

#include "lib/Mpu6050/Mpu6050.h"
#include "timer/timer.h"

#include "battery/battery.h"
#include "motor/motor.h"

//The period (in ms) at which we run the main processing loop (complementary filter + PID + set motors, etc)
#define PROCESS_PERIOD			10
//The period (in ms) since we last saw a message, after which we assume the comm link is dead and we disarm the craft
#define COMM_TIMEOUT_PERIOD		1000

using namespace digitalcave;

//This cannot be a class variable, since it needs to be accessed by an ISR
SerialAVR serial(38400, 8, 0, 1, 1, 255);
#ifdef DEBUG
SerialUSB usb;
#endif

int main(){
	//Set clock to run at full speed
	clock_prescale_set(clock_div_1);
	// DISABLE JTAG - take control of F port
	MCUCR = _BV(JTD);
	MCUCR = _BV(JTD);
	//Disable WDT; this would be enabled if we have previously reset due to WDT
	wdt_disable();
	
	battery_init();
	timer_init();

/*
	motor_start();
	while (1) {
	for (uint16_t i = 0; i < 512; i++) {
			motor_set(i,i,i,i);
			_delay_ms(10);
		}
	}
*/

	Chiindii chiindii;
	chiindii.run();
}

vector_t* Chiindii::getAngleSp() { return &angle_sp; }
vector_t* Chiindii::getRateSp() { return &rate_sp; }
PID* Chiindii::getRateX() { return &rate_x; }
PID* Chiindii::getRateY() { return &rate_y; }
PID* Chiindii::getRateZ() { return &rate_z; }
PID* Chiindii::getAngleX() { return &angle_x; }
PID* Chiindii::getAngleY() { return &angle_y; }
PID* Chiindii::getGforce() { return &gforce; }
Complementary* Chiindii::getCompX() { return &c_x; }
Complementary* Chiindii::getCompY() { return &c_y; }
Mpu6050* Chiindii::getMpu6050() { return &mpu6050; }
uint8_t Chiindii::getBatteryLevel() { return battery_level; }
uint8_t Chiindii::getBatteryPercent() { return battery_pct(); }
uint8_t Chiindii::getMode() { return mode; }
void Chiindii::setMode(uint8_t mode) { this->mode = mode; }
uint8_t Chiindii::getDebug() { return debug; }
void Chiindii::setDebug(uint8_t debug) { this->debug = debug; }

void Chiindii::sendDebug(const char* message){
	sendDebug((char*) message);
}
void Chiindii::sendDebug(char* message){
	if (debug){
		FramedSerialMessage response(MESSAGE_DEBUG, (uint8_t*) message, strnlen(message, 128));
		sendMessage(&response);
	}
}
void Chiindii::sendUsb(const char* message){
#ifdef DEBUG
	sendUsb((char*) message);
#endif
}
void Chiindii::sendUsb(char* message){
#ifdef DEBUG
	if (debug){
		usb.write(message);
	}
#endif
}

double Chiindii::getThrottle() { return this->throttle_sp; }
void Chiindii::setThrottle(double throttle) { 
	if (throttle < 0) throttle_sp = 0; 
	else if (throttle > 1) throttle_sp = 1; 
	this->throttle_sp = throttle; 
}

Chiindii::Chiindii() : 
	mode(MODE_UNARMED),
	debug(1),			//TODO We currently start in debug mode
	throttle_sp(0),
	angle_sp({0, 0, 0}),
	rate_sp({0, 0, 0}),
	protocol(255),
	
	rate_x(0.1, 0, 0, DIRECTION_NORMAL, 0),
	rate_y(0.1, 0, 0, DIRECTION_NORMAL, 0),
	rate_z(0.1, 0, 0, DIRECTION_NORMAL, 0),
	
	angle_x(0.1, 0, 0, DIRECTION_NORMAL, 0),
	angle_y(0.1, 0, 0, DIRECTION_NORMAL, 0),
	gforce(0.1, 0, 0, DIRECTION_NORMAL, 0),
	
	c_x(0.075, 0),
	c_y(0.075, 0),
	
	general(this),
	calibration(this),
	direct(this),
	uc(this)
{
	//Output of angle PID is a rate (rad / s) for each axis.  -1 to 1 should suffice; if this
	// results in too slow corrections, we can increase.
	angle_x.setOutputLimits(-1, 1);
	angle_y.setOutputLimits(-1, 1);
	
	//Output of g-force PID
	gforce.setOutputLimits(0, 1);

	//Output of rate PID is an acceleration (rad / s / s) for each axis
	rate_x.setOutputLimits(-1, 1);
	rate_y.setOutputLimits(-1, 1);
	rate_z.setOutputLimits(-1, 1);
}

void Chiindii::run() {
	FramedSerialMessage request(0,255);

	calibration.read(); // load previously saved PID and comp tuning values from EEPROM
	
	vector_t gyro;
	vector_t accel;
	vector_t rate_pv;
	vector_t angle_mv;
	uint32_t time = 0;
	uint32_t last_message_time = 0;
	uint32_t lastProcessTime = 0;
	
	motor_start();
	
	_delay_ms(250);

	//Watchdog timer
	wdt_enable(WDTO_120MS);
	
	//Main program loop
	while (1) {
		wdt_reset();
		time = timer_millis();
		
		if (protocol.read(&serial, &request)) {
			dispatch(&request);
			last_message_time = time;
			status.commOK();
		} else if ((time - last_message_time) > COMM_TIMEOUT_PERIOD) {
			if (mode) sendDebug("Comm Timeout\n");
			mode = MODE_UNARMED;
			status.commInterrupt();
		}

		battery_level = battery_read();
		if (battery_level > BATTERY_WARNING_LEVEL) {
			status.batteryOK();
		} else if (battery_level > BATTERY_DAMAGE_LEVEL) {
			status.batteryLow();
		} else if (battery_level <= 1) {
			//The battery should only read as 0 if it is unplugged; we assume that we 
			// are running in debug mode without any battery.  We still show the battery 
			// status light, but we don't exit from armed mode.
			status.batteryLow();
		} else {
			if (mode) sendDebug("Low Battery\n");
			mode = MODE_UNARMED;
			status.batteryLow();
		}

		if ((time - lastProcessTime) > PROCESS_PERIOD){
			lastProcessTime = time;
			
			accel = mpu6050.getAccel();
			gyro = mpu6050.getGyro();

			// compute the absolute angle relative to the horizontal.  We use the standard convention of
			// rotation about the X axis is roll, and rotation about the Y axis is pitch.
			// See http://stackoverflow.com/questions/3755059/3d-accelerometer-calculate-the-orientation, answer by 'matteo' for formula.
			// See http://theccontinuum.com/2012/09/24/arduino-imu-pitch-roll-from-accelerometer/ for another opinion
			angle_mv.x = atan2(accel.y, accel.z);		//roll
			angle_mv.y = atan2(-accel.x, sqrt(accel.y * accel.y + accel.z * accel.z));		//pitch

			// complementary tuning
			// filter gyro rate and measured angle increase the accuracy of the angle
			angle_mv.x = c_x.compute(gyro.x, angle_mv.x, time);
			angle_mv.y= c_y.compute(gyro.y, angle_mv.y, time);
		
			if (mode == MODE_ARMED_ANGLE) {
				// angle pid
				// compute a rate set point given an angle set point and current measured angle
				// see doc/control_system.txt
				rate_sp.x = angle_x.compute(angle_sp.x, angle_mv.x, time);
				rate_sp.y = angle_y.compute(angle_sp.y, angle_mv.y, time);
				double gforceThrottle = gforce.compute(angle_sp.z, accel.z, time);

				// rate pid
				// computes the desired change rate
				// see doc/control_system.txt
				rate_pv.x = rate_x.compute(rate_sp.x, gyro.x, time);
				rate_pv.y = rate_y.compute(rate_sp.y, gyro.y, time);
				rate_pv.z = rate_z.compute(rate_sp.z, gyro.z, time);
				
				status.armed();
				driveMotors(gforceThrottle, &rate_pv);
			}
			else if (mode == MODE_ARMED_THROTTLE) {
				if (throttle_sp > 0.01){
					// angle pid with direct throttle
					// compute a rate set point given an angle set point and current measured angle
					// see doc/control_system.txt
					rate_sp.x = angle_x.compute(angle_sp.x, angle_mv.x, time);
					rate_sp.y = angle_y.compute(angle_sp.y, angle_mv.y, time);
					gforce.reset(time);

					// rate pid
					// computes the desired change rate
					// see doc/control_system.txt
					rate_pv.x = rate_x.compute(rate_sp.x, gyro.x, time);
					rate_pv.y = rate_y.compute(rate_sp.y, gyro.y, time);
					rate_pv.z = rate_z.compute(rate_sp.z, gyro.z, time);
					
					driveMotors(throttle_sp, &rate_pv);
				}
				else {
					//Don't do PID if the throttle is too low.
					rate_x.reset(time);
					rate_y.reset(time);
					rate_z.reset(time);
					angle_x.reset(time);
					angle_y.reset(time);
					gforce.reset(time);
					
					motor_set(0, 0, 0, 0);
				}

				status.armed();
			}
			else if (mode == MODE_ARMED_RATE){
				// angle pid not used here
				angle_x.reset(time);
				angle_y.reset(time);
				gforce.reset(time);

				// rate pid
				// computes the desired change rate
				// see doc/control_system.txt
				rate_pv.x = rate_x.compute(rate_sp.x, gyro.x, time);
				rate_pv.y = rate_y.compute(rate_sp.y, gyro.y, time);
				rate_pv.z = rate_z.compute(rate_sp.z, gyro.z, time);
				
#ifdef DEBUG
			if (mode && debug){
				char temp[128];
				snprintf(temp, sizeof(temp), "Raw Gyro: %5.0f, %5.0f, %5.0f  Raw Accel: %7.2f, %7.2f, %7.2f  ", RADIANS_TO_DEGREES(gyro.x), RADIANS_TO_DEGREES(gyro.y), RADIANS_TO_DEGREES(gyro.z), accel.x, accel.y, accel.z);
				sendDebug(temp);
				snprintf(temp, sizeof(temp), "Angle: %5.0f, %5.0f   Rates: %5.2f, %5.2f, %5.2f  ", RADIANS_TO_DEGREES(angle_mv.x), RADIANS_TO_DEGREES(angle_mv.y), rate_pv.x, rate_pv.y, rate_pv.z);
				sendDebug(temp);
			}
#endif

				status.armed();
				driveMotors(throttle_sp, &rate_pv);
			}
			else {
				//If we are not armed, keep the PID reset.  This prevents erratic behaviour 
				// when initially turning on, especially if I is non-zero.
				rate_x.reset(time);
				rate_y.reset(time);
				rate_z.reset(time);
				angle_x.reset(time);
				angle_y.reset(time);
				gforce.reset(time);
				
				status.disarmed();
				motor_set(0, 0, 0, 0);
			}
		}

		status.poll(time);
	}
}

void Chiindii::driveMotors(double throttle, vector_t* rate_pv) {
	//Limit throttle to [0,1]
	if (throttle < 0) throttle = 0;
	else if (throttle > 1) throttle = 1;
	
	if (throttle < 0.01){
		motor_set(0, 0, 0, 0);
		return;
	}

	//This assumes an MPU that has a gyro output corresponding to the notes in doc/motor_arrangement.txt, in X configuration
	double m1 = throttle + rate_pv->x - rate_pv->y + rate_pv->z;
	double m2 = throttle - rate_pv->x - rate_pv->y - rate_pv->z;
	double m3 = throttle - rate_pv->x + rate_pv->y + rate_pv->z;
	double m4 = throttle + rate_pv->x + rate_pv->y - rate_pv->z;

	//We limit the motor outputs to be in the range [0, min(throttle*2, 1)].
//	if (throttle * 2 > 1) throttle = 1;
//	else (throttle = throttle * 2);
	
	if (m1 < 0) m1 = 0;
	else if (m1 > 1) m1 = 1;
	if (m2 < 0) m2 = 0;
	else if (m2 > 1) m2 = 1;
	if (m3 < 0) m3 = 0;
	else if (m3 > 1) m3 = 1;
	if (m4 < 0) m4 = 0;
	else if (m4 > 1) m4 = 1;
	
	//Convert values in [0..1] to [0..511] (9 bit motor control)
	m1 = m1 * 511;
	m2 = m2 * 511;
	m3 = m3 * 511;
	m4 = m4 * 511;
	
#ifdef DEBUG
	if (debug){
		char temp[128];
		snprintf(temp, sizeof(temp), "Motors: %d, %d, %d, %d\n", (uint16_t) m1, (uint16_t) m2, (uint16_t) m3, (uint16_t) m4);
		sendDebug(temp);
	}
#endif

	motor_set(m1, m2, m3, m4);
} 

void Chiindii::dispatch(FramedSerialMessage* request) {
	uint8_t cmd = request->getCommand();

	if ((cmd & 0xF0) == 0x00){
		general.dispatch(request);
	}
	else if ((cmd & 0xF0) == 0x10){
		uc.dispatch(request);
	}
	else if ((cmd & 0xF0) == 0x20){
		direct.dispatch(request);
	}
	else if ( (cmd & 0xF0) == 0x30){
		calibration.dispatch(request);
	}
	else {
		//TODO Send debug message 'unknown command' or similar
	}
}

void Chiindii::sendMessage(FramedSerialMessage* message) {
	protocol.write(&serial, message);
}

ISR(USART1_RX_vect){
	serial.isr();
}