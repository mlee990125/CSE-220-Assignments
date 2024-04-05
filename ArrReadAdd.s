
# PROGRAM TO READ 10 INTEGERS INTO AN ARRAY, A, ADD GET THEN ADD THEM
#
.data                                
	A: .space 40 			# space for 10 integers (4*10 bytes)
	Prompt: .asciiz  "Enter a number: "
	Result: .asciiz  "\n The sum is "
.text                               
main: 	li $t3, 0			# initialize counter
	li $t4, 10			# set counter limit 
	la $t1, A			# load pointer to (1st) element of array
nextR:	la $a0, Prompt
	li $v0, 4
	syscall				# prompt for net number
	li $v0, 5
	syscall				# read next integer
	sw $v0, 0($t1)			# put integer read into next array slot
	addi $t1, $t1, 4		# move pointer to next element of array 
	addi $t3, $t3, 1		# increment counter 
	blt $t3, $t4, nextR		# repeat if not done
	#
	#				DONE READING, NOW ADD
	# 
	li $t0, 0			# initialize sum
	li $t3, 0			# re-initialize counter
	li $t4, 10			# initialize counter limit 
	la $t1, A			# load pointer to (1st) element of array
nextA:	lw $t2, 0($t1)			# get next integer from array
	add $t0, $t0, $t2		# and add to sum 
	addi $t1, $t1, 4		# move pointer to next element
	addi $t3, $t3, 1		# increment counter 
	blt $t3, $t4, nextA		# repeat if not done
	la $a0, Result 			
	li $v0, 4
	syscall				# print result message 
	move $a0, $t0
	li $v0, 1 
	syscall				# print result
	li $v0, 10                    	
	syscall                       	# stop

