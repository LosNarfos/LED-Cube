/*
 * main.h
 *
 *  Created on: Apr 18, 2018
 *      Author: simon
 */

#ifndef INC_MAIN_H_
#define INC_MAIN_H_

// LEDs on discovery board for debug purpose
#define GPIO_LED		GPIOD
#define LED_GREEN_PIN	12
#define LED_ORANGE_PIN	13
#define LED_RED_PIN		14
#define LED_BLUE_PIN	15

// Button on port A for debug purpose
#define GPIO_BUTTON		GPIOA
#define BUTTON_PIN		GPIO_IDR_ID0

// single RGB-LED for debug purpose
#define GPIO_RGB_LED	GPIOC
#define RGB_LED_Pin		8


void delay_ms(uint32_t ms);
void _delay_us(uint16_t us);

#endif /* INC_MAIN_H_ */
