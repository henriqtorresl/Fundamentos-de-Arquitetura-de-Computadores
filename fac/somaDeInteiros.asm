.data	#como eu não vou precisar do ".data" nesse exercicio, eu poderia nn escreve-lo no programa
	
.text
main:
	li $t0, 3		# $t0 = 3
	li $t1, 2		# $t1 = 2
	add $s0, $t0, $t1	# $s0 = $t0 + $t1
	addi $s1, $s0, 15	# $s1 = $s0 + 15