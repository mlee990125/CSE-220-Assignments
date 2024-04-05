.data
  Prompt: .asciiz "\n Enter N "
  Prompt2: .asciiz "\n Enter integer "

.text
  main: li $v0, 4
  la $a0, Prompt
  syscall
  li $v0, 5
  syscall
  move $t1, $v0 #$t1 contains N
  li $t4, 0 #t4 is counter
   again: li $v0, 4
         la $a0, Prompt2
         syscall
         li $v0, 5
         syscall
         move $t5, $v0 #$t5 contains int
         beq $t5, 0, zerof
         bgtz $t5, posf
         bltz $t5, negf
  zerof: li $a0, '\n'
         li $v0, 11
         syscall
         addi $t4, $t4, 1
         blt $t4, $t1, again
        beq $t4, $t1, end

  posf: li $a0, '*'
        li $v0, 11
        syscall
        addi $t5, $t5, -1
        bgtz $t5, posf
        li $t5, 0
        addi $t4, $t4, 1
        blt $t4, $t1, again
        beq $t4, $t1, end

  negf: li $a0, '-'
        li $v0, 11
        syscall
        addi $t4, $t4, 1
        blt $t4, $t1, again
        beq $t4, $t1, end

end: li $v0, 10
     syscall
