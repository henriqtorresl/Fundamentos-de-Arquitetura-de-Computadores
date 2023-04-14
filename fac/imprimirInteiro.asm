.data
	idade: .word 20
.text
main:
	li $v0, 1
	lw $a0, idade	#lw é um comando para carregar um word "load word"
	syscall

	li $v0, 10	#comando para encerrar o programa
	syscall