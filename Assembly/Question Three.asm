.data
	inptA: .asciiz "Digite o valor de A: " # Criação da frase de inicio
  	inptB: .asciiz "Digite o valor de B: " # Criação da frase de inicio
.text
main:
	li $v0, 4 # Comando para printar string
	la $a0, inptA # a0 recebe a frase contida em inptA
	syscall # Executa a chamada para printar
	
	li $v0, 5  # Comando para ler inteiro
	syscall # Executa a chamada para ler
	add $s1, $v0, $0 # adiciona o valor inserido em s1
	
	li $v0, 4 # Comando para printar string
	la $a0, inptB # a0 recebe a frase contida em inptB
	syscall # Executa a chamada para printar
	
	li $v0, 5 # Comando para ler inteiro
	syscall # Executa a chamada para ler
	add $s2, $v0, $0 # adiciona o valor inserido em s2
	
	add $t3,$s1,0 # t3 recebe o valor de s1
	jal sum # Chama a função sum, que realiza a soma dos elementos entra A e B

sum:
	slt $t0, $s1, $s2 # Verifica se o s1 é maior que s2, se for todos os elementos foram somados e t0 recebe 0, caso contrario, o loop continua com t0 recebendo 1
	beq $t0, $zero, printf # Verifica se t0 = 0, se for chama a função printf, caso contrario o loop continua
	
	add $t1, $s1,1 # t1 recebe s1 + 1, sucessor de s1
	add $t2, $t3, $t1 # t2 vai somando os elementos a medida que for percorrendo os numero entre A e B
	add $t3, $t2, 0 # t3 recebe t2 (soma dos valores), e no proximo loop t3 sera somado com o proximo elemento que esta no intervalo A e B
	
	add $v0, $t3, $0 # v0 recebe t3 (soma de todos os numeros no intervalo A e B)
	add $s1, $s1, 1 # s1 recebe incremento
	jal sum # Chamada recursiva
printf:
	move $a0, $v0 #a0 recebe o retorno da função sum (v0) 
	li $v0, 1 # Comando para printar inteiro
	syscall # Executa a chamada para printar
	jal exit # Chama a função exit
exit:
	li $v0, 10 #comando para sair
	syscall # Executa a chamada para sair
