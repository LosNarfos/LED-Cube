/*
 * led.c
 *
 *  Created on: May 12, 2018
 *      Author: simon
 */

#include "stm32f4xx.h"
#include "led.h"
#include "main.h"

void spi_config(void);
void gpio_config(void);
void dma_config(uint8_t *sourceAddress, uint8_t length);


void gpio_config(void)
{
	/*
	 * 	Pin		Name			Function			Hardware connection to
	 * ------------------------------------------------------------
	 * 	PB11	LED_OE			AF TIM2 CH4				TLC5616 OE
	 * 	PB13	LED_CLK			SPI2 CLK				TLC5916 CLK
	 * 	PB14	LED_LE			AF TIM1 CH2				TLC5616 LE
	 * 	PB15	LED_SDI			SPI2 MOSI				TLC5916 SDI
	 */

	/* activate clocks */
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOBEN;	// GPIOB

	/* configure GPIO */
	LED_Port->MODER &= ~(GPIO_MODER_MODE11_Msk | GPIO_MODER_MODE13_Msk | GPIO_MODER_MODE14_Msk | GPIO_MODER_MODE15_Msk);
	LED_Port->MODER |= GPIO_MODER_MODE11_1;		// LED_OE		alternate function	TIM2_CH4
	LED_Port->MODER |= GPIO_MODER_MODE13_1;		// LED_CLK 		alternate function	SPI_SCK
	LED_Port->MODER |= GPIO_MODER_MODE14_1;		// LED_LE		alternate function	TIM12_CH1
	LED_Port->MODER |= GPIO_MODER_MODE15_1;		// LED_SDI		alternate function	SPI_MOSI

	LED_Port->OTYPER &= ~(GPIO_OTYPER_OT11_Msk | GPIO_OTYPER_OT13_Msk | GPIO_OTYPER_OT14_Msk | GPIO_OTYPER_OT15_Msk);
	LED_Port->OTYPER &= ~GPIO_OTYPER_OT11;		// LED_OE		output push-pull
	LED_Port->OTYPER &= ~GPIO_OTYPER_OT13;		// LED_CLK		output push-pull
	LED_Port->OTYPER &= ~GPIO_OTYPER_OT14;		// LED_LE		output push-pull
	LED_Port->OTYPER &= ~GPIO_OTYPER_OT15;		// LED_SDI		output push-pull

	LED_Port->OSPEEDR &= ~(GPIO_OSPEEDR_OSPEED11_Msk | GPIO_OSPEEDR_OSPEED13_Msk | GPIO_OSPEEDR_OSPEED14_Msk | GPIO_OSPEEDR_OSPEED15_Msk);
	LED_Port->OSPEEDR |= GPIO_OSPEEDR_OSPEED11_1;	// LED_OE		high speed
	LED_Port->OSPEEDR |= GPIO_OSPEEDR_OSPEED13_1;	// LED_CLK		high speed
	LED_Port->OSPEEDR |= GPIO_OSPEEDR_OSPEED14_1;	// LED_LE		high speed
	LED_Port->OSPEEDR |= GPIO_OSPEEDR_OSPEED15_1;	// LED_SDI		high speed

	LED_Port->PUPDR &= ~(GPIO_PUPDR_PUPD11_Msk | GPIO_PUPDR_PUPD13_Msk | GPIO_PUPDR_PUPD14_Msk | GPIO_PUPDR_PUPD15_Msk);
	LED_Port->PUPDR &= ~GPIO_PUPDR_PUPD11;	// LED_OE		no pull-up, no pull-down
	LED_Port->PUPDR &= ~GPIO_PUPDR_PUPD13;	// LED_CLK		no pull-up, no pull-down
	LED_Port->PUPDR &= ~GPIO_PUPDR_PUPD14;	// LED_LE		no pull-up, no pull-down
	LED_Port->PUPDR &= ~GPIO_PUPDR_PUPD15;	// LED_SDI		no pull-up, no pull-down

	LED_Port->AFR[1] &= ~(GPIO_AFRH_AFSEL11_Msk | GPIO_AFRH_AFSEL13_Msk | GPIO_AFRH_AFSEL14_Msk | GPIO_AFRH_AFSEL15_Msk);
	LED_Port->AFR[1] |= GPIO_AFRH_AFSEL11_0;						// LED_OE		alternate function TIM2_CH4
	LED_Port->AFR[1] |= GPIO_AFRH_AFSEL13_2 | GPIO_AFRH_AFSEL13_0;	// LED_CLK		alternate function SPI2
	LED_Port->AFR[1] |= GPIO_AFRH_AFSEL14_3 | GPIO_AFRH_AFSEL14_0;	// LED_LE		alternate function TIM12_CH1
	LED_Port->AFR[1] |= GPIO_AFRH_AFSEL15_2 | GPIO_AFRH_AFSEL15_0;	// LED_SDI		alternate function SPI2
}

