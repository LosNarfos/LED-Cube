/*
 * Autor:  J. Kerdels 
 * Lizenz: CC BY 3.0
*/


// Definition der standard Integer-Typen
#include <stdint.h>

#include "discovery.h"
#include "stm32f4xx.h"



/* Die Methode discovery_init() initialisiert zunächst nur die
4 LEDs und den User-Button des discovery boards. */
void discovery_basic_init(void)
{
	/*
	 * LEDs hängen an Port D
	 *      PD12	Grün
	 *      PD13 	Orange
	 *      PD14	Rot
	 *      PD15	Blau
	 *
	 * - Clock für Port A und D aktivieren
	 * - LED Pins auf Output
	 * - LED Pins auf pushpullb
	 * - LED Pins auf Low Speed
	 * - LED Pins ohne PullUp/PullDown
	 */

	// Clocks aktivieren
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN | RCC_AHB1ENR_GPIODEN;

	// LED-Pins auf General purpose Output
	GPIOD->MODER &= ~(GPIO_MODER_MODER12 | GPIO_MODER_MODER13 | GPIO_MODER_MODER14 | GPIO_MODER_MODER15);
	GPIOD->MODER |= GPIO_MODER_MODER12_0 | GPIO_MODER_MODER13_0 | GPIO_MODER_MODER14_0 | GPIO_MODER_MODER15_0;

	// LED-Pins auf Push Pull
	GPIOD->OTYPER &= ~(GPIO_OTYPER_OT_12 | GPIO_OTYPER_OT_13 | GPIO_OTYPER_OT_14 | GPIO_OTYPER_OT_15);

	// LED-Pins auf Low Speed
	GPIOD->OSPEEDR &= ~(GPIO_OSPEEDER_OSPEEDR12 | GPIO_OSPEEDER_OSPEEDR13 | GPIO_OSPEEDER_OSPEEDR14 | GPIO_OSPEEDER_OSPEEDR15);

	// LED-Pins ohne PullUp/PullDown
	GPIOD->PUPDR &= ~(GPIO_PUPDR_PUPDR12 | GPIO_PUPDR_PUPDR13 | GPIO_PUPDR_PUPDR14 |GPIO_PUPDR_PUPDR15 );

	// alle LEDs aus
	GPIOD->BSRR |= GPIO_BSRR_BR_12 | GPIO_BSRR_BR_13 | GPIO_BSRR_BR_14 | GPIO_BSRR_BR_15;

	// Taster

	// Taster-Pin auf Input
	GPIOA->MODER &= ~GPIO_MODER_MODER0;

	// Taster-Pin kein Pullup/Pulldown
	GPIOA->PUPDR &= ~GPIO_PUPDR_PUPDR0;


}





