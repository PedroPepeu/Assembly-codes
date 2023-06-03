.text
main:
	lw $t2, 0($sp) # a1
	lw $t1, 4($sp) # a2
	
	addi $t3, $zero, 1 # $t3 = 1
	
	beq $t1, $t3, terminal # a1 = a1, por isso pode pular para o terminal
	
loop:
	
	
terminal:
	sw $t2, 20($sp) # salva o valor da multiplicacao a partir da pos 8