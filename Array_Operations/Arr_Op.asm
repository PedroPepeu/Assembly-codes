.data

.text
main:
	# loading an array with 50 pos, 8 bits each, 8 * 50 = 400
	lw $t0, 400($s0) # arq
	lw $t1, 400($s1) # circ
	
l:
	# calculating index from 0 to n
	add $t2, $s2, $s2 # 2 x i
	add $t2, $t2, $t2 # 4 x i
	add $t3, $t2, $zero # saving the value to use in the other array
	
	add $t2, $t2, $s0 # $t2 = a[i]
	add $t3, $t3, $s1 # $t3 = b[i]
	
	# i + 0
	lw $t0, 0($t2) # $t0 = a[i]
	
	# i - 100
	lw $t1, -400($t3) # $t1 = b[i]
	
	add $s3, $t0, $zero # saving the value of a[i]
	add $s4, $t0, $zero # saving the value of b[i]
	
	add -400($t3), $s3, $zero # a[i] -> b[i]
	add 0($t2), $s4, $zero # b[i] -> a[i] 
	
	bne $t2, 400, l # loop in l while the index is not 400 bits (or 50 `slots`)
