/*
 * led.h
 *
 *  Created on: May 12, 2018
 *      Author: simon
 */

#include "stm32f4xx.h"

#ifndef SOFTWARE_INC_LED_H_
#define SOFTWARE_INC_LED_H_


// pinout according to TPIC6C595
#define LED_Port		GPIOB
#define LED_G			10		// output enable, active low
#define LED_CRL			11		// Shift register clear, active low
#define LED_RCK			12		// register clock
#define LED_SRCK		13		// shift register clock
#define LED_SEROUT		14		// serial data out
#define LED_SERIN		15		// serial data in


#define SPI_Port		GPIOB
#define SPI_SCK_Pin		13
#define SPI_MOSI_Pin	15
#define SPI_MISO_Pin	14
#define SPI_NSS_Pin		12


/*
 * initializes the SPI interface used for shifting out led data to cube
 */
void led_init(void);
void led_send(uint8_t data);
void led_clear(void);
void led_RCK(void);
void led_enable(void);

#endif /* SOFTWARE_INC_LED_H_ */
