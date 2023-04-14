.data
	caractere: .byte 'A'		# caractere a ser impresso

.text
main:
	li $v0, 4			# instrução para imprimir um char ou uma String
	la $a0, caractere		# carrego no $a0 o que eu quero que seja impresso
	syscall		

	li $v0, 10			# comando para finalizar o programa
	syscall