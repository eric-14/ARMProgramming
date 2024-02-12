ENTRY(start)

SECTIONS 
{
    . = 0x10000; /*loading address required by Qemu*/ 
    .text : { *(.text)}  /* all text in this section */ 
    .data : { *(.data)} /* all data in .data section*/ 
    .bss : { *(.bss) }  /* all bss in .bss section */ 
    . =ALIGN(8); 
        . =. + 0x1000;    /* 4KB stack space */ 
    stack_top = .;  /* stacktop is symbol exported by linker   */ 
}