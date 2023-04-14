.data
	msg: .asciiz "Forneça um número decimal: "
	zero: .double 0.0
.text
main:
	la $a0, msg
	li $v0, 4
	syscall
	
	li $v0, 7	# lendo um double
	syscall

	ldc1 $f2, zero
	add.d $f12, $f2, $f0

	li $v0, 3	# imprimindo o número
	syscall

	li $v0, 10	# encerrando o programa
	syscall