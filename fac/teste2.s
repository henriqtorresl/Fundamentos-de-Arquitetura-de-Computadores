.data  				       # área para dadods na memória principal
	msg:.asciiz "Olá, Mundo!"     # mensagem a ser exibida para o usuário
.text	
main:			       # área para instruções do programa
	li $v0, 4	# instrução para impressão de string
	la $a0, msg	# indica o endereço em que está a mensagem
	syscall		# normalmente a syscall executa o que está dentro do registrador $a0
			# syscall significa -> faça