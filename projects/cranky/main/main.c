#include <avr/io.h>
#include <util/delay.h> // TODO remove
#include <avr/interrupt.h>
#include "lib/usb/rawhid.h"

static uint8_t ign_pins[] = { _BV(PB4), _BV(PB5), _BV(PB4), _BV(PB5) };
static uint8_t inj_pins[] = { _BV(PD4), _BV(PD5), _BV(PD4), _BV(PD5) };
volatile uint8_t ign_pin;
volatile uint8_t inj_pin;

//static volatile uint8_t frequency;

/* TODO
 * below a configured RPM (i.e. 383) don't calculate the PWM for the injectors, just use defalt cranking values
 * implement a rev limiter; either retard  the ignition advance, or cut fuel; configurable rev upper limit and restored limit
 * configure injector opening time (ms)
 *           pwm time threshold (ms)
 *           injector pwm period (us)
 *           determine both spark and injector configuration
 */

#define REG_LEN 159

typedef struct {
	// tuning values
	
	// an 8x8 matrix of spark advance values specified in degrees
	// first index is the rpm zone, 0 for slow, 7 for fast
	// second index is the engine load, 0 for low, 7 for high
	// determines how many degrees to advance the spark based on the rpm zone and load zone
	uint8_t ign_advance[8][8];
	// determines how open the injectors should be based on the rpm zone and load zone
	uint8_t inj_duration[8][8];
	// maps the throttle position into load zones
	uint8_t load_zones[8];
	// maps the frequency into rpm zones
	uint8_t rpm_zones[8];

	volatile uint8_t cranking_ticks;	// above this value = cranking; below this value = running normally
	volatile uint8_t max_ign_dwell;		// the maximum dwell in timer0 ticks
	
	// running values
	volatile uint8_t load_zone;			// the current load zone; a value between 0 and 8
	volatile uint8_t rpm_zone;			// the current rpm zone; a value between 0 and 8
	volatile uint8_t adc_tp;			// adc reading of the throttle position sensor
	volatile uint8_t ign_adv_deg;		// the current spark advance in degrees
	volatile uint8_t ign_dwell;			// the spark plug dwell in timer0 ticks
	volatile uint8_t crank_ticks;		// the number of timer0 ticks since the last crank tooth; this can be turned into rpm
										// 60/(t*36)

	volatile uint8_t inj; 				// the current injector; a value between 0 and 3
	volatile uint8_t cam;				// the current cam tooth; a value between 0 and 3
	volatile uint8_t crank;				// the current crank tooth; a value between 0 and 35
	volatile uint8_t ign;				// the current spark plug; a value between 0 and 3
	volatile uint8_t inj_dc;			// the injector duty cycle in timer2 ticks

	volatile uint8_t crank_sync;	 	// crank sync has been performed; worst case is 10 rotations; 0 means calibrated
	volatile uint8_t cranking;			// 0 = running normally; 1 = running below 383 rpm
} reg_t;

static union reg_u {
	reg_t s;
	uint8_t a[REG_LEN];
} u;

// these things are not in the struct since they are never read/write over serial
volatile uint8_t cam_teeth;			// how many crank teeth between cam teeth

uint8_t rx_buffer[64];
uint8_t tx_buffer[64];
uint8_t tp_ring[8];
uint8_t tp_ring_ptr;

/* 
// additional parameters that may become tuning parameters or constants
float inj_ms;
float inj_opening_ms = 1.0;
float inj_battery_correction_ms_V = 0.2;
float inj_pwm_current_limit_pct = 18;
float inj_pwm_time_threshold_ms = 0.7;
float inj_fast_idle_temp_c = -18;

float inj_cranking_ms = 2.0;
float inj_pwm_40c = 11.0;	// -40
float inj_pwm_80c = 2.2;	// +80

//-45, -30, -15, 0, 15, 30, 45, 60, 75
uint8_t enrichment_pct = { 156, 148, 140, 132, 124, 116, 108, 100 };

float tpsdot_threshold_vs = 0.98;
float accel_time_s = 0.2;
float cold_accel_enrichment_ms = 2.0;
float cold_accel_mult_pct = 150;
float decel_fuel_pct = 20;
*/



// the crank position is used to determine injection and spark timing.
// the cam position may be used to determine injection and spark timing for sequential operation
// the rpm (crank) is used to determine the spark advance
// the throttle possition is used to determine the load

// reading material:
// http://www.vems.hu/wiki/index.php?page=InputTrigger%2FSubaruThirtySixMinusTwoMinusTwoMinusTwo

