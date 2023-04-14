.data
	msg: .asciiz "Informe um número inteiro: "
	isPar: .asciiz "O número informado é par!"
	isImpar: .asciiz "O número informado é ímpar!"
.text
	main:

	# Exercicio: leia um número e diga se ele é par ou ímpar...
		# imprimindo uma mensagem ao usuário
		la $a0, msg
		li $v0, 4		# comando pra imprimir uma string ou char
		syscall

		# lendo um número inteiro
		li $v0, 5 
		syscall			# o numero lido vai ser armazenado em $v0

		# vou ter que dividir o numero q li por dois para verificar se ele é par ou impar
		li $t0, 2
		div $v0, $t0

		mfhi $t1		# possui o resto da divisão por 2	

		# para ser par, o valor armazenado em $t1 tem que ser 0, se não o numero é impar

		beq $t1, $zero, imprimePar	# se o $t1 == $zero, executa o imprimePar, se nao continua o codigo
	
		la $a0, isImpar		# se a condição não for verdadeira...
		li $v0, 4
		syscall

		li $v0, 10		# encerrando o programa...
		syscall

	imprimePar:		# se a condição for verdadeira...
		la $a0, isPar
		li $v0, 4
		syscall

		li $v0, 10	# encerrando o programa...
		syscall