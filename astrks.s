# ALGORITHM: ASSUMES N>0
# 	The algorithms consists of two loops, one nested within the other.
#	The outer loop is for each line, corresponding to N, N-1, .., 1.
#	For each line, the inner loop is for the printing of the asterisks.
#
# 1. Read N 
# 2. Initialize Line Counter to N
# 3. Print new-line
# 4. Initialize Asterisks Counter to zero
# 5. Print an askerisk
# 6. Increment Asterisks Counter 
# 7. If Asterisks Counter < Line Counter, repeat from (5)
# 8. Decrement Line Counter 
# 9. If Line Counter > 0, repeat from (3)
# 10. Stop



# CODE:
#
.data                                
	PromptN: .asciiz  "\n Enter N: "
.text                               
main: 	li $v0, 4 
	la $a0, PromptN			# print prompt for N
	syscall          				   
	li $v0, 5                     	# read N
	syscall     
	move $t1, $v0			# initialize line counter (in $t1)
outerL:	li $a0, '\n' 
	li $v0, 11			# print new line
	syscall
	move $t2, $0          	     	# initialize asterisks counter (in $t2) to zero    
innerL:	li $a0, '*' 
	li $v0, 11			# print an asterisk
	syscall
	addi $t2, $t2, 1		# increment askerisks counter
	blt $t2, $t1, innerL  		# repeat inner loop if asterisks counter < line counter  	    
       	addi $t1, $t2, -1     		# decrement line counter 
       	bgtz $t1, outerL   		# repeat outer loop if  line counter > 0
	li $v0, 10                    	
	syscall                       	# stop

