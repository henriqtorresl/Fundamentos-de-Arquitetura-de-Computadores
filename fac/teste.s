	.data
	li $v0, 3
	li $v1, 2
	add $t0, $v1, $v0
	.text
main:
	li $v0, 1
	li $a0, 5
	syscall