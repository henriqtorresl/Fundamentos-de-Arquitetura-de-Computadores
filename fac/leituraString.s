.data
	pergunta: .asciiz "Qual é o seu nome? "
	saudacao: .asciiz "Olá, "
	nome: .space 25			# o tamanho da string q vai ser lida pode ter até 25 caracteres
.text
main:
	la $a0, pergunta		# $a0 = pergunta
	li $v0, 4			# código para imprimir string ou char
	syscall

	la $a0, nome			# $a0 = nome
	la $a1, 25			# nesse registrador eu to informando o tamanho que qro ler (no max)
	li $v0, 8			# código para ler uma string ou char
	syscall

	move $t0, $a0			# $t0 = $a0 -> por segurança
	la $a0, saudacao		# $a0 = saudacao
	li $v0, 4			# código para imprimir uma string ou char
	syscall

	move $a0, $t0			# $a0 = $t0
	li $v0, 4			# código para imprimir uma string ou char
	syscall

	li $v0, 10			# código para encerrar o programa
	syscall