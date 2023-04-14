.data

.text
main:
	li $a0, 5	# M = 5
	li $a1, 4	# Q = 4

	jal multfac	# chamando a função

	li $v0, 1	# codigo para imprimir um inteiro
	mfhi $a0	# carregando o HI em $a0
	syscall		# imprimindo o HI

	li $v0, 1	# codigo para imprimir um inteiro
	mflo $a0	# carregando o LO em $a0
	syscall		# imprimindo o LO

	li $v0, 10
	syscall		# encerrando o programa

multfac:
	li $t0, 0	# inicializando o contador valendo 0
		# OBS.: $v0 vai armazenar a parte mais significativa do resultado
		# vou salvar o meu multiplicador na parte menos significativa do meu produto
 		# então no final eu vou fazer um mthi $s0 e mtlo $a1, obs.: 'mfhi' lê de HI e 'mthi' escreve em HI
	li $s0, 0 # inicializando meu produto P com zero, obs.: o $a1, vai direto para o lo	

	li $t3, 1	# vou usar esse registrador para fazer a manipulação no label case1
	sll $t3, $t3, 31	# qro pegar o HSB...

	li $t4, 32	# vou usar esse reg para fazer a comparação no beq, dentro do loop
	li $t5, 1	# vou usar esse reg para fazer a comparação do outro beq, dentro do loop

loop:
	beq $t0, $t4, sair	# se i == 32, sair do loop
	addi $t0, $t0, 1	# $t0++

	andi $t1, $a1, 1		# pegando o LSB de $a1 e armazenando em $t1
	beq $t1, $t5, lsbValeUm

	srl $s0, $s0, 1
	srl $a1, $a1, 1		# movendo o produto uma casa a direita
	
	j loop	# se meu LSB == 0, então eu não faço nada (além de deslocar os bits pra direita)

lsbValeUm:
	add $s0, $s0, $a0	# se o LSB == 1, então acumulo meu multiplicando(M) na parte mais significativa do P
	srl $a1, $a1, 1		# movendo o LO uma casa a direita	
	andi $t2, $s0, 1		# fazendo um and entre HI e 1

	beq $t2, 1, case1	

	srl $s0, $s0, 1		# movendo o HI uma casa a direita

	j loop

case1:
	add $a1, $a1, $t3	# adicionando 1 no HSB do LO
	srl $s0, $s0, 1		# movendo o HI uma casa a direita

	j loop

sair:
	xor $t6, $a0, $a1	# se M tem sinal diferente de Q, então nego P, senão, nn faço nd

	blt $t6, $zero, diferentes	# $t6 < 0, então os sinais são diferentes
sair2:

	mthi $s0	# armazenando a parte mais significativa no registrador HI
	mtlo $a1	# armazenando a parte menos significativa no registrador LO

	jr $ra		# retorna ao ponto de chamada da função

diferentes:	# então eu vou negar o P...
	nor $s0, $s0, $zero	# negando o HI

	nor $a1, $a1, $zero	# negando o LO e somando um (complemento de dois)
	addi $a1, $a1, 1

	j sair2