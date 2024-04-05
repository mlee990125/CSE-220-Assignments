.data                                
	A: .word 1, -2, 3, -4, 7
  Result: .asciiz "\n The Positve Sum is: "
.text                               
main: la $a0, A
	li $a1, 5
  li $t5, 0
  j print
  cont: 
  la $a0, A
  jal fun
  j end

print: move $t0, $a0
print2: 
lw $t2, 0($t0)
move $a0, $t2
li $v0, 1
syscall
li $a0, ' '
li $v0, 11 
syscall
addi $t5, $t5, 1
addi $t0, $t0, 4
blt $t5, $a1, print2
j cont


fun: li $t0, 0 #sum
  li $t1, 0 #counter
next: lw $t2, 0($a0) #get int
  bltz $t2, Neg
  add $t0, $t0, $t2
  skip:
  addi $a0, $a0, 4
  addi $t1, $t1, 1
  blt $t1, $a1, next
  move $v0, $t0
  jr $ra

Neg:
  j skip


end: 
  move $t0, $v0
  la $a0, Result
  li $v0, 4
  syscall
  move $a0, $t0
  li $v0, 1
  syscall
  li $v0, 10
  syscall