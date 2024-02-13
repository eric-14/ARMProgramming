//Assembly file that loads main 

.global start, stack_top 

start: 
	ldr sp, =stack_top   // define the stack pointer 
	bl main 
	b . 
