.text
main:
	addi $sp, $sp, -24 # -20 quer dizer que armazena 20 bytes para alocar
	
	# 0 a1, 4 a2, 8 mult, 16 divi, 20 pot
	
	# cada byte armazena 8 bits, entao 8*8 da 64 bits no total, ou seja dois valores de 4 bits, cada valor pode armazenar ate 32 bits (-2.147.483.648 a 2.147.483.647)
	sw $a1, 0($sp)
	sw $a2, 4($sp)
	jal multi
	jal divi
	jal pot
	
	lw $v0, 8($sp)
	lw $v1, 16($sp)
	lw $v0, 20($sp)