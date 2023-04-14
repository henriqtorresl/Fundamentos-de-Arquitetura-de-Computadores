multfac:
    add $sp, $sp, -12   # aloca espaço na pilha para três inteiros
    sw $a0, 0($sp)       # armazena o multiplicando na pilha
    sw $a1, 4($sp)       # armazena o multiplicador na pilha
    li $t0, 0            # inicializa o resultado em 0
    
loop:
    beq $a1, $zero, fim  # se o multiplicador é 0, sai do loop
    and $t1, $a1, 1      # pega o bit menos significativo do multiplicador
    beq $t1, $zero, skip # se o bit é 0, não precisa adicionar ao resultado
    add $t0, $t0, $a0    # adiciona o multiplicando ao resultado
skip:
    sll $a0, $a0, 1      # desloca o multiplicando 1 bit para a esquerda
    srl $a1, $a1, 1      # desloca o multiplicador 1 bit para a direita
    j loop               # volta ao início do loop
    
fim:
    mflo $lo             # armazena o resultado final em $lo
    mfhi $hi             # armazena o overflow em $hi
    lw $a0, 0($sp)       # recupera o multiplicando da pilha
    lw $a1, 4($sp)       # recupera o multiplicador da pilha
    add $sp, $sp, 12    # libera espaço na pilha
    jr $ra               # retorna ao chamador