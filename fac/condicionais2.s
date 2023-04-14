.data
	msg: .asciiz "Informe um número inteiro: "
	isMaior: .asciiz "O número informado é maior que zero!"
	isMenor: .asciiz "O número informado é menor que zero!"
	isIgual: .asciiz "O número informado é igual a zero!"
.text
	main:
		# programa que le um numero inteiro e imprime se ele é maior, menor ou igual a zero

		# imprimir uma mensagem ao usuário
		la $a0, msg		# $a0 = msg
		li $v0, 4		# comando para imprimir uma string ou um char
		syscall
		
		# lendo um número inteiro do usuário
		li $v0, 5		# comando para ler um inteiro do usuário 
		syscall
		
		move $t0, $v0		# $t0 = $v0 -> segurança de código

		# verificações:
		bgt $t0, $zero, maior	# se $t0 for maior que $zero va para "maior", senao continue o codigo...
		 
		blt $t0, $zero, menor	# se $t0 for menor que $zero va para "menor", senao continue o codigo...

		beq $t0, $zero, igual	# se $t0 for igual $zero va para "igual", senao continue o codigo...

		maior:
			la $a0, isMaior		
			li $v0, 4		
			syscall

			li $v0, 10	# comando para encerrar o programa
			syscall

		menor:
			la $a0, isMenor		
			li $v0, 4		
			syscall

			li $v0, 10	# comando para encerrar o programa
			syscall

		igual:
			la $a0, isIgual		
			li $v0, 4		
			syscall

			li $v0, 10	# comando para encerrar o programa
			syscall