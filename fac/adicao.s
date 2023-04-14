.data

.text
main:
	li $t0, 75		# $t0 = 75
	li $t1, 25		# $t1 = 25
	add $s0, $t0, $t1	# $s0 = $t0 + $t1

	addi $s0, $s0, 1	# $s0 = $s0 + 1

	move $a0, $s0
	li $v0, 1			# comando para imprimir um inteiro
	syscall

	li $v0, 10		# comando para encerrar o programa
	syscall