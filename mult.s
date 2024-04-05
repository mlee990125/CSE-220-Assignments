# ALGORITHM: ASSUMES NON-ZERO, POSITIVE OPERANDS
#
# 1. Read Multiplicand 
# 2. Read Multiplier
# 3. Intialize Product to zero
# 4. Add Multiplicand to Product
# 5. Decrement Multiplier
# 6. If Multiplier is greater than zero, reapeat from (4)
# 7. Print Product
# 8. Stop

# CODE:
#
.data                                
	Op1: .asciiz  "\n Enter the multiplicand: "
	Op2: .asciiz  "\n Enter the multiplier: "
	Res: .asciiz  "\n The result is "
.text                               
main: 	li $v0, 4 
	la $a0, Op1			# print prompt for multiplicand
	syscall          				   
	li $v0, 5                     	# read multiplicand
	syscall     
	move $t1, $v0			# $t1 now contains multiplicand
	li $v0, 4 
	la $a0, Op2			# print prompt for multiplier
	syscall          				  
	li $v0, 5                     	# read multiplier
	syscall 
	move $t2, $v0			# $t2 now contains multiplier
	move $t0, $0          	     	# initialize product (in $t0) to zero              	 
again: 	add $t0, $t0, $t1		# add multiplicand to product	   
       	addi $t2, $t2, -1     		# decrement multiplier 
       	bgtz $t2, again   		# repeat addition if multiplier > 0
	li $v0, 4 
	la $a0, Res			# print message for output 
	syscall  
	li $v0, 1                     	
	move $a0, $t0                	
	syscall                       	# print result 
	li $v0, 10                    	
	syscall                       	# stop

