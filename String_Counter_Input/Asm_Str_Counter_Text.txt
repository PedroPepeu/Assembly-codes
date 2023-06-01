# Inicialização dos registradores
.data
count: .word 0                  # Contador de palavras copiadas
src:   .word 0x00001000         # Endereço de origem das palavras
dst:   .word 0x00001020         # Endereço de destino das palavras

.text
.globl main
main:
    lui   $t0, 0x1000           # Carrega a parte alta do endereço de origem
    lui   $t1, 0x1020           # Carrega a parte alta do endereço de destino
    ori   $t0, $t0, 0x0000      # Carrega a parte baixa do endereço de origem
    ori   $t1, $t1, 0x0000      # Carrega a parte baixa do endereço de destino

loop:
    lw    $s0, 0($t0)           # Carrega a primeira palavra do endereço de origem
    lw    $s1, 4($t0)           # Carrega a segunda palavra do endereço de origem

    # Verifica as condições para parar a cópia
    slti  $t2, $s0, -100        # Verifica se a primeira palavra é menor que -100
    bne   $t2, $zero, end       # Pula para o fim se for verdadeiro
    slti  $t2, $s0, -5          # Verifica se a primeira palavra é maior ou igual a -5
    beq   $t2, $zero, next      # Pula para a próxima iteração se for falso
    slti  $t2, $s1, 50          # Verifica se a segunda palavra é menor que 50
    beq   $t2, $zero, next      # Pula para a próxima iteração se for falso
    slti  $t2, $s1, 150         # Verifica se a segunda palavra é maior ou igual a 150
    bne   $t2, $zero, next      # Pula para a próxima iteração se for verdadeiro

    # Copia as palavras para o endereço de destino
    sw    $s0, 0($t1)           # Armazena a primeira palavra no endereço de destino
    sw    $s1, 4($t1)           # Armazena a segunda palavra no endereço de destino

    addi  $t0, $t0, 8           # Avança o endereço de origem em 8 bytes (2 palavras)
    addi  $t1, $t1, 8           # Avança o endereço de destino em 8 bytes (2 palavras)

    addi  $v0, $v0, 1           # Incrementa o contador de palavras copiadas

next:
    j     loop                  # Pula para a próxima iteração

end:
    jr    $ra                   # Retorna do programa
