#include "stm32f4xx.h"

#include "main.h"

#include "discovery.h"
#include "discovery_ex.h"
#include "lcd.h"
#include "led.h"

volatile uint32_t counter = 0;
volatile uint32_t us = 0;
volatile uint32_t test = 0;

void SysTick_Handler(void)
{
	// called every 1ms
	counter++;
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
    RCC->APB1ENR |= RCC_APB1ENR_TIM3EN;		// activate clock
    TIM3->CR1 &= 0xFC00;					// normal up counter
    TIM3->PSC = 83;							// prescaler to 83 -> 1 tick every 1µs
    TIM3->ARR = 1000;						// 1000µs for overflow
    TIM3->CCMR2	&= ~0x00FF;					// clear
    TIM3->CCMR2 = 0x0068;					// set output compare mode to PWM1 (start high, then low)
    TIM3->CCER = TIM_CCER_CC3E;				// activate compare output channel 3

    TIM3->EGR |= TIM_EGR_UG;				// update event
    TIM3->CR1 |= TIM_CR1_CEN;				// activate timer

    TIM3->CCR3 = 50;

    _delay_us(50);

    lcd_Init(16, 4, 2);
    lcd_Home();
    lcd_String("Ich_brauch'_mal_einen_standardsatz_mit_extra_vielen_Zeichen");

    uint8_t data[8] = { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08 };

    led_init();
    led_clear();
    led_enable();
    _delay_us(10);

    led_send(data[0]);
    _delay_us(100);
    led_send(data[1]);
    _delay_us(100);
    led_send(data[2]);
    _delay_us(100);
    led_send(data[3]);
    _delay_us(100);
    led_send(data[4]);
    _delay_us(100);
    led_send(data[5]);
    _delay_us(100);
    led_send(data[6]);
    _delay_us(100);
    led_send(data[7]);

    _delay_us(60);
    led_RCK();


    while(1) {
    	//led_send(0xFF);
    	//_delay_us(70);
    	//led_RCK();
    	//_delay_us(1000);
    	//led_send(dummy);
    	//delay_ms(20);
    	/*
    	for(uint8_t i; i<256; i++) {
    		led_send(i);
    		delay_ms(10);
    	}*/
    }

    return 0;
}
