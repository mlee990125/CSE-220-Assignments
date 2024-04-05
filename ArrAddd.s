
# PROGRAM TO GET AND ADD 10 INTEGERS IN AN ARRAY, A
#
.data                                
	A: .word 1, 10, -3, 5, 5, 6, 11, -2, 8, 2
	Result: .asciiz  "\n The sum is "
.text                               
main: 	li $t0, 0			# initialize sum
	li $t3, 0			# initialize counter
	li $t4, 10			# set counter limit 
	la $t1, A			# load pointer to (1st) element of array
next:	lw $t2, 0($t1)			# get next integer from array
	add $t0, $t0, $t2		# and add to sum 
	addi $t1, $t1, 4		# move pointer to next element of array 
	addi $t3, $t3, 1		# increment counter 
	blt $t3, $t4, next		# repeat if not done
	la $a0, Result 			
	li $v0, 4
	syscall				# print result message 
	move $a0, $t0
	li $v0, 1 
	syscall				# print result
	li $v0, 10                    	
	syscall                       	# stop

