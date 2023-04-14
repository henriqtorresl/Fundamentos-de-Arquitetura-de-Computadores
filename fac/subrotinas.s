.data
	msg: .asciiz "Informe um número inteiro e positivo: "
	isPar:	.asciiz "O número informado é par"
	isImpar: .asciiz "O número informado é ímpar"
.text
	main:
		# faça uma funçao que verifica se um num inteiro positivo é par ou impar
		
		# mostrando uma msg ao usuário
		la $a0, msg
		li $v0, 4
		syscall

		# lendo um número inteiro
		li $v0, 5
		syscall

		move $a0, $v0		# carregando o argumento da funçao -> $a0 = $v0
		jal parOuImpar
		
		li $v0, 10		# encerrando o programa
		syscall

		parOuImpar:
			li $t0, 2
		
			div $a0, $t0		# dividindo o número por 2, para verificar se é par ou impar
		
			mfhi $t1		# registrador que vai armazenar o resto da divisao
		
			beq $t1, $zero, par	# se $t1 for igual a zero é par, senão.. é ímpar
			
			la $a0, isImpar		# senão..
			li $v0, 4	
			syscall

			jr $ra			# saindo da função...
			
			par:
				la $a0, isPar		# se for par..
				li $v0, 4	
				syscall

				jr $ra			# saindo da função...