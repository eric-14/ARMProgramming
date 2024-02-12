    .text 
    .global start 

start: 
    ldr sp, =stack_top
    bl sum 
stop: b stop 

sum: 
    stmfd sp!, {r0-r5, lr}
    mov r0, #0
    ldr r1, =array           //load the r1 = &array[0]
    ldr r3, =N               //r3 = &N
    ldr r3, [r3]             //load the size of array in register r3  = 10 
loop:  
    ldr r2,[r1], #4         //
    add r0, r0,r2   // store the sum in register r0 
    sub r3, r3, #1  // decrement the value the size of r4 
   
    cmp r3, #0 
    bne loop 
    ldr r4,=result 
    str r0, [r4]  // store the r0 in result 
    //ldmfd sp!, {r0-r5, pc} 
// sum:
//     stmfd sp! {r0- r4,lr }
//     push fp
//      mov fp, sp
//      mov r0,4[ fp]
//      mov r1,8[fp]
//      add r0, r0, r1
//      ldmfd sp!, {r0-r5, pc}

result: .word 0 
N: .word 10                  // size of array  
array: .word 1,2,3,4,5,6,7,8,9,10 // array 

