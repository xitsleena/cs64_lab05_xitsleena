# conversion.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    
    li $t4, 3
    li $t5, 0
    li $t6, 5

    li $v0, 0
loop:
    beq $t5, $t6, return

    # $t0 = 2x
    add $t0, $a0, $a0 
    # $s1 = 2x - y 
    sub $s1, $t0, $a1
    # $v0 = z + 2x -y
    add $v0, $v0, $s1
    
    
    blt $a0, $t4, afterif
    addi $a1, $a1, -1

afterif:
    # x +=1
    addi $a0, $a0, 1
    
    # increment index
    addi $t5, $t5, 1
    j loop

return:
    jr $ra
main:
    li $a0, 5 
    li $a1, 7

    # int c = conv(a,b)

    jal conv

    move $t1, $v0

    # cout << c 
    li $v0, 1
    move $a0, $t1
    syscall 

exit:
	li $v0, 10
    syscall

