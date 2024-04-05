
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
#  AddFunR has two arguments: base of array (in $a0) and length of array (in $a1).
#  Returns result in $v0
#  Recursive
#
AddFun:
	# array of size N
	addi $sp, $sp, -16	# allocate four slots on stack	
	sw $ra, 0($sp)		# save $ra
	sw $t0, 4($sp)		# save $t0
	sw $a1, 8($sp)		# save $a1
	sw $a0, 12($sp)		# save $a0
        #############################################################################
		#
		# base case: array of size 1 
		#
	lw $v0, 0($a0)		# return the element (the last element of array)
	beq $a1, 1, done	# when N = 1, stop the summation 
		#
		# recursive case: array of size N-1
		# 
	lw $t0, 0($a0) 		# load the first element
	addi $a0, $a0, 4	# pointer to next element
	sub $a1, $a1, 1		# decrement N
	jal AddFun		# recursive function call
	add $v0, $t0, $v0 	# combine results from base case and rest 
        ############################################################################
done:	lw $a1, 8($sp)		# restore $a1
	lw $t0, 4($sp)		# restore $t0
	lw $ra, 0($sp) 		# restore $ra
	lw $a0, 12($sp)		# restore $a0
	addi $sp, $sp, 16 	# deallocate stack space
	jr $ra			# return from function