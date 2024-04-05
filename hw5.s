.data
  Prompt: .asciiz "\n Enter N "
  Prompt2: .asciiz "\n Enter integer "
  Result1: .asciiz "\n Positive Sum is: "
  Result2: .asciiz "\n Negative Sum is: "

.text
  main: li $v0, 4
  la $a0, Prompt
  syscall
  li $v0, 5
  syscall
  move $t1, $v0 #$t1 contains N
  li $t2, 0 #$t2 is pos sum
  li $t3, 0 #$t3 is neg sum
  li $t4, 0 #t4 is counter
  again: li $v0, 4
         la $a0, Prompt2
         syscall
         li $v0, 5
         syscall
         move $t5, $v0 #$t5 contains int
         bgtz $t5, possum
         bltz $t5, negsum   
  possum: add $t2, $t2, $t5
          li $t5, 0
          addi $t4, $t4, 1
          blt $t4, $t1, again
  negsum: add $t3, $t3, $t5
          addi $t4, $t4, 1
          blt $t4, $t1, again

li $v0, 4
la $a0, Result1
syscall
move $a0, $t2
li $v0, 1
syscall
la $a0, Result2
li $v0, 4
syscall
move $a0, $t3
li $v0, 1
syscall
li $v0, 10
syscall
  
  