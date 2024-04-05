# String manipulation example. Code to change every 'a' in a string to 'X'
#
.data                                
	Line: .asciiz  "\n The man bit the dog, again and again. Nasty!"
.text                               
main: 	li $v0, 4 
	la $a0, Line			# print input string
	syscall          				   
	la $a0, Line			# load pointer to first character in string
	li $a1, 'a'
	li $a2, 'X'
	jal Change
	li $v0, 4 
	la $a0, Line			# print changed string
	syscall          			
	li $v0, 10                    	
	syscall                       	# stop
# 
Change: 
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp) 
	li $t0, 0			# ASCII code for NULL character (end-of-string marker)
	lb $t1, 0($a0)
	bne $t0, $t1, cont1		# check that string is not empty
	addi $sp, $sp, 8 		
	jr $ra
   # base case
cont1: 	bne $a1, $t1, cont2
	sb $a2, 0($a0) 			# replacement
   # recursive case
cont2: 	addi $a0, $a0, 1
	jal Change
	lw $ra, 0($sp) 
	lw $a0, 4($sp) 
	addi $sp, $sp, 8 
	jr $ra
	

