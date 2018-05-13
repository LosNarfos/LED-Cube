/*
 * led.c
 *
 *  Created on: May 12, 2018
 *      Author: simon
 */

#include "stm32f4xx.h"
#include "led.h"
#include "main.h"

void led_init(void)
{
	/*
	 * LED_G 		->	General purpose out
	 * LED_CRL		->	General purpose out
	 * LED_RCK		->	General purpose out
	 * LED_SRCK		->	SPI_SCK
	 * LED_SEROUT	->	SPI_MISO
	 * LED_SERIN	->	SPI_MOSI
	 *
	 * SPI-Interface to master mode with 160kHz
	 */

	/* activate clocks */
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOBEN;	// GPIOB
	RCC->APB1ENR |= RCC_APB1ENR_SPI2EN;		// SPI2

	/* configure GPIO */
	LED_Port->MODER &= ~(GPIO_MODER_MODE12_Msk | GPIO_MODER_MODE13_Msk | GPIO_MODER_MODE14_Msk | GPIO_MODER_MODE15_Msk);
	LED_Port->MODER |= GPIO_MODER_MODE10_0;		// LED_G		general purpose out
	LED_Port->MODER |= GPIO_MODER_MODE11_0;		// LED_CRL		general purpose out
	LED_Port->MODER |= GPIO_MODER_MODE12_0;		// LED_RCK		general purpose out
	LED_Port->MODER |= GPIO_MODER_MODE13_1;		// LED_SRCK 	alternate function (SPI_SCK)
	LED_Port->MODER |= GPIO_MODER_MODE14_1;		// LED_SEROUT	alternate function (SPI_MISO)
	LED_Port->MODER |= GPIO_MODER_MODE15_1;		// LED_SERIN	alternate function (SPI_MOSI)

	LED_Port->OTYPER &= ~(GPIO_OTYPER_OT12_Msk | GPIO_OTYPER_OT13_Msk | GPIO_OTYPER_OT14_Msk | GPIO_OTYPER_OT15_Msk);
	LED_Port->OTYPER &= ~GPIO_OTYPER_OT10;		// LED_G		output push-pull
	LED_Port->OTYPER &= ~GPIO_OTYPER_OT11;		// LED_CRL		output push-pull
	LED_Port->OTYPER &= ~GPIO_OTYPER_OT12;		// LED_RCK		output push-pull
	LED_Port->OTYPER &= ~GPIO_OTYPER_OT13;		// LED_SRCK		output push-pull
	LED_Port->OTYPER |=  GPIO_OTYPER_OT14;		// LED_SEROUT	open drain
	LED_Port->OTYPER &= ~GPIO_OTYPER_OT15;		// LED_SERIN	output push-pull

	LED_Port->OSPEEDR &= ~(GPIO_OSPEEDR_OSPEED12_Msk | GPIO_OSPEEDR_OSPEED13_Msk | GPIO_OSPEEDR_OSPEED14_Msk | GPIO_OSPEEDR_OSPEED15_Msk);
	LED_Port->OSPEEDR |= GPIO_OSPEEDR_OSPEED10_1;	// LED_G		high speed
	LED_Port->OSPEEDR |= GPIO_OSPEEDR_OSPEED11_1;	// LED_CRL		high speed
	LED_Port->OSPEEDR |= GPIO_OSPEEDR_OSPEED12_1;	// LED_RCK		high speed
	LED_Port->OSPEEDR |= GPIO_OSPEEDR_OSPEED13_1;	// LED_SRCK		high speed
	LED_Port->OSPEEDR |= GPIO_OSPEEDR_OSPEED14_1;	// LED_SEROUT	high speed
	LED_Port->OSPEEDR |= GPIO_OSPEEDR_OSPEED15_1;	// LED_SERIN	high speed

	LED_Port->PUPDR &= ~(GPIO_PUPDR_PUPD12_Msk | GPIO_PUPDR_PUPD13_Msk | GPIO_PUPDR_PUPD14_Msk | GPIO_PUPDR_PUPD15_Msk);
	LED_Port->PUPDR &= ~GPIO_PUPDR_PUPD10;	// LED_G		no pull-up, pull-down
	LED_Port->PUPDR &= ~GPIO_PUPDR_PUPD11;	// LED_CRL		no pull-up, pull-down
	LED_Port->PUPDR &= ~GPIO_PUPDR_PUPD12;	// LED_RCK		no pull-up, pull-down
	LED_Port->PUPDR &= ~GPIO_PUPDR_PUPD13;	// LED_SRCK		no pull-up, pull-down
	LED_Port->PUPDR &= ~GPIO_PUPDR_PUPD14;	// LED_SEROUT	no pull-up, pull-down
	LED_Port->PUPDR &= ~GPIO_PUPDR_PUPD15;	// LED_SERIN	no pull-up, pull-down

	LED_Port->AFR[1] &= ~(GPIO_AFRH_AFSEL13_Msk | GPIO_AFRH_AFSEL14_Msk | GPIO_AFRH_AFSEL15_Msk);
	LED_Port->AFR[1] |= GPIO_AFRH_AFSEL13_2 | GPIO_AFRH_AFSEL13_0;	// SCK	alternate function SPI2
	LED_Port->AFR[1] |= GPIO_AFRH_AFSEL14_2 | GPIO_AFRH_AFSEL14_0;	// MOSI alternate function SPI2
	LED_Port->AFR[1] |= GPIO_AFRH_AFSEL15_2 | GPIO_AFRH_AFSEL15_0;	// MISO	alternate function SPI2

	/* set CS to high */
	//SPI_Port->BSRR = 1<<SPI_NSS_Pin;

	/* configure SPI2 */
	SPI2->CR1 &= ~0x00000000;
	//SPI2->CR1 |= SPI_CR1_CPOL;	// clock on high when idle
	SPI2->CR1 |= SPI_CR1_MSTR;		// master mode
	SPI2->CR1 |= SPI_CR1_BR_0 | SPI_CR1_BR_1 | SPI_CR1_BR_2; 	// 42 MHz / 256 = 164kHz Baud Rate

	SPI2->CR2 &= ~0x00000000;
	SPI2->CR2 |= SPI_CR2_SSOE;		// SS output enable

	// enable SPI2
	SPI2->CR1 |= SPI_CR1_SPE;
}

void led_send(uint8_t data)
{
	SPI2->DR = data;
}

void led_clear(void)
{
	LED_Port->BSRR = 1<<(LED_CRL+16);
	delay_ms(1);
	LED_Port->BSRR = 1<<(LED_CRL);
}
void led_RCK(void)
{
	LED_Port->BSRR = 1<<(LED_RCK);
	_delay_us(5);
	LED_Port->BSRR = 1<<(LED_RCK+16);
}
void led_enable(void)
{
	LED_Port->BSRR = 1<<(LED_G+16);
}
