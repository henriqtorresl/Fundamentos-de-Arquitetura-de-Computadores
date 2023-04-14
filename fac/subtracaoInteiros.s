.text
main:
	li $t0, 5		# $t0 = 5
	li $t1, 3		# $t1 = 3
	sub $s0, $t0, $t1	# $s0 = $t0 - $t1

	li $v0, 1		# comando para mostrar um inteiro
	move $a0, $s0		# quero mostrar o conteudo do registrador $s0
	syscall

	li $v0, 10		# comando para encerrar o programa
	syscall