// teeth
//                SSSSSSS           SSSSSSS           SSSSSSS           SSSSSSS         spark zones (max advance 60 deg)
//    4                 1                 3                 2                 4         TDC
// |                 |                                   |                 |            cam teeth
// |__|||||||||||||__||||||||||||||||__|__|||||||||||||__||||||||||||||||__|__|||       crank teeth
//      2         3     0         1         2         3     0         1                 
// 56789012345678901234501234567890123456789012345678901234501234567890123456789        crank tooth number
//                1                 3                 2                 4               60 deg before TDC

// The ECM identifies cylinders at TDC and determines ignition timing as follows:
// * There is a crank input signal every 10 deg rotation of the crankshaft
// * The cylinder group (#4,#1 ; #3,#2) is determined by gaps in the input signal
// * cylinders #1 and #2 are at TDC when there is a single gap, #3 and #4 whene there is a double gap
// * TDC #1, #2 is the zero reference point for the teeth on the timing wheel
// * 
int main(void) {
	// set up pin outputs
	DDRB = _BV(PB4) | _BV(PB5) | _BV(PB6); 		// 4 & 5 are ignition igbts output; 6 is led output
	DDRC = _BV(PC6) | _BV(PB7);					// 6 & 7 are relay transistors output
	DDRD = _BV(PD4) | _BV(PD5);					// 2 & 3 are hall effect input; 4 & 5 are injector mosfets output
	DDRF = 0x00;								// 0 is throttle position ADC input

	PORTB = _BV(PB4) | _BV(PB5); // red is b6
	// set up analog
	ADCSRA |= _BV(ADEN) | _BV(ADIE) | _BV(ADPS2) | _BV(ADPS1) | _BV(ADPS0); // enable, enable interrupt, prescale /128
	ADMUX |= _BV(ADLAR); // use AREF, left adjust result, read ADC0/PC0

	// set up pin interrupts
	//EICRA = _BV(ISC20) | _BV(ISC21) | _BV(ISC30) | _BV(ISC31); // INT2 and INT3 interrupt on rising edge
	//EIMSK = _BV(INT2) | _BV(INT3); // enable interrupts on INT2 (crank) and INT3 (cam sync)

	usb_init();
	
	PORTB = _BV(PB4) | _BV(PB6); // green is b5
	// set up timers
	// 52 tick/tooth * 64 us/tick = 3328 us/tooth * 36 teeth = 119.808 ms/rotation = 8.34 Hz * 60 = 500 RPM
	// 6000000 / (t * 64 * 36)

	// timer 0 (8-bit) is used to compute the duration of each crank tooth
	// to determine crank position by detecting gap teeth and to determine RPM
	// prescaler configured so that the timer won't overflow at 500 rpm @ 36 teeth
	// 16MHz clock = 62.5 ns per clock cycle (64 ms / timer tick @ 1024 prescale --- 15.624 kHz)
	// 500 rpm = 8.3 Hz = 120 ms / 36 = 3.333 ms/tooth (9.999 ms for missing teeth)
	// 10000 us / 64 us = 156 < 256
	// 10000 rpm = 166.6 Hz = 6 ms / 36 = 0.166 ms/tooth (0.5 ms for missing teeth)
	// 500 us / 64 us = 7.8 > 0
	// ??? rpm absolute minimum rpm at 1024 prescale
//	TCCR0A = 0x00;						// OC0A / OC0B disconnected
//	TCCR0B = _BV(CS00) | _BV(CS02);		// clock prescale select = CLK / 1024

	// timer 1 (16-bit) is used to time the spark advance
	// 16MHz clock = 62.5 ns per clock cycle
	// 500 rpm = 8.3 Hz = 120 ms / 36 = 3.333 ms/tooth (20 ms covers 60 degrees maximum spark advance)
	// 20000 us / 0.5 us = 40,000 < 65,535 [ / 8 prescale ]
//	TCCR1A = 0x00;						// OC1A / OC1B disconnected
//	TCCR1B = _BV(CS11);					// clock prescale select = CLK /8
//	TIMSK1 = _BV(OCIE1A) | _BV(OCIE1B);	// interrupt on timer 1 compare A and B
	
	// timer 4 (10-bit) is used to drive the injector solenoids (high-z)
	// 16MHz clock = 62.5 ns per clock cycle
	// 256 * 8 = 2048 * 0.0625 us = 128 us > 66 us
//	TCCR4A = 0x00;						// OC2A / OC2B disconnected
//	TCCR4B = _BV(CS42);					// clock precale select = CLK / 8
//	TIMSK4 = _BV(OCIE4A) | _BV(OCIE4B); // interrupt on timer 4 compare A and B
//	OCR4A = 132; // 132 * 8 clock cycles = 66 us
	
	// load tuning values
	// TODO load these tuning values from EEPROM
//	for (uint8_t i = 0; i < 8; i++) {
//		for (uint8_t j = 0; j < 8; i++) {
//			u.s.ign_advance[i][j] = i * 5 - j;
//			u.s.inj_duration[i][j] = i * 10;
//		}
//		u.s.rpm_zones[7-i] = (i*8);	// rpm = 500/581/664/794/986/1302/1915/3617 (not ideal for real life)
//		u.s.load_zones[7-i] = 2 ^ i;
//	}
	// initialize running state
	u.s.crank = 0;
	u.s.cam = 0;
	u.s.crank_ticks = 0;
	u.s.crank_sync = 0;
	cam_teeth = 0;

	sei();						// enable interrupts

	PORTB = _BV(PB5) | _BV(PB6); // blue is b4

	//	ADCSRA |= _BV(ADSC);		// start an analog conversion for throttle position

	while(1) {
		PORTB = _BV(PB4) | _BV(PB5); // red is b6


		// nothing in the main loop is time sensitive
		
//		for (uint8_t i = 0; i < 8; i++) {
//			if (u.s.crank_ticks > u.s.rpm_zones[i]) {
//				u.s.rpm_zone = i;
//				break;
//			}
//		}
//		for (uint8_t i = 0; i < 8; i++) {
//			if (u.s.adc_tp < u.s.load_zones[i]) {
//				u.s.load_zone = i;
//				break;
//			}
//		}
//		u.s.inj_dc = u.s.inj_duration[u.s.rpm_zone][u.s.load_zone];
		
		// continually poll ADC0
//		if ((ADCSRA & ADSC) == 0x00) {
//			ADCSRA |= _BV(ADSC);
//		}
		
		if (usb_configured()) {
			PORTB = _BV(PB4) | _BV(PB6); // green is b5
			if (usb_rawhid_recv(rx_buffer, 10) > 0) {
				PORTB = _BV(PB5) | _BV(PB6); // blue is b4
				uint8_t addr = rx_buffer[0];
				uint8_t len = rx_buffer[0];
				if (len & 0x80) {
					// read request
					if (addr == 0xff) {
						// read from eeprom
						for (uint8_t i = 0; i < 18; i++) {
							tx_buffer[0] = i * 8;
							tx_buffer[1] = 8;
							for (uint8_t j = 0; j < 8; j++) {
								tx_buffer[j+2] = u.a[(i*8) + j];
							}
							usb_rawhid_send(tx_buffer, 10);
						}
					} else {
						len &= 0x7f; // clear the read bit
						if (addr + len > REG_LEN) len = REG_LEN - addr; // prevent overflowing the register array
						tx_buffer[0] = addr;
						tx_buffer[1] = len;
						for (uint8_t i = 0; i < len; i++) {
							tx_buffer[i + 2] = u.a[i + addr];
						}
						usb_rawhid_send(tx_buffer, len + 2);
					}
				} else {
					// write request
					if (addr == 0xff) {
						// write to eeprom
					} else {
						if (addr + len > REG_LEN) len = REG_LEN - addr; // prevent overflowing the register array
						for (uint8_t i = 0; i < len; i++) {
							u.a[i + addr] = rx_buffer[i + 2];
						}
					}
				}
			} else {
				// send the six running values
				tx_buffer[0] = 0x92;
				tx_buffer[1] = 0x06;
				for (uint8_t i = 0; i < 6; i++) {
					tx_buffer[i + 2] = u.a[i + 0x92];
				}
				usb_rawhid_send(tx_buffer, 8);
			}
			PORTB = _BV(PB4) | _BV(PB6); // red is b6
		}
	}
}

