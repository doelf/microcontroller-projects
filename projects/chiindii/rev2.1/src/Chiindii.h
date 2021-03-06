#ifndef CHIINDII_H
#define CHIINDII_H

#define DEBUG

//Set exactly one of these
//#define MAHONY
#define MADGWICK

#include <dcmath.h>
#include <dctypes.h>
#include <FramedSerialProtocol.h>
#if defined MAHONY
#include <Mahony.h>
#elif defined MADGWICK
#include <Madgwick.h>
#endif
#include <MPU6050.h>
#include <SerialHAL.h>
#include <PID.h>

#include "Status.h"
#include "controllers/General.h"
#include "controllers/UniversalController.h"
#include "controllers/Calibration.h"
#include "controllers/Direct.h"
#include "battery/battery.h"

#define MODE_UNARMED		0x00
#define MODE_ARMED_ANGLE	0x01
#define MODE_ARMED_RATE		0x02
#define MODE_ARMED_THROTTLE	0x03

#define CONTROLLER_NONE			0x00
#define CONTROLLER_UC			0x01
#define CONTROLLER_DIRECT		0x02
#define CONTROLLER_CALIBRATION	0x03


namespace digitalcave {
	class Chiindii {

		public:
			Chiindii();

			void run();

			vector_t* getAngleSp() { return &angle_sp; }
			vector_t* getRateSp() { return &rate_sp; }
			double getThrottle() { return this->throttle_sp; }
			void setThrottle(double throttle){
				if (throttle < 0) throttle_sp = 0;
				else if (throttle > 1) throttle_sp = 1;
				this->throttle_sp = throttle;
			}

			PID* getRateX() { return &rate_x; }
			PID* getRateY() { return &rate_y; }
			PID* getRateZ() { return &rate_z; }
			PID* getAngleX() { return &angle_x; }
			PID* getAngleY() { return &angle_y; }
			PID* getAngleZ() { return &angle_z; }
			PID* getGforce() { return &gforce; }

#if defined MAHONY
			Mahony* getImu() { return &imu; }
#elif defined MADGWICK
			Madgwick* getImu() { return &imu; }
#endif
			MPU6050* getMpu6050() { return &mpu6050; }
			Status* getStatus();

			uint8_t getBatteryLevel() { return battery_level; }
			uint8_t getBatteryPercent() { return battery_pct(); }

			uint8_t getMode() { return mode; }
			void setMode(uint8_t mode) { this->mode = mode; }

			void saveConfig();
			void loadConfig();
			void sendDebug(char* message, uint8_t length) { FramedSerialMessage response(MESSAGE_DEBUG, (uint8_t*) message, length); sendMessage(&response); }
			void sendDebug(const char* message, uint8_t length) { sendDebug((char*) message, length); }
			void sendStatus(char* message, uint8_t length) { FramedSerialMessage response(MESSAGE_STATUS, (uint8_t*) message, length); sendMessage(&response); }
			void sendStatus(const char* message, uint8_t length) { sendStatus((char*) message, length); }

			void sendMessage(FramedSerialMessage* message);

        private:
			uint8_t mode;
			uint8_t battery_level;
			double throttle_sp;
			vector_t angle_sp;
			vector_t rate_sp;

			FramedSerialProtocol protocol;
			MPU6050 mpu6050;

			PID rate_x;
			PID rate_y;
			PID rate_z;
			PID angle_x;
			PID angle_y;
			PID angle_z;
			PID gforce;

#if defined MAHONY
			Mahony imu;
#elif defined MADGWICK
			Madgwick imu;
#endif

			General general;
			Calibration calibration;
			Direct direct;
			UniversalController uc;

			Status status;
	};
}
#endif
