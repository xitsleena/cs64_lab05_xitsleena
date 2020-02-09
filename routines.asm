# routines.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
routineB:
    # TODO: Write your function code here
    # $s1 = r - 5
    addi $s1, $a1, -5
    
    # (r-5) * 4
    sll $v0, $s1, 2

    jr $ra 
routineA:
    # TODO: Write your function code here
    addi $sp, $sp, -4 
    sw $ra, 0($sp)
    

    # $t1 = 2*x
    add $t1, $a0, $a0 

    # $a1 = 3*y
    add $t2, $a1, $a1
    add $a1, $t2, $a1

    jal routineB

    # a1 = 2*x + routineB(3*y)
    # $v0 = routineB(3*y)
    add $a1, $t1, $v0
    
    # $a1 = s1 -1 
    addi $a1, $a1, -1

    jal routineB

    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
main:
    # $a0 = a, $a1 = b
    li $a0, 5
    li $a1, 7

    # routineA(a,b)
    jal routineA

    move $t0, $v0

    li $v0, 1
    move $a0, $t0
    syscall

exit:
    li $v0, 10 
    syscall