// analog ISR
ISR(ADC_vect) {
	u.s.adc_tp = ADCH;
}

// crank ISR
// the wheel has 36 - 2 - 2 - 2 = 30 teeth
// each tooth represents 10 degrees
ISR(INT0_vect) {
	uint8_t t = TCNT0; // how long 10 (or 30) degrees took
	if (t < 255) u.s.cranking = 0;
	if (t > (u.s.crank_ticks << 1)) {
		// gap detected add the two missing gap teeth
		u.s.crank = u.s.crank + 2;
		cam_teeth = cam_teeth + 2;
		t = t / 3; // approximate the duration of the single tooth, accounting for the length of the gap
	} else {
		u.s.crank++;
		u.s.cam++;
	}
	
	TCNT0 = 0; // reset timer0 to zero
	
	if (u.s.crank == 13 || u.s.crank == 16 || u.s.crank == 31) {
		// tooth count is wrong, this is normal so just try adjusting
		u.s.crank = u.s.crank + 2;
	} else if (u.s.crank == 12 || u.s.crank == 30) {
		// now 60 degrees before 0/180 degrees, set the timer for the spark advance
		u.s.ign_adv_deg = u.s.ign_advance[u.s.rpm_zone][u.s.load_zone]; // in degrees
		u.s.ign_adv_deg = 10; // TODO remove
		// 60 degrees - advance degrees (1024 prescale -> 8 prescale)
		// t is a /1024 prescaled value and maxes out at about 66 @ 500 rpm
		// OCR1A is a /8 prescaled value
		// multiply by 128 to convert form /1024 to /8
		uint16_t deg = 60 - u.s.ign_adv_deg;
		
		uint16_t comp = deg * t / 10 * 128; // this isn't terribly accurate due to rounding
		OCR1A = comp; // set up timer1 compA for on time
		OCR2A = comp + 2048;
		TCNT1 = 0;	// reset timer1 to zero
		
//		PORTB=0xFF;
	} else if (u.s.crank == 1 && u.s.cam == 2) {
		// #1BDTC; #4 just finished burning, #1 ignition just happened, #3 ignites next, #2 injects next
		u.s.ign = 0;
	} else if (u.s.crank == 1 && u.s.cam == 0) {
		// #2BDTC; #3 just finished burning, #2 ignition just happened, #4 ignites next, #1 injects next
		u.s.ign = 1;
	} else if (u.s.crank == 19 && u.s.cam == 2) {  // in cam signal gap, so 2 not 3
		// #3BTDC; #1 just finished burning, #3 ignition just happened, #2 ignites next, #3 injects next
		u.s.ign = 2;
	} else if (u.s.crank == 19 && u.s.cam == 1) {
		// #4BTDC; #2 just finished burning, #4 ignition just happened, #1 ignites next, #4 injects next
		u.s.ign = 3;
	} else if (u.s.crank == 15 && u.s.cam == 2) {
		u.s.inj = 0;
	} else if (u.s.crank == 15 && u.s.cam == 0) {
		u.s.inj = 1;
	} else if (u.s.crank == 33 && u.s.cam == 2) {
		u.s.inj = 2;
	} else if (u.s.crank == 33 && u.s.cam == 1) {
		u.s.inj = 3;
	} else if (u.s.crank >= 35) {
		u.s.crank = 0;
	}
	ign_pin = ign_pins[u.s.ign];
	inj_pin = inj_pins[u.s.inj];
	
	u.s.crank_ticks = t;
}

