.data

.text
	main:
	# Assign values
	addi $t0, $zero, 1 # A
	addi $t1, $zero, 2 # B
	addi $t2, $zero, 3 # C
	addi $t3, $zero, 4 # D
	
	# slt operators
	slt $t4, $t0, $t1
	slt $t5, $t2, $t3
	
	# Logica mathematic operators
	L1: or $t6, $t4, $t5
	
	sub $t7, $t3, $t1
	add $t0, $t2, $t7
	sub $t1, $t2, $t3
	
	# while loop
	bne $t6, $zero, L1
