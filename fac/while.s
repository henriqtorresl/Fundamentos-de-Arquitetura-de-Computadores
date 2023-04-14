.data
	msg: .asciiz "Informe um número inteiro: "
	espaco: .byte ' '
.text
	main:
		# imprimir uma mensagem ao usuário
		la $a0, msg
		li $v0, 4
		syscall

		# comando para pedir um inteiro ao usuário
		li $v0, 5 
		syscall

		move $t0, $v0		# $t0 = $v0
		
		move $t1, $zero		# $t1 = $zero -> $t1 vai agir como o meu i

		while:
			bgt $t1, $t0, sair
			
			# imprimir $t1
			move $a0, $t1			
			li $v0, 1	
			syscall		
			
			# imprimir espaço em branco
			la $a0, espaco
			li $v0, 4
			syscall

			addi $t1, $t1, 1	# $t0 += 1
			j while

		sair:
			# encerrar o programa
			li $v0, 10
			syscall