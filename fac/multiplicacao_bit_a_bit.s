.data
.text
main:
# Multiplicador e multiplicando são armazenados em $s0 e $s1 respectivamente

# inicialização
add $t0, $zero, 5  # $t0 é usado para armazenar o resultado parcial
add $t1, $zero, 4  # $t1 é usado para armazenar o bit mais significativo

# loop de 32 iterações para multiplicar cada bit
loop:
  beq $s1, $zero, exit  # sai do loop se o multiplicador for 0
  andi $t2, $s1, 1      # pega o último bit do multiplicador
  beq $t2, $zero, skip  # pula a adição se o último bit for 0
  add $t0, $t0, $s0     # adiciona o multiplicando ao resultado parcial
  skip:
  sll $s0, $s0, 1       # desloca o multiplicando para a esquerda
  srl $s1, $s1, 1       # desloca o multiplicador para a direita
  j loop                # volta ao início do loop

exit:
# armazena o resultado em $t1:$t0
mflo $t0   # move o resultado parcial para $t0
mfhi $t1   # move o bit mais significativo para $t1