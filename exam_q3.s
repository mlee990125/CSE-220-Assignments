.data
 Prompt: .asciiz "\n Enter N "
 A: .word 3, 4, 5, 1, 2, 3, 9, 10, 11
 B: .word 3, 4, 5, 1, 2, 3, 9, 10, 11
 Result: .asciiz "\n The product is "

.text

main: la $a0, A
  la $a1, B
  li $v0, 4
  la $a0, Prompt
  syscall
  li $v0, 5
  syscall
  move $a2, $v0 
  jal InnerProduct
  move $t0, $v0 
  la $a0, Result
  li $v0, 4
  syscall    
  move $a0, $t0
  li $v0, 1
  syscall       
  li $v0, 10
  syscall   

InnerProduct:
  addi $sp, $sp, -20
   sw $ra, 0($sp)
   sw $a0, 4($sp)    
   sw $a1, 8($sp)    
   sw $a2, 12($sp)   
   sw $t0, 16($sp)
   lw $t1, 0($a0)     
   lw $t2, 0($a1)
   mult $t1, $t2
   mflo $v0            
   beq $a2, 1, end
   lw $t1, 0($a0)
   lw $t2, 0($a1)
   mult $t1, $t2      
   mflo $t0  
   addi $a0, $a0, 4    
   addi $a1, $a1, 4   
   sub $a2, $a2, 1     
   jal InnerProduct    
   add $v0, $t0, $v0 

end:
   lw   $ra, 0($sp)
   lw   $a0, 4($sp)
   lw   $a1, 8($sp)
   lw   $a2, 12($sp)
   lw   $t0, 16($sp)
   addi $sp, $sp, 20
   jr $ra  

