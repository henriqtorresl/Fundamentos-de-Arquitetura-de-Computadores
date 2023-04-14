multfac:
	li $t0, 0	# inicializando o contador valendo 0
		# OBS.: $v0 vai armazenar a parte mais significativa do resultado e $v1 a menos significativa
 		# então no final eu vou fazer um mthi $v0 e mtlo $v1, obs.: 'mfhi' lê de HI e 'mthi' escreve em HI
	li $v0, 0
	li $v1, 0	# inicializando meu produto P com zero	

	move $v1, $a1	# armazenando o valor do multiplicador(Q) na parte menos significativa do P

	li $t3, 1	# vou usar esse registrador para fazer a manipulação no label case1
	sll $t3, $t3, 31	# qro pegar o HSB...

	bge $a0, 0, positivo # verifique se o multiplicando é positivo ou negativo
	neg $a0, $a0	     # se for negativo, eu nego

	bge $a1, 0, positivo # verifique se o multiplicando é positivo ou negativo
	neg $a1, $a1	     # se for negativo, eu neg0

loop:
	beq $t0, 32, sair	# se i == 32, sair do loop
	addi $t0, $t0, 1	# $t0++

	and $t1, $v1, 1		# pegando o LSB de $v1 e armazenando em $t1
	beq $t1, 1, lsbValeUm

	srl $v0, $v0, 1
	srl $v1, $v1, 1		# movendo o produto uma casa a direita
	
	j loop	# se meu LSB == 0, então eu não faço nada (além de deslocar os bits pra direita)

positivo:	# se for positivo, eu não faço nada..

	j loop

lsbValeUm:
	add $v0, $v0, $a0	# se o LSB == 1, então acumulo meu multiplicando(M) na parte mais significativa do P
	srl $v1, $v1, 1		# movendo o LO uma casa a direita	
	and $t2, $v0, 1		# fazendo um and entre HI e 1

	beq $t2, 1, case1	

	srl $v0, $v0, 1		# movendo o HI uma casa a direita

	j loop

case1:
	add $v1, $v1, $t3	# adicionando 1 no HSB do LO
	srl $v0, $v0, 1		# movendo o HI uma casa a direita

	j loop

sair:
	mthi $v0	# armazenando a parte mais significativa no registrador HI
	mtlo $v1	# armazenando a parte menos significativa no registrador LO

	jr $ra		# retorna ao ponto de chamada da função