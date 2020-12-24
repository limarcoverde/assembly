.data
	inptA: .asciiz "Digite o valor do 1� operando: " # Cria��o da frase de inicio
  	inptB: .asciiz "Digite o valor do 2� operando: " # Cria��o da frase de inicio
  	somar: .asciiz "Soma: " # Cria��o da frase de inicio
  	subtr: .asciiz "Subtra��o: " # Cria��o da frase de inicio
  	andde: .asciiz "AND: " # Cria��o da frase de inicio
  	orrr: .asciiz "OR: " # Cria��o da frase de inicio
  	jump: .asciiz "\n" # Pular linha
.text
main:
	li $a2, 1 # Valor inicial de a2, que � o registrador que indica qual opera��o deve ser realizada 
	li $a3, 5 # Valor final + 1 que indica as opera��es
	
	li $v0, 4 # Comando para printar string
	la $a0, inptA # a0 recebe a frase contida em inptB
	syscall # Executa a chamada para printar
	
	li $v0, 5  # Comando para ler inteiro
	syscall # Executa a chamada para ler
	add $a0, $v0, $0 # adiciona o valor inserido em a0
	
	add $t1, $a0,0 # salva o valor de a0 em t1, precisei utilizar para n�o perder a informa��o
	
	li $v0, 4 # Comando para printar string
	la $a0, inptB # a0 recebe a frase contida em inptB
	syscall # Executa a chamada para printar
	
	add $a0, $t1,0 # retorna o valor de t1 em a0
	
	li $v0, 5 # Comando para ler inteiro
	syscall # Executa a chamada para ler
	add $a1, $v0, $0 # adiciona o valor inserido em a1
	jal for #chamo a fun��o for, que por sua vez chama a fun��o opr para realizar cada uma das 4 opera��es, com os operandos da entrada
	
for:
	slt $t0, $a2, $a3 # Verifica se o a2 � maior que a3, se for todas as opera��es foram realizadas t0 recebe 0, caso contrario, o loop continua com t0 recebendo 1
	beq $t0, $zero, exit# Verifica se t0 = 0, se for chama a fun��o exit, caso contrario o loop continua
	
	add $v0, $a2, 0 # v0 recebe o valor de a2
	jal opr #chama a fun��o opr, que realiza a opera��o de acordo com o valor de a2
	
	add $a2, $a2, 1 # a2 recebe incremento para que a cada chamada de opr, uma opera��o diferente seja realizada
	jal for # Chamada recursiva

opr:
	add $a2, $v0, 0 # a2 recebe o valor de v0 que � o valor da opera��o
	beq $a2, 1, soma # se a2 for igual a 1, � chamada a fun��o soma
	beq $a2, 2, subt # se a2 for igual a 2, � chamada a fun��o subt
	beq $a2, 3, andd # se a2 for igual a 3, � chamada a fun��o andd
	beq $a2, 4, orr # se a2 for igual a 4, � chamada a fun��o orr
	jr $ra # retorna para onde a fun��o foi chamada
	
soma:
	add $t0, $a0,$a1 # realiza a soma entre a0 e a1
	add $t1, $a0,0 # salva o valor de a0 em t1, precisei utilizar para n�o perder a informa��o
	
	li $v0, 4 # Comando para printar string
	la $a0, somar # a0 recebe a frase contida em somar
	syscall # Executa a chamada para printar
	
	li $v0, 1 # Comando para printar inteiro
	move $a0, $t0 #copia a informa��o contida em t0 em a0, variavel que � o parametro para printar
	syscall # Executa a chamada para printar
	
	li $v0, 4 # Comando para printar string
	la $a0, jump # a0 recebe a frase contida em jump
	syscall # Executa a chamada para printar
	
	
	add $a0, $t1,0 # Coloca de volta o valor de t1 em a0
	add $v0, $t0,0 # coloca o valor da soma em v0
	jr $ra # retorna para onde foi chamada
	
subt:
	sub $t0, $a0,$a1 # realiza a subtra��o entre a0 e a1
	add $t1, $a0,0 # salva o valor de a0 em t1, precisei utilizar para n�o perder a informa��o
	
	li $v0, 4 # Comando para printar string
	la $a0, subtr # a0 recebe a frase contida em subtr
	syscall # Executa a chamada para printar
	
	li $v0, 1 # Comando para printar inteiro
	move $a0, $t0 #copia a informa��o contida em t0 em a0, variavel que � o parametro para printar
	syscall # Executa a chamada para printar
	
	li $v0, 4 # Comando para printar string
	la $a0, jump # a0 recebe a frase contida em jump
	syscall # Executa a chamada para printar
	
	add $a0, $t1,0 # Coloca de volta o valor de t1 em a0
	add $v0, $t0,0 # coloca o valor da soma em v0
	jr $ra # retorna para onde foi chamada
	
andd:
	and $t0, $a0,$a1 # realiza a opera��o AND entre a0 e a1
	add $t1, $a0,0 # salva o valor de a0 em t1, precisei utilizar para n�o perder a informa��o
	
	li $v0, 4 # Comando para printar string
	la $a0, andde # a0 recebe a frase contida em andde
	syscall # Executa a chamada para printar
	
	li $v0, 1 # Comando para printar inteiro
	move $a0, $t0 #copia a informa��o contida em t0 em a0, variavel que � o parametro para printar
	syscall # Executa a chamada para printar
	
	li $v0, 4 # Comando para printar string
	la $a0, jump # a0 recebe a frase contida em jump
	syscall # Executa a chamada para printar
	
	add $a0, $t1,0 # Coloca de volta o valor de t1 em a0
	add $v0, $t0,0 # coloca o valor da soma em v0
	jr $ra # retorna para onde foi chamada
	
orr:
	or $t0, $a0,$a1 # realiza a opera��o OR entre a0 e a1
	add $t1, $a0,0 # salva o valor de a0 em t1, precisei utilizar para n�o perder a informa��o
	
	li $v0, 4 # Comando para printar string
	la $a0, orrr # a0 recebe a frase contida em orrr
	syscall # Executa a chamada para printar
	
	li $v0, 1 # Comando para printar inteiro
	move $a0, $t0 #copia a informa��o contida em t0 em a0, variavel que � o parametro para printar
	syscall # Executa a chamada para printar
	
	li $v0, 4 # Comando para printar string
	la $a0, jump # a0 recebe a frase contida em jump
	syscall # Executa a chamada para printar
	
	add $a0, $t1,0 # Coloca de volta o valor de t1 em a0
	add $v0, $t0,0 # coloca o valor da soma em v0
	jr $ra # retorna para onde foi chamada
	
exit:
	li $v0, 10 #comando para sair
	syscall # Executa a chamada para sair
