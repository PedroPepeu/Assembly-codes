# Um determinado programa procura copiar um determinado número de palavras num processador
# Mips de 32bits, duas palavras por vez, armazenadas a partir de um endereço 00001000 16 para um
# endereço 00001020 16 . O número de palavras copiadas deve ser armazenado em $v0. O programa para
# de copiar quando uma das palavras for maior do que -100 e menor do que -5, e a outra palavra for
# maior do que 50 ou menor ou igual a 150. As palavras finais devem ser copiadas, mas não devem ser
# contadas.
.text
main:
    	lui $t0, 0x0000           # Carrega os 16 bits mais significativos do endereço de origem
    	ori $t0, $t0, 0x1000      # Carrega os 16 bits menos significativos do endereço de origem servindo como limite para o acesso
    	lui $t1, 0x0000           # Carrega os 16 bits mais significativos do endereço de destino
    	ori $t1, $t1, 0x1020      # Carrega os 16 bits menos significativos do endereço de destino servindo como limite para o acesso
    	
    	# as variaveis vao navegar de 0000 ate 1020, como 

    	addi $t6, $zero, 0    # Inicializa $t6 com 0 (contador de variaveis copiadas)
    
l:
    	lw $t2, 0($t0)            # Carrega as duas variaveis a serem copiadas em $t2 e $t3
    	lw $t3, 4($t0)
    	
    	add $t5, $zero, -100
    	add $t4, $zero, -5

	slt $t5, $t5, $t2       # Verifica se a primeira variaveis é maior que -100
    	slt $t4, $t2, $t4         # Verifica se a primeira variaveis é menor que -5
    	
    	and $t5, $t5, $t4	
    	bne $5, $zero, l1
    	
    	add $t5, $zero, 50
    	add $t4, $zero, 151
    	
    	slt $t5, $t5, $t3         # Verifica se a segunda variaveis é maior que 50
    	slt $t4, $t3, $t4        # Verifica se a segunda variaveis é menor ou igual a 150
    	
    	or $t5, $t5, $t4
    	bne $5, $zero, l1

    	addi $t6, $t6, 2          # Incrementa o contador de variaveis copiadas

    	sw $t2, 0($t1)            # Armazena as veriaveis copiadas no endereço de destino
    	sw $t3, 4($t1)
    	
    	addi $t0, $t0, 8          # Incrementa o endereço de origem em 8 bytes (2 palavras)
    	addi $t1, $t1, 8          # Incrementa o endereço de destino em 8 bytes (2 palavras)

    	j l                   # Volta para o início do loop

l1:
    	add $v0, $t6, $zero # printa o valor da contagem de variaveis
    	
    	add $v1, $t2, $zero # printa a ultima variavel 1
    	add $v1, $t3, $zero # printa a ultima variavel 2