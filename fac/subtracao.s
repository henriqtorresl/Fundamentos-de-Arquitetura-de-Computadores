.data

.text
main:
	li $t0, 75		# $t0 = 75
	li $t1, 25		# $t1 = 25
	sub $t2, $t0, $t1	# $t2 = $t0 - $t1

	move $a0, $t2		# armazenando o conteudo de $t2 em $a0
	li $v0, 1		# comando pra imprimir um inteiro
	syscall

	li $v0, 10		# comando pra encerrar o programa
	syscall