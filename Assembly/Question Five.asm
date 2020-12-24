.data
	resp: .asciiz "O comprimento da string é: " # Criação da frase de finalização
    	msg: .asciiz "Lis" # Criação da string que sera contada
.text

main:
    	li $s1,0 # contador inicializado em 0
    	li $t3, 1 # Verificador do fim da string, começa em 1 pois 0 é o que sinaliza o fim da string
    	la $s2, resp # associa a frase em s2
    	
    	la $a0, msg # Associa a string em a0
    	jal for # chama a função que vai ler e contar os caracteres

for:
    	beq $t3,0,finish # se t3(verificador do caracter) for igual a 0 significa que a string terminou e chama a função finish, senão o looping continua
    	
	mulo $t4, $s1, 1 # Na leitura de char a verificação é de 1 em 1 bite, Transforma o index decimal para bite.
    	add $t2, $a0, $t4 # percorrenfo os enderenços da memoria da string
    	lb $t3, 0($t2) # lendo o conteudo do endereço de memoria, para no beq, verificar se a string acabou	
    	
    	add $v0, $s1, 0 # Colocando o valor do contador em v0
    	
    	add $s1,$s1,1 # Incrementando o contador
    	jal for # chamando recursivamente a função for
    
finish:
	add $s1, $v0, 0 # Passando o valor de retorno da função for, contido em v0 para s1
	
	li $v0,4 # comando para printar string
    	add $a0, $0,$s2 # Printando o valor contido da frase de finalização
    	syscall # Executa a chamada para printar
    	
    	li $v0,1 # comando para printar inteiro
    	add $a0, $0,$s1 # Printando o tamanho da string
    	syscall # Executa a chamada para printar
    	
    	add $v0, $s1, 0 # como solicitado, colocando o valor do comprimento em v0
    	
    	li $v1,10 # Finalizando o programa
