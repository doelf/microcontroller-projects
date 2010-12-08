/*
 * Sample skeleton source file.
 */


#include <avr/io.h>
#include <util/delay.h>
#include <stdlib.h>

#include "lib/serial/serial.h"

int main (void){
	serial_init_b(BAUD);
		
	char temp[32];

	//Main program loop
	while (1){
		uint8_t r = serial_read_s(temp, 31);
		if (r){
			serial_write_s(temp);
			serial_write_c('\n');
			serial_write_s(itoa(r, temp, 10));
		}
		//serial_write_c(serial_read_c());
		serial_write_s("\n\rTesting...\n\r");
		serial_write_c('c');
		serial_write_c('h');
		serial_write_c('a');
		serial_write_c('r');
		serial_write_c('\n');
		serial_write_c('\r');
		_delay_ms(1000);
		
	}
}
