/*
 * led.h
 *
 *  Created on: May 12, 2018
 *      Author: simon
 */

#include "stm32f4xx.h"

#ifndef SOFTWARE_INC_LED_H_
#define SOFTWARE_INC_LED_H_


// Using SPI2 mapped on GPIOB
#define LED_Port		GPIOB
#define LED_OE			11		// Output enable
#define LED_SCK			13		// serial clock
#define LED_LE			14		// Latch Enable
#define LED_MOSI		15		// serial data out


/*
 * initializes the SPI interface used for shifting out led data to cube
 */

void led_init(uint8_t data[][3], uint8_t length);
void led_start(void);
void led_stop(void);

#endif /* SOFTWARE_INC_LED_H_ */
