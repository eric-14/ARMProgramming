#pragma once 
/**
 * define flag registers for uart 
 * define the data register for uart 
 * define function init 
 * define function getc 
 * define function putc 
 * 
 * 
 * Note registers in this case of arm are just memory offsets from the base address of the uart peripheral 
*/

#define UDR 0x00
#define UFR  0x18 

#define TXFE  0x80
#define RXFF  0x40
#define TXFF 0x20
#define RXFE 0x10



/**
 * Function uget(uart *up, char *C); 
 * Parameters 
 *          uart up struct of uart 
 * @returns 
 *  int value  ASCII equivalent of returned character
 * 
*/

int ugetc(UART *up);

/**
 * @parameters 
 *      uart struct and pointer to the character 
 *@returns 
    int value indicating whether operation was successfull or not 
*/
int uput(UART* up, char * c); 

/**
 * transmit a string 
 * 
 * 
 * NB: string should be null terminated otherwise UD undefined behaviour 
*/

int putString(UART *up, char * c);
/**
 * Receive string 
 * 
 * @parameters 
 * uart structure 
 * a buffer where the string is stored 
 * 
*/
int getString(UART *up, char *buff); 