
# PROGRAM WITH FUNCTION TO GET AND ADD 10 INTEGERS IN AN ARRAY, A
#
.data                                
	A: .word 1, 10, -3, 5, 5, 6, 11, -2, 8, 2
	Result: .asciiz  "\n The sum is "
.text                               
main: 	la $a0, A
	li $a1, 10 
	jal AddFun			# call (jump to) function for addition
	move $t0, $v0			# move result to temp
	la $a0, Result 			
	li $v0, 4
	syscall				# print result message 
	move $a0, $t0
	li $v0, 1 
	syscall				# print result
	li $v0, 10                    	
	syscall                       	# stop
#
#  AddFun has two arguments: base of array (in $a0) and length of array (in $a1).
#  Returns result in $v0
#
AddFun: li $t0, 0			# initialize sum
	li $t3, 0			# initialize counter
next:	lw $t2, 0($a0)			# get next integer from array
	add $t0, $t0, $t2		# and add to sum 
	addi $a0, $a0, 4		# move pointer to next element of array 
	addi $t3, $t3, 1		# increment counter 
	blt $t3, $a1, next		# repeat if not done
	move $v0, $t0			# put result in $v0
	jr $ra				# return from function call

