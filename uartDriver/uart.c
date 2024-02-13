#include "uart.h"
#define numberOfUarts 4 
typedef volatile struct uart{
	char *base; 
	int n;
}UART;

UART uart[numberOfUarts]; 

UART *up;

int
uartInit()
{
	
	for(int i =0; i < numberOfUarts; i++){
		//defining the uart. Starting address and their value 
		up = &uart[i];
		up->base = (char *)(0x101F1000 + i x 0x1000);
		up->n = i;  

	}
	uart[3].base = (char *)(0x10009000);
}

int 
ugetc(UART *up)
{
	//poll until the register RXFE is not empty
	while( *(up->base + UFR) & RXFE); 

	//there is a message in Data register 

	return *(up->base + UDR); 
}

int 
uputc(UART *up, char *c )
{
	//wait until the transmit register is empty 
	while( *(up->base + UFR) & TXFF); 

	//At this point the transmit buffer is empty
	//place the data to be sent in UDR register 

	*(up->base + UDR)  = *c ; 
	return 1; //operation was a success 
}

int 
putString(UART *up, char *c )
{
	//Loop when transmit is full and wait for it to be empty 
	while(*(up->base + UFR) & TXFF); 

	while(*c != "/r" || *c != "/n")
	{
		uputc(up, c); 
		c++; 
	}

}

int 
getString(UART *up, char *buff[])
{
	//loop when there is a value inside the buffer 
	int i =0;
	while(*(up->base + UFR) & RXFF)
	{
		*buff[i] = *(up->base + UDR); 
		i++;
	}
}