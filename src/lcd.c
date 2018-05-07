/*
 * lcd.c
 *
 *  Created on: 16.07.2017
 *      Author: Simon Coenen
 */

#include "lcd.h"
#include "stm32f4xx.h"
#include "main.h"


volatile uint32_t time_ms = 0;

void lcd_Enable(void);
void lcd_Out(uint8_t data);



void lcd_Command(uint8_t data) {
	GPIO_LCD->BSRR = 1 << (LCD_RS_Pin+16);
	lcd_Out(data);
	_delay_us(5);
	lcd_Out(data<<4);

	_delay_us(42);
}

void lcd_Data(uint8_t data) {
	GPIO_LCD->BSRR = 1<<(LCD_RS_Pin);

	lcd_Out(data);
	lcd_Out(data<<4);

	_delay_us(46);
}

void lcd_Init(uint8_t lines, uint8_t columns, uint8_t linemode)
{
	/* activate peripheral clock */
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOEEN;

	/* configure gpio */
	GPIO_LCD->MODER   &= ~(3<<(LCD_D4_Pin*2) | 3<<(LCD_D5_Pin*2) | 3<<(LCD_D6_Pin*2) | 3<<(LCD_D7_Pin*2)| 3<<(LCD_RS_Pin*2) | 3<<(LCD_RW_Pin*2) | 3<<(LCD_E_Pin*2));	// clear
	GPIO_LCD->MODER	  |=  (1<<(LCD_D4_Pin*2) | 1<<(LCD_D5_Pin*2) | 1<<(LCD_D6_Pin*2) | 1<<(LCD_D7_Pin*2)| 1<<(LCD_RS_Pin*2) | 1<<(LCD_RW_Pin*2) | 1<<(LCD_E_Pin*2));	// general purpose out
	GPIO_LCD->OTYPER  &= ~(1<<(LCD_D4_Pin*1) | 1<<(LCD_D5_Pin*1) | 1<<(LCD_D6_Pin*1) | 1<<(LCD_D7_Pin*1)| 1<<(LCD_RS_Pin*1) | 1<<(LCD_RW_Pin*1) | 1<<(LCD_E_Pin*1));	// push pull
	GPIO_LCD->OSPEEDR |=  (3<<(LCD_D4_Pin*2) | 3<<(LCD_D5_Pin*2) | 3<<(LCD_D6_Pin*2) | 3<<(LCD_D7_Pin*2)| 3<<(LCD_RS_Pin*2) | 3<<(LCD_RW_Pin*2) | 3<<(LCD_E_Pin*2));	// low speed
	GPIO_LCD->PUPDR	  &= ~(3<<(LCD_D4_Pin*2) | 3<<(LCD_D5_Pin*2) | 3<<(LCD_D6_Pin*2) | 3<<(LCD_D7_Pin*2)| 3<<(LCD_RS_Pin*2) | 3<<(LCD_RW_Pin*2) | 3<<(LCD_E_Pin*2));	// no pullup/down

	// output to low
	GPIO_LCD->BSRR |= (1<<(LCD_D4_Pin+16)
			| 1<<(LCD_D5_Pin+16)
			| 1<<(LCD_D6_Pin+16)
			| 1<<(LCD_D7_Pin+16)
			| 1<<(LCD_RS_Pin+16)
			| 1<<(LCD_RW_Pin+16)
			| 1<<(LCD_E_Pin+16));

	/* wait for LCD to boot up */
	delay_ms(50);

	/* Soft-reset send 3 times  */
	GPIO_LCD->BSRR = (1<<LCD_D4_Pin) | (1<<LCD_D5_Pin) | (1<<(LCD_D6_Pin+16) | (1<<(LCD_D7_Pin+16)));
	lcd_Enable();
	_delay_us(100);
	lcd_Enable();
	_delay_us(100);
	lcd_Enable();
	_delay_us(100);

	// Enable 4-Bit Mode
	lcd_Out( LCD_SET_FUNCTION | LCD_FUNCTION_4BIT );									// 4-Bit Mode
	lcd_Command(LCD_SET_FUNCTION | LCD_FUNCTION_4BIT | LCD_FUNCTION_2LINE |	LCD_FUNCTION_5X8);	// 4-bit Mode / 2 Lines / 5x8
	lcd_Command(LCD_SET_DISPLAY | LCD_DISPLAY_ON | LCD_CURSOR_ON | LCD_BLINKING_ON);			// Display on / Cursor on / Blinking on
	lcd_Command(LCD_CLEAR_DISPLAY);
	delay_ms(3);
	lcd_Command(LCD_SET_ENTRY |	LCD_ENTRY_INCREASE | LCD_ENTRY_NOSHIFT);						// Cursor increment / no Scrolling														// clear display
}

void lcd_Clear(void) {
	lcd_Command(LCD_CLEAR_DISPLAY);
	delay_ms(2);
}

void lcd_Home(void) {
	lcd_Command(LCD_CURSOR_HOME);
	delay_ms(2);
}

void lcd_Set_Cursor(uint8_t x, uint8_t y) {
	uint8_t data;

	switch (y)
	{
		case 0:    // 1st line
			data = LCD_SET_DDADR + LCD_DDADR_LINE1 + x;
			break;

		case 1:    // 2nd line
			data = LCD_SET_DDADR + LCD_DDADR_LINE2 + x;
			break;

		case 2:    // 3rd line
			data = LCD_SET_DDADR + LCD_DDADR_LINE3 + x;
			break;

		case 3:    // 4th line
			data = LCD_SET_DDADR + LCD_DDADR_LINE4 + x;
			break;

		default:
			return;                                   // if wrong line was selected
	}

	lcd_Command(data);
}

void lcd_Char(char data) {
	lcd_Data(data);
}

void lcd_String(const char *data)
{
    while(*data != '\0')
    	lcd_Data(*data++);
}

void LCD_GenerateChar(uint8_t code, const uint8_t *data)
{
    // Set startposition of the custom char
    lcd_Command( LCD_SET_CGADR | (code<<3) );

    // Transfer Bitmask
    for (uint8_t i=0; i<8; i++)
    {
        lcd_Data(data[i]);
    }
}

void lcd_Enable(void)
{
	GPIO_LCD->BSRR = (1<<LCD_E_Pin);
	_delay_us(LCD_ENABLE_US);
	GPIO_LCD->BSRR = (1<<(LCD_E_Pin+16));
}

void lcd_Out(uint8_t data)
{
	data &= 0xF0;
	GPIO_LCD->BSRR = data<<4 | (~data & 0xF0)<<20;
	lcd_Enable();
}

