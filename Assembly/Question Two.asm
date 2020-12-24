.data
  	inpt: .asciiz "Digite o valor da n-enesima posição da sequencia de fibonacci: " # Criação da frase de inicio
.text
main:

	li $s0, 1 # Inicializar s0 como 1, registrador que vai percorrer os index do array na função fibo
	li $s2, 1 # Registrador auxiliar para calcular a sequencia de fibonacci, representa a_(n-2)
	li $s3, 1 # Registrador auxiliar para calcular a sequencia de fibonacci, representa a_(n-1)
	
	li $v0, 4 # Comando para printar string
	la $a0, inpt # Printa o valor contido em a0
	syscall # Executa a chamada para printar
	
	li $v0, 5 # Comando para ler inteiro
	syscall # Executa a chamada para ler
	add $s1, $v0, $0 # Adiciona v0 (o inteiro lido) em s1
	
	beq $s1,0,printf # Se o inteiro lido for igual a 0, a função printf é chamada
	beq $s1,1,printf # Se o inteiro lido for igual a 1, a função printf é chamada.
	
	jal fibo # Se o inteiro lido for diferente de 0 e 1, Chama a função fibo
	
fibo:
	slt $t0, $s0, $s1 # Verifica se o s0 é maior que o inteiro inserido(s1), se for o n-esimo numero foi encontrado e t0 recebe 0, caso contrario, o loop continua com t0 recebendo 1
	beq $t0, $zero, printfo # Quando o n-esimo numero for encontrado a função printfo é chamada, caso contrario o loop continua
	
	add $s4, $s2, $s3 # Calcula o proximo nuemro da sequencia de fibonacci, utilizando os dois anteriores (s4 = a_n) (s3 = a_(n-1)) (s2 = a_(n-2)) 
	add $s2, $s3, $0 # Depois de encontrado o proximo numero da sequencia, s2 recebe o valor de s3
	add $s3, $s4, $0 # e s3 recebe o valor de s4, para que o proximo numero seja encontrado
	
	add $v0, $s4, $0 # Valor de s4 sempre armazenado em v0, para quando o loop terminar, ou seja,o n-esimo numero for encontrado, ele possa ser printado
	add $s0, $s0, 1 # s0 recebe o incremento a cada looping
	jal fibo # Chamada recursiva

printfo:	
	move $a0, $v0 # Armazena o retorno de fibo contido em v0, em a0
	li $v0, 1 # Comando para printar inteiro
	syscall # Executa a chamada para printar
	jal exit #chama a função para sair do codigo

printf:
	li $a0, 1 # Coloca em a0, o numero 1
	li $v0, 1 # Comando para printar inteiro
	syscall # Executa a chamada para printar
	jal exit #chama a função para sair do codigo
	
exit:
	li $v0, 10 # Comando para sair do codigo
	syscall # Executa a chamada para sair
