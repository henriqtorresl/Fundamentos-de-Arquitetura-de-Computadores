.data
	msg1: .asciiz "Olá, por favor forneça sua idade: "
	msg2: .asciiz "Sua idade é "
.text
main:
	la $a0, msg1		# $a0 = msg1
	li $v0, 4		# código para imprimir char ou string
	syscall 
 
	li $v0, 5		# código para leitura de inteiros
	syscall			# quando o usuário der um enter, o valor inserido vai para o $v0

	# to transferindo o valor do $v0 para o $t0, por segurança, pois o $v0 muda constantemente de valor (nas syscall's)
	move $t0, $v0		# $t0 = $v0 -> valor fornecido agora, está no $t0
	la $a0, msg2		# $a0 = msg2
	li $v0, 4		# código para imprimir char ou string
	syscall

	move $a0, $t0		# $a0 = $t0
	li $v0, 1		# código para imprimir um inteiro
	syscall

	li $v0, 10		# código para encerrar o programa
	syscall