void spi_config(void)
{
	/*
	 *  SPI2 configuration
	 */

	// activate clock
	RCC->APB1ENR |= RCC_APB1ENR_SPI2EN;		// SPI2

	SPI2->CR1 &= ~0x00000000;
	SPI2->CR1 |= SPI_CR1_MSTR;		// master mode
	SPI2->CR1 |= SPI_CR1_BR_0 | SPI_CR1_BR_1 | SPI_CR1_BR_2; 	// 42 MHz / 256 = 164kHz Baud Rate

	SPI2->CR2 &= ~0x00000000;
	SPI2->CR2 |= SPI_CR2_SSOE | SPI_CR2_TXDMAEN;		// SS output enable

	// enable SPI2
	SPI2->CR1 |= SPI_CR1_SPE;
}

void timer_config(void)
{
	/*
	 * Timer configuration for Latch and OuputEnable Pins
	 *
	 * Timer 2
	 * 	- Channel 3 	-> Mapped to GPIO OE Pin
	 * 	- Channel 4		-> Mapped to GPIO LE Pin
	 */

	// Timer for Output Enable (OE)
    RCC->APB1ENR |= RCC_APB1ENR_TIM2EN;		// activate clock
    TIM2->CR1 = TIM_CR1_OPM;				// activate one-pulse mode
    TIM2->PSC = 84;							// prescaler to 84 -> one tick every µs (timer runs with 2x APB1 clock)
    TIM2->CCR4 = 1450;						// delay of 1.45ms for pulse
    TIM2->ARR = 1499;						// 1.50ms equals 50us pulse width
    TIM2->CCMR2 = TIM_CCMR2_OC4M_1 |TIM_CCMR2_OC4M_2;	//pwm mode 110, active low
    TIM2->CCER = TIM_CCER_CC4E;				// activate compare output channel 4
    TIM2->EGR |= TIM_EGR_UG;				// update event

    // Timer 12 for Latch Enable (LE)
    RCC->APB1ENR |= RCC_APB1ENR_TIM12EN;	// activate clock
    TIM12->CR1 = TIM_CR1_OPM;				// activate one-pulse mode
    TIM12->PSC = 84;						// prescaler to 84 -> one tick every µs (timer runs with 2x APB1 clock)
    TIM12->CCR1 = 1290;						// delay of 1.29ms for pulse
    TIM12->ARR = 1299;						// 1.3ms equals 10us pulse widt
    TIM12->CCMR1 = TIM_CCMR1_OC1M_0 | TIM_CCMR1_OC1M_1 |TIM_CCMR1_OC1M_2;	//pwm mode 111, active high
    TIM12->CCER = TIM_CCER_CC1E;			// activate compare output channel 1
    TIM12->EGR |= TIM_EGR_UG;				// update event
}

void dma_config(uint8_t *sourceAddress, uint8_t length)
{
	/*
	 * DMA configuration
	 */

	// activate RCC for DMA
	RCC->AHB1ENR |= RCC_AHB1ENR_DMA1EN;

	// switch off DMA
	DMA1_Stream4->CR &= ~DMA_SxCR_EN;
	while ((DMA1_Stream4->CR & DMA_SxCR_EN) == 1);

	// clear status bits
	DMA1->LIFCR |= DMA_LIFCR_CFEIF0 | DMA_LIFCR_CDMEIF0 | DMA_LIFCR_CTEIF0 | DMA_LIFCR_CHTIF0 | DMA_LIFCR_CTCIF0;

	//set DMA source
	DMA1_Stream4->M0AR = (uint32_t)(sourceAddress);

	// set DMA destination
	DMA1_Stream4->PAR = (uint32_t)(&(SPI2->DR));

	// set number of elements to transfer
	DMA1_Stream4->NDTR = length;

	// configure memory to peripheral, circular
		// Direction: Memory to peripheral
		// Memory increment mode: Memory address is incremented
	DMA1_Stream4->CR = DMA_SxCR_DIR_0 | DMA_SxCR_MINC;

}

void led_init(uint8_t data[], uint8_t length)
{
	gpio_config();
	spi_config();
	timer_config();
	dma_config(data, length);
}

void led_outputEnable(void)
{
	LED_Port->BSRR = 1<<(LED_OE+16);
}

void led_sendLayer(uint8_t mux, uint8_t data[])
{
	// shut off DMA Stream to SPI-Interface (should be off by now anyway)
	DMA1_Stream4->CR &= ~DMA_SxCR_EN;
	while ((DMA1_Stream4->CR & DMA_SxCR_EN) == 1);

	//
	//DMA_HIFCR_C  DMA_HISR_HTIF4 | DMA_HISR_FEIF4 |
	DMA1->HIFCR = DMA_HISR_TCIF4;
	DMA1_Stream4->NDTR = 25;
    DMA1_Stream4->CR |= DMA_SxCR_EN;

    // start timer for LATCH witch gives a 2µs pulse after DMA transfer complete (after ~40µs)
    TIM12->SR = 0x00;
    TIM12->CR1 |= TIM_CR1_CEN;

    // start timer for OE which gives a 10µs low pulse after DMA and LATCH complete to prevent LED-ghosting (after ~45µs)
    TIM2->SR = 0x00;
    TIM2->CR1 |= TIM_CR1_CEN;

}
