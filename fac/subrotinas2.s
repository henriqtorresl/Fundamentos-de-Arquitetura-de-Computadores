.data
	msgUsr: .asciiz "Forneça um número inteiro e positivo: "
	msgPar: .asciiz "O número é par!"
	msgImpar: .asciiz "O número é ímpar!"
.text
	main:
		la $a0, msgUsr		# imprimindo uma msg ao usuário
		jal imprimeString		

		jal lerInteiro		# lendo um inteiro do usuário, o valor vai ficar armazenado em $v0

		move $a0, $v0		# $a0 = $v0 -> carregando meu argumento
		jal isImpar		# verificando se $a0 é impar, se sim -> $v0 = 0, se não $v0 = 1

		beq $v0, $zero, imprimePar	# if
		la $a0, msgImpar		# senão.. (se for ímpar..)
		jal imprimeString
		jal encerrarPrograma
	
		imprimePar:			# obs.: isso não é uma função, é só um label do if
			la $a0, msgPar		# se for par...
			jal imprimeString
			jal encerrarPrograma		

		# função que verifica se o argumento $a0 é ímpar
		# retorna 1 se for ímpar
		# retorna 0 se for par
		isImpar:
			li $t0, 2
			div $a0, $t0

			mfhi $v0
			jr $ra

		# função que recebe uma String em $a0 e a imprime
		imprimeString:
			li $v0, 4
			syscall
			jr $ra

		# função que lê um inteiro e o retorna em $v0
		lerInteiro:
			li $v0, 5
			syscall
			jr $ra

		# função que encerra o programa
		encerrarPrograma:
			li $v0, 10
			syscall		# como essa função encerra o programa, eu não preciso usar o "jr $ra"
			