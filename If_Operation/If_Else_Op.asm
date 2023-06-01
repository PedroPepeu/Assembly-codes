.data

.text
	main:
	# Assign values
	addi $t0, $zero, 1 # A
	addi $t1, $zero, 2 # B
	addi $t2, $zero, 3 # C
	addi $t3, $zero, 4 # D
	
	# slt operators from equation
	slt $t4, $t0, $t1 # A >= B
	slt $t5, $t2, $t3 # C < D
	slt $t6, $t0, $t2 # A < C
	
	# Logical mathematical operators
	and $t7, $t4, $t5 # A >= B && C < D
	or $t8, $t7, $t6 # (A >= B && C < D) || A < C
	
	# Checks if is true
	bne $t8, $zero, L1
	L1: add $t0, $zero, 10
	
	beq $t8, $zero, L2
	L2: add $t0, $zero, 20