/* Die Methode discovery_acc_init() führt die Grundkonfiguration des
Beschleunigungssensors auf dem discovery board durch. */
void discovery_acc_init(void)
{
/* Das STM32F4 discovery board besitzt einen 3-Achsen Beschleunigungssensor
   (LIS302DL), der über das SPI-Protokoll angesprochen wird. Physikalisch ist
   der Sensor mit den GPIO-Pins PA5/SPI_SCK, PA6/SPI1_MISO, PA7/SPI1_MOSI
   verbunden. Zusätzlich sind an PE0 und PE1 zwei Interruptleitungen des
   LIS302DL angeschlossen. Hierüber kann der Beschleunigungssensor z.B.
   mitteilen, ob er sich gerade im freien Fall befindet. Derartige Messungen
   werden beispielsweise in Notebooks eingesetzt, um bei einem Sturz des
   Notebooks noch schnell die Leseköpfe der Festplatten in eine sichere
   Position zu bringen. Als letztes ist noch Pin PE2 zu erwähnen. Mit diesem
   Pin wählt man aus, ob der LIS302DL im SPI- oder im I2C-Modus kommunizieren
   soll. Für den SPI-Modus muss PE2 auf 0 stehen.
   PA5 bis PA7 müssen also als Alternate Function konfiguriert werden, PE0
   und PE1 als Input und PE2 als output. Vor allem müssen GPIO A und E
   zunächst einmal mit Takt versorgt werden (RCC_AHB1ENR, S.110 in [1]): */
   

	/* Wir konfigurieren nun PA5 bis PA7 als Alternate Function 5 (S.56 in [2]):
	Die Taktleitung SPI1_SCK an PA5 wird als Output-Push-Pull mit 2MHz
	konfiguriert (s.Tabelle 14 auf S.138 in [1]): */

	//MODER = 10, OTYPER = 0, OSPEEDR = 00, PUPDR = 00

	// Bits 10 und 11, S.148 in [1]:
	GPIOA->MODER &= 0xFFFFF3FF;
	GPIOA->MODER |= 0x00000800;

	// Bit 5, S.148 in [1]:
	GPIOA->OTYPER &= 0xFFFFFFDF;

	// Bits 10 und 11, S.149 in [1]:
	GPIOA->OSPEEDR &= 0xFFFFF3FF;

	// Bits 10 und 11, S.149 in [1]:
	GPIOA->PUPDR &= 0xFFFFF3FF;

	// Alternate Function 5, Bits 20 bis 23, S.152 in [1]:
	GPIOA->AFR[0] &= 0xFF0FFFFF;
	GPIOA->AFR[0] |= 0x00500000;

	/* Der SPI1 Master In Slave Out (MISO) an PA6 wird als Input Open-Drain mit
	2MHz konfiguriert (s.Tabelle 14 auf S.138 in [1]): */

	//MODER = 10, OTYPER = 1, OSPEEDR = 00, PUPDR = 00

	// Bits 12 und 13, S.148 in [1]:
	GPIOA->MODER &= 0xFFFFCFFF;
	GPIOA->MODER |= 0x00002000;

	// Bit 6, S.148 in [1]:
	GPIOA->OTYPER |= 0x00000040;

	// Bits 12 und 13, S.149 in [1]:
	GPIOA->OSPEEDR &= 0xFFFFCFFF;

	// Bits 12 und 13, S.149 in [1]:
	GPIOA->PUPDR &= 0xFFFFCFFF;

	// Alternate Function 5, Bits 24 bis 27, S.152 in [1]:
	GPIOA->AFR[0] &= 0xF0FFFFFF;
	GPIOA->AFR[0] |= 0x05000000;

	/* Der SPI1 Master Out Slave In (MOSI) an PA7 wird wieder als Output-Push-Pull
	mit 2MHz konfiguriert (s.Tabelle 14 auf S.138 in [1]): */

	//MODER = 10, OTYPER = 0, OSPEEDR = 00, PUPDR = 00

	// Bits 14 und 15, S.148 in [1]:
	GPIOA->MODER &= 0xFFFF3FFF;
	GPIOA->MODER |= 0x00008000;

	// Bit 7, S.148 in [1]:
	GPIOA->OTYPER &= 0xFFFFFF7F;

	// Bits 14 und 15, S.149 in [1]:
	GPIOA->OSPEEDR &= 0xFFFF3FFF;

	// Bits 14 und 15, S.149 in [1]:
	GPIOA->PUPDR &= 0xFFFF3FFF;

	// Alternate Function 5, Bits 28 bis 31, S.152 in [1]:
	GPIOA->AFR[0] &= 0x0FFFFFFF;
	GPIOA->AFR[0] |= 0x50000000;


	/* Nachdem nun die SPI-Pins konfiguriert sind, müssen wir PE2 noch als
	Output-Push-Pull konfigurieren und auf 0 setzen, damit SPI als Protokoll auf
	dem Beschleunigungssensor aktiviert wird: */

	//MODER = 01, OTYPER = 0, OSPEEDR = 00, PUPDR = 00

	// Bits 4 und 5, S.148 in [1]:
	GPIOE->MODER &= 0xFFFFFFCF;
	GPIOE->MODER |= 0x00000010;

	// Bit 2, S.148 in [1]:
	GPIOE->OTYPER &= 0xFFFFFFFB;

	// Bits 4 und 5, S.149 in [1]:
	GPIOE->OSPEEDR &= 0xFFFFFFCF;

	// Bits 4 und 5, S.149 in [1]:
	GPIOE->PUPDR &= 0xFFFFFFCF;

	// Pin PE2 auf 0 setzen
	//GPIOE->BSRRH |= 0x0004;




}


