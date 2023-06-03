.text
main:
	lw $t2, 0($sp) # a1 dividendo
	lw $t1, 4($sp) # a2 divisor
	
	add $t5, $zero, $zero # armazena o numero de vezes que o divisor cabe no dividendo
	
	addi $t3, $zero, 1 # $t3 = 1
	
	beq $t1, $t3, terminal # a1 * 1 = a1, por isso pode pular para o terminal
	slt $t4, $t1, $t2 # if(divisor < dividendo) ? t4 = 1 : t4 = 0
	beq $t4, $zero, terminal
	
loop:
	sub $t2, $t2, $t1 # t2 - t1 -> t2 ex: 4 / 2 -->> 4 - 2 = 2
	add $t5, $t5, $t3 # t5 + 1 -> t5
	slt $t4, $t2, $t1 # if (dividendo < divisor) ? t4 = 1 (vai pro terminal) : t4 = 0 (se mantem no loop)
	beq $t4, $zero, loop
	
terminal:
	sw $t5, 16($sp) # salva o valor da divisao a partir da pos 16