.text
main:
	addi $sp, $sp, -16	# determinando espaco para a stack
	sw $t1, 0($sp)		# limpando os espacos
	sw $a0, 4($sp)		# limpando os espacos
	sw $a3, 8($sp)		# limpando os espacos
	sw $ra, 12($sp)		# limpando os espacos

	lw $t1, 0($sp)
	lw $a0, 4($sp)
	add $t2, $t1, $v0
	sub $t0, $t2, $a0
	add $a0, $zero, $t0
	add $a3, $zero, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	lw $t0, 0($sp)
	lw $a3, 12($sp)
	add $t2, $t0, $v1
	add $t1, $t2, $a3
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	add $v1, $zero, $t1
	jr $ra