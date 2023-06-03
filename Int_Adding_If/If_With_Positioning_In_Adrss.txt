.text
main:
	# numero de valores num processador 32 bits, duas palavras por vez OK
	# a partir de um endereco 00001000 (hexa) para 00001020 (hexa)
	# o numero de palavras copiadas deve ser amazenado em $v0
	# o programa para de copiar quando uma das palavras for maior do que -100 e menor do que -5
	# e a outra palavra for maior do que 50 ou menor ou igual a 150
	# as palavras finais devem ser copidas mas nao contadas.
	
	lui $t0, 0x1000           # Carrega a parte alta do endereço de origem
    	lui $t1, 0x1020           # Carrega a parte alta do endereço de destino
    	ori $t0, $t0, 0x0000      # Carrega a parte baixa do endereço de origem
    	ori $t1, $t1, 0x0000      # Carrega a parte baixa do endereço de destino

l1:
	# declaracao de valores de entrad
	# addi $t2, $zero, 10 # nao sei se esta certo
	# addi $t3, $zero, 5 # nao sei se esta certo
	
	lw $s0, 0($t0)            # Carrega a primeira palavra do endereço de origem
    	lw $s1, 8($t0)            # Carrega a segunda palavra do endereço de origem

	# 0 == false
	# 1 == true

    	# Verifica as condições para parar a cópia
    	add $t5, $zero, -100
    	slt $t2, $t5, $s0       # Verifica se a primeira variavel é maior que -100
    	add $t5, $zero, -5
    	slt $t3 $s0, $t5        # Verifica se a primeira variavel é menor que -5
    	and $t2, $t2, $t3	
    	bne $t2, $zero, final     # Pula para a próxima iteração se for falso
    	
    	add $t6, $zero, 50
    	slt $t2, $t6, $s1	# 50 > w = A
    	add $t6, $zero, 151
    	slt $t3, $s1, $t6	# w <= 150 = B
    	or $t2, $t2, $t3	# A or B = C
    	bne $t2, $zero, final 	# C != 0, true

    	# Copia as palavras para o endereço de destino
    	sw $s0, 0($t1)           # Armazena a primeira palavra no endereço de destino
    	sw $s1, 4($t1)           # Armazena a segunda palavra no endereço de destino

    	addi $t0, $t0, 8         # Avança o endereço de origem em 8 bytes (2 palavras)
    	addi $t1, $t1, 8         # Avança o endereço de destino em 8 bytes (2 palavras)

    	addi $v0, $v0, 1         # Incrementa o contador de palavras copiadas
    	
    	lui $t7, 0x1020
    	ori $t7, $t7, 0x0000
    	bne $t0, $t7, l1
    	
final:
	add $t4, $zero, $s0	# Salvando informacao
	add $t5, $zero, $s1	# Salvando informacao