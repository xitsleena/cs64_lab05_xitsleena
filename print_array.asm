# print_array.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
	# TODO: Write your initializations here
    myarray: .word 1 2 3 4 5 6 7 8 9 10
    content: .asciiz "The contents of the array are:\n"
    endl: .asciiz "\n"
.text
printA:
    # TODO: Write your function code here
    # set i = 0 
    li $t0, 0

loop:
    # see if x < array length
    slt $t4, $t0, $a1

    # jump out if not true 
    beq $t4, $zero, loopend
   
    # get myarray base 
    la $a0, myarray

    # shift index
    sll $t1, $t0, 2
    add $t2, $t1, $a0
    lw $t3, 0($t2)

    # print x[i] out, with a newline
    li $v0, 1
    move $a0, $t3
    syscall
    
    li $v0, 4
    la $a0, endl
    syscall

    # increment index 
    addi $t0, $t0, 1

    # restart loop 
    j loop

loopend: 
    jr $ra

main:
    # $a0 = arr[10], $a1 = alength 
    li $a1, 10
    la $a0, myarray

    # cout << "the contents of the array are:\n"
    li $v0, 4
    la $a0, content
    syscall

    #printA(arr,alength)
    jal printA

exit:
	li $v0, 10
    syscall