// timer 0 overflow
ISR(TIMER0_OVF_vect) {
	// if timer0 overflows it means that the crank is turning slower than 383 rpm (and is in a gap)
	u.s.crank_ticks = 255;
	u.s.cranking = 1;
	TCNT0 = 255;
}

// cam sync ISR
ISR(INT1_vect) {
	// now on either crank tooth 25 or 33
	// RHS camshaft sensor, signals are at BTDC#2, BTDC#4, BTDC#1
	u.s.cam++;
	
	// normally 14 or 16 tooth events between cam events, more means a gap
	if (cam_teeth > 20) {
		// gap detected, now at #2BTDC
		u.s.cam = 0;
	}
	cam_teeth = 0;
}

// ignition spark on
ISR(TIMER1_COMPA_vect) {
	if ((u.s.crank > 12 && u.s.crank < 19) || u.s.crank >= 30 || u.s.crank < 1) {
//		if ((u.s.crank > 11 && u.s.crank < 19) || (u.s.crank > 29 && u.s.crank < 26) || (u.s.crank == 0)) {
		//PORTB = ign_pin;
	}
}

// ignition spark off
ISR(TIMER1_COMPB_vect) {
	//PORTB = 0x0;
	
	OCR1A = 0xFFFF;
	TCNT1 = 0;
}

// injector pwm frequency
ISR(TIMER4_COMPA_vect) {
	// -30 to +70 degrees around TDC
	if ((u.s.crank > 14 && u.s.crank < 26) || u.s.crank > 33 || u.s.crank < 8) {
		//PORTD |= inj_pin;
	}
	TCNT4 = 0;
	OCR4B = (uint16_t) u.s.inj_dc * 132 / 255;	// 132 * 8 clock cycles = 66 us
}

// injector pwm phase
ISR(TIMER4_COMPB_vect) {
	//PORTD = 0;
}
