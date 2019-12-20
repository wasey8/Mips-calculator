.data
int1: .asciiz "Enter 1st number:"
int2: .asciiz "Enter 2nd number:"
select: .asciiz "Press 1 for addition,2 for subtraction,3 for multiplication,4 to division:"

.text
.globl main
main:
#Input 1
li $v0,4
la $a0,int1
syscall
li $v0,5
syscall
move $t0,$v0 

#input 2
li $v0,4
la $a0,int2
syscall
li $v0,5
syscall
move $t1,$v0 

#Select input
li $v0,4
la $a0,select
syscall
li $v0,5
syscall
move $t2,$v0

#if else 
beq $t2, 1, addition
beq $t2, 2, subtraction
beq $t2, 3, multiplication
beq $t2, 4, division

# call procedures
addition:
jal sumnumbers
move $a0,$v0
li $v0,1
syscall
li $v0, 10
syscall

subtraction:
jal subnumbers
move $a0,$v0
li $v0,1
syscall
li $v0, 10
syscall

multiplication:
jal mulnumbers
move $a0,$v0
li $v0,1

syscall
li $v0, 10
syscall

division:
jal divnumbers
move $a0,$v0
li $v0,1
syscall
li $v0, 10
syscall

sumnumbers:
add $v0, $t0, $t1
jr $ra

subnumbers:
sub $v0, $t0, $t1
jr $ra

mulnumbers:
mul $v0, $t0, $t1
jr $ra

divnumbers:
div $v0, $t0, $t1
jr $ra
