.data		# se eu não precisar de nenhuma variavel que venha daq, eu posso omitir o ".data"
	idade: .word 20
.text
main:
	li $v0, 1
	lw $a0, idade		# lw é como se fosse o la, mas para o tipo ".word"
	syscall

	li $v0, 10
	syscall