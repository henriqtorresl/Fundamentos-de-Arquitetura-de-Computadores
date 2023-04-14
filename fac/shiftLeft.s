.data
	numero: .word 10
.text
main:
	lw $t0, numero		# $t0 = numero
	sll $t1, $t0, 3		# $t1 = $t0 * (2^3) --> mover os bits 3 casas pra esquerda
	
	move $a0, $t1		# $a0 = $t1
	li $v0, 1 		# comando para imprimir um inteiro
	syscall

	# encerrando o programa
	li $v0, 10
	syscall