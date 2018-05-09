
// Reset and Clock Control
#include "stm32f4xx.h"

#include "main.h"

#include "discovery.h"
#include "discovery_ex.h"
#include "lcd.h"

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

    /* configure TIM3 to 1µs, used for _delay_us() */
    RCC->APB1ENR |= RCC_APB1ENR_TIM3EN;		// activate clock
    TIM3->CR1 &= 0xFC00;					// normal up counter
    TIM3->PSC = 83;							// prescale to 83 -> 1 tick every 1µs
    TIM3->EGR |= TIM_EGR_UG;				// update event
    TIM3->CR1 |= TIM_CR1_CEN;				// activate timer

    _delay_us(50);

    lcd_Init(20, 4, 2);
    lcd_Home();
    lcd_String("Ich_brauch'_mal_einen_standardstatz_mit_extra_vielen_Zeichen");

    while(1)
    {
    	//lcd_WriteString("Test");
    	//delay_ms(1000);
    }

    return 0;
}
