/*
 * lcd.h
 *
 *	LC-Display definition for using HC7088 controller in 4bit mode
 */

#ifndef LCD_H_
#define LCD_H_


#include "stm32f4xx.h"

/*
 * GPIO definition
 */
#define GPIO_LCD 		GPIOE	// LCD port				  pins of LCD
#define LCD_D4_Pin		8		// LCD Data 4				11
#define LCD_D5_Pin		9		// LCD Data 5				12
#define LCD_D6_Pin		10		// LCD Data 6				13
#define LCD_D7_Pin		11  	// LCD Data 7				14
#define LCD_RS_Pin		12  	// LCD Register select		4
#define LCD_RW_Pin		13  	// LCD read/write			5
#define LCD_E_Pin		14		// LCD Enable				6

#define LCD_PWM_Port 	GPIOA	// LCD PWM signal
#define LCD_PWM_Pin		1 		// for brightness control	to base of npn transistor

/*
 * timing definitions
 */
#define LCD_BOOTUP_MS           15
#define LCD_ENABLE_US           20
#define LCD_WRITEDATA_US        46
#define LCD_COMMAND_US          42

#define LCD_SOFT_RESET_MS1      5
#define LCD_SOFT_RESET_MS2      1
#define LCD_SOFT_RESET_MS3      1
#define LCD_SET_4BITMODE_MS     5

#define LCD_CLEAR_DISPLAY_MS    2
#define LCD_CURSOR_HOME_MS      2

/* For 4x20 character display */
/* There is a 0x14 address gap between Line 2 and 3*/
#define LCD_NO_OF_LINES			2
#define LCD_NO_OF_COLUMNS		20

#define LCD_DDADR_LINE1         0x00//0x00
#define LCD_DDADR_LINE2         0x40//0x40
#define LCD_DDADR_LINE3         0x14//0x10
#define LCD_DDADR_LINE4         0x54//0x50

// Clear Display -------------- 0b00000001
#define LCD_CLEAR_DISPLAY       0x01

// Cursor Home ---------------- 0b0000001x
#define LCD_CURSOR_HOME         0x02

// Set Entry Mode ------------- 0b000001xx
#define LCD_SET_ENTRY           0x04

#define LCD_ENTRY_DECREASE      0x00
#define LCD_ENTRY_INCREASE      0x02
#define LCD_ENTRY_NOSHIFT       0x00
#define LCD_ENTRY_SHIFT         0x01

// Set Display ---------------- 0b00001xxx
#define LCD_SET_DISPLAY         0x08

#define LCD_DISPLAY_OFF         0x00
#define LCD_DISPLAY_ON          0x04
#define LCD_CURSOR_OFF          0x00
#define LCD_CURSOR_ON           0x02
#define LCD_BLINKING_OFF        0x00
#define LCD_BLINKING_ON         0x01

// Set Shift ------------------ 0b0001xxxx
#define LCD_SET_SHIFT           0x10

#define LCD_CURSOR_MOVE         0x00
#define LCD_DISPLAY_SHIFT       0x08
#define LCD_SHIFT_LEFT          0x00
#define LCD_SHIFT_RIGHT         0x04

// Set Function --------------- 0b001xxxxx
#define LCD_SET_FUNCTION        0x20

#define LCD_FUNCTION_4BIT       0x00
#define LCD_FUNCTION_8BIT       0x10
#define LCD_FUNCTION_1LINE      0x00
#define LCD_FUNCTION_2LINE      0x08
#define LCD_FUNCTION_5X8        0x00
#define LCD_FUNCTION_5X10       0x04

#define LCD_SOFT_RESET          0x30

// Set CG RAM Address --------- 0b01xxxxxx  (Character Generator RAM)
#define LCD_SET_CGADR           0x40

#define LCD_GC_CHAR0            0
#define LCD_GC_CHAR1            1
#define LCD_GC_CHAR2            2
#define LCD_GC_CHAR3            3
#define LCD_GC_CHAR4            4
#define LCD_GC_CHAR5            5
#define LCD_GC_CHAR6            6
#define LCD_GC_CHAR7            7

// Set DD RAM Address --------- 0b1xxxxxxx  (Display Data RAM)
#define LCD_SET_DDADR           0x80

#define LCD_DD_CHAR0            0
#define LCD_DD_CHAR1            1
#define LCD_DD_CHAR2            2
#define LCD_DD_CHAR3            3
#define LCD_DD_CHAR4            4
#define LCD_DD_CHAR5            5
#define LCD_DD_CHAR6            6
#define LCD_DD_CHAR7            7


void lcd_Init(uint8_t lines, uint8_t columns, uint8_t linemode);
void lcd_Clear(void);
void lcd_Home(void);
void lcd_Set_Cursor(uint8_t x, uint8_t y);
void lcd_Char(char data);
void lcd_String(const char *data);

#endif /* LCD_H_ */
