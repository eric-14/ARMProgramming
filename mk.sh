#!/bin/bash
#this is the assembly filename 
Sfilename=$1
linkerscript=$2 
filename=${Sfilename%.*} # search for the filename
objFile="${filename}"
objFile+=".o"
elfFile="${filename}.elf"
binaryFile="${filename}.bin"
echo "assembly filename is : $Sfilename"

echo "linkerScript is : $linkerscript"

echo "Object file will be : $objFile"
echo "ELF filename is : $elfFile"
arm-none-eabi-as -o $objFile $Sfilename #compile ts.s to ts.o 
arm-none-eabi-ld -T $linkerscript -o $elfFile $objFile # link ts.o to t.elf file 
echo "Printing Symbols in file \n \n"
arm-none-eabi-nm $elfFile                  #show symbols in t.elf 
echo "End of symbols \n\n"


arm-none-eabi-objcopy -O binary $elfFile  $binaryFile    #objcopy t.elf to t.bin 
qemu-system-arm -M versatilepb -kernel $binaryFile -nographic -serial null
