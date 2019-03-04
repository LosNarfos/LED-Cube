#include "stm32f4xx.h"

#include "main.h"

#include "discovery.h"
#include "discovery_ex.h"
#include "lcd.h"
#include "led.h"

volatile uint32_t counter = 0;
volatile uint32_t us = 0;
//volatile uint32_t test = 0;

volatile uint8_t mux = 0;
uint8_t data[] = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
		0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
		0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
		0x18};

uint8_t data2[3][8] = {
		{ 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07 },
		{ 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F },
		{ 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17 },
		};

uint8_t led[25][8];

void SysTick_Handler(void)
{
	// called every 1ms
	counter++;
	//led_sendLayer(mux, data2);

	/*
	if(test == 0)
	{
		led_sendLayer(mux, data2);
		//LED_Port->BSRR = 1<<(LED_LE+16);
		//LED_Port->BSRR = 1<<(LED_LE+16);
		test = 1;
	}
	else
	{
		test = 0;
		//LED_Port->BSRR = 1<<(LED_LE);
		//LED_Port->BSRR = 1<<(LED_LE);
	}*/
}

/*
 * @brief: blocking delay function +-1us resolution
 * @param: test
 * derived from TIM3
 */
void _delay_us(uint16_t us)
{
	TIM3->CNT = 0;
	while(TIM3->CNT < us);
}

/*
 * blocking delay function +-1ms resolution
 * derived from systick
 */
void delay_ms(uint32_t ms)
{
	uint32_t stamp = counter;
	while(counter < stamp+ms);
	counter = 0;
}

/*
 * main entry point
 */
int main(void) 
{
	discovery_basic_init();

    SysTick_Config(SystemCoreClock/1000);	// systick to 1ms

    /* configure PC8 as AF output for TIM3 */
    RCC->AHB1ENR |= RCC_AHB1ENR_GPIOCEN;
	GPIO_RGB_LED->MODER		&= ~(3<<(RGB_LED_Pin*2));		// clear
	GPIO_RGB_LED->MODER		|=  (2<<(RGB_LED_Pin*2));  		// alternate function
	GPIO_RGB_LED->OTYPER 	&= ~(1<<(RGB_LED_Pin*1));		// push pull
	GPIO_RGB_LED->OSPEEDR 	|=  (3<<(RGB_LED_Pin*2));		// high speed
	GPIO_RGB_LED->PUPDR	  	&= ~(3<<(RGB_LED_Pin*2));		// no pullup/down
	GPIO_RGB_LED->AFR[1]	&= ~GPIO_AFRH_AFSEL8_Msk;		// clear
	GPIO_RGB_LED->AFR[1]	|=  GPIO_AFRH_AFSEL8_1;			// AF to TIM3..5


    /* configure TIM3 to 1µs, used for _delay_us() and LED PWM example */
    RCC->APB2ENR |= RCC_APB2ENR_TIM9EN;		// activate clock
    TIM3->CR1 &= 0xFC00;					// normal up counter
    TIM3->PSC = 83;							// prescaler to 83 -> 1 tick every 1µs
    TIM3->ARR = 1000;						// 1000µs for overflow
    TIM3->CCMR2	&= ~0x00FF;					// clear
    TIM3->CCMR2 = 0x0068;					// set output compare mode to PWM1 (start high, then low)
    TIM3->CCER = TIM_CCER_CC3E;				// activate compare output channel 3
    TIM3->EGR |= TIM_EGR_UG;				// update event
    TIM3->CR1 |= TIM_CR1_CEN;				// activate timer
    TIM3->CCR3 = 50;


    //lcd_Init(16, 4, 2);
    //lcd_Home();
    //lcd_String("Ich_brauch'_mal_einen_standardsatz_mit_extra_vielen_Zeichen");

    led_init(data2, (uint8_t)25);


    led_start();
    delay_ms(5);


    while(1) {
    }

    return 0;
}
