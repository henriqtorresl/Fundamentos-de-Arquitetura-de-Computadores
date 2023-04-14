.data
.text
main:
	li $a0, 5
	li $a1, 4
	jal multfac

	li $v0, 10
	syscall		# encerrando o programa

	# multiplicando(M) = $a0 / multiplicador(Q) = $a1
multfac:
	li $t0, 0	# iniciando o contador valendo 0
	li $t1, 31	# registrador que vai armazenar a condição de parada, ele tem q realizar 32 iterações...
	li $t4, 1
	sll $t4, $t4, 31	# criando uma variavel para adicionar um no hsb 
	li $s0, 0	# iniciando o P valendo zero

	# vou manipular o meu multiplicador ($a1) para no fim salva-lo na porção menos sig. de P

loop:
	beq $t0, $t1, end
	addi $t0, $t0, 1	# $t0++	

	# se o LSB do $a1 for != 0 (ou seja, for 1), ent eu acumulo meu multiplicando ($a0) na parte mais sig. de P
	andi $t2, $a1, 1	# $t2 vai armazenar o LSB de Q
	andi $t3, $a0, 1	# $t3 vai armazenar o LSB de M 

	bne $t2, $zero, lsbIsOne

	srl $s0, $s0, 1
	srl $a1, $a1, 1
	bne $t3, $zero, tratamento	# se o lsb de M for igual a 1, tenho que fazer um tratamento especial...

	j loop

lsbIsOne:
	add $s0, $s0, $a0 	# acumulo meu M na parte mais sig. de P	

	srl $s0, $s0, 1	
	srl $a1, $a1, 1		# deslocando a direita meu produto
	bne $t3, $zero, tratamento

	j loop

tratamento:	# tratamento-> adicionar 1 no hsb da parte menos sig. de P
	add $a1, $a1, $t4 	

	j loop

end:
	# verificar se os sinais de M e Q são iguais e carregar a resposta disso em um registrador...
	xor $t5, $a0, $a1
	# se forem iguais, não faço nada, se não forem, nego o P
	blt $t5, $zero, negarP		# se $t5 < 0, quer dizer que os sinais são diferentes...
return:
	mthi $s0
	mtlo $a1
	
	jr $ra		# retorno da função

negarP:		# fazer o complemento de 2
	nor $s0, $s0, $zero
	nor $a1, $a1, $zero
	addi $a1, $a1, 1
	
	j return