.data
 Prompt: .asciiz "\n Enter N "
 A: .word 3, 4, 5, 1, 2, 3, 9, 10, 11
 B: .space 36

.text
main: li $v0, 4
  la $a0, Prompt
  syscall
  li $v0, 5
  syscall
  move $t1, $v0 #$t1 contains N
  mult $t1, $t1
  mflo $t5
  la $t3, A
  la $t4, B
  li $t0, 0 #counter is 0
  next: lw $t2, 0($t3)
        sw $t2, 0($t4)
        move $a0, $t2
        addi $t3, $t3, 4
        addi $t4, $t4, 4
        addi $t0, $t0, 1
        blt $t0, $t5, next
  


li $v0, 10
syscall