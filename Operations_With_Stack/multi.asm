.text
main:
	lw $t2, 0($sp) # a1
	lw $t1, 4($sp) # a2
	
	addi $t3, $zero, 1 # $t3 = 1
	
	beq $t1, $t3, terminal # a1 * 1 = a1, por isso pode pular para o terminal
	
loop:
	add $t2, $t2, $t2 # a1 + a1 -> a1
	sub $t1, $t1, $t3 # t1 - 1 - > t1
	bne $t1, $t3, loop # if(t1 > 1) ? loop : terminal
	
terminal:
	sw $t2, 8($sp) # salva o valor da multiplicacao a partir da pos 8