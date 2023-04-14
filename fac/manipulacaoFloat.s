.data
	msg: .asciiz "Forneça um número decimal: "
	zero: .float 0.0
.text
main:
	# imprimindo a mensagem para o usuário
	la $a0, msg
	li $v0, 4		# código para imprimir uma string ou char 
	syscall

	# lendo um número float
	li $v0, 6		# código para ler um float ou um double
	syscall			# o valor lido estará em $f0
	
	# OBS para eu imprimir um float, o valor tem q estar no reg $f12
	# n da para usar o "move" para mover valor de reg´s de float´s

	lwc1 $f1, zero
	add.s $f12, $f1, $f0	# usando como se fosse o move

	# imprimindo o numero
	li $v0, 2
	syscall

	# encerrando o programa
	li $v0, 10
	syscall