.data
  	array: .space 16 #criação do array
.text
main:
     	li $s0, 0 # Inicializar s0 como 0, registrador que vai percorrer os index do array na função adicionar_array
     	li $s1, 0 # Inicializar s1 como 0, registrador que vai percorrer os index do array na função sum
   	li $s3, 5 # Inicializa s3 como 5, registrador que indica o tamanho do array
   	la $s4, array # Associação do array com o registrador s4
     	
     	jal adicionar_array # Chamando a função adicionar_array, responsavel por inserir os números no array
     	
adicionar_array: 
      	slt $t0, $s0, $s3 # Verifica se o s0 é maior que s3, se for todos os elementos foram inseridos e t0 recebe 0, caso contrario, o loop continua com t0 recebendo 1
      	beq $t0, $zero, sum # Verifica se t0 = 0, se for chama a função sum, caso contrario o loop continua
  
       	mulo $t0, $s0, 4 # Transforma o index para bite 
       	add $t2, $s4, $t0 # Percorre os endereços de memoria do array para encontrar o index respectivo
       	li $v0, 5 # Input do usuario
       	syscall # Executa a chamada para ler
       	add $t1, $v0, $0 # Adiciona no registrador $t1 o conteudo inserido
       	sw $t1, 0($t2) # Adiciona na posição respectiva o input inserido
       	
       	addi $s0, $s0, 1 # incrementa 1 no contador $s0
      	jal adicionar_array # Chama a função adicionar_array recursivamente
sum:
	slt $t0, $s1, $s3 # Verifica se o s1 é maior que s3, se for todos os elementos foram inseridos e t0 recebe 0, caso contrario, o loop continua com t0 recebendo 1
      	beq $t0, $zero, printf # Verifica se t0 = 0, se for chama a função printf, caso contrario o loop continua
  
       	mulo $t0, $s1, 4 # Transforma o index para bites
       	add $t2, $s4, $t0 #Percorre os endereços de memoria do array para encontrar o index respectivo
       	lw $t1, 0($t2) # insere em t1 o valor respectivo contido no array
       	add $s5,$s5,$t1 # Faz a soma dos valores armazenados no array, e armazena o resultado em s5
       	
       	add $v0, $0, $s5 # insere em v0 o valor aramazenado em s5 (valor da soma dos elementos do array)
       	addi $s1, $s1, 1 # incrementa 1 no contador $s1
      	jal sum # Chama a função sum recursivamente
      	
printf:
	move $a0, $v0 # Copia o valor de v0 para a0
	li $v0, 1 # Printa o valor de a0 na tela
	syscall # Executa a chamada para printar
	
	add $v0, $a0, $0 # Adiciona o valor de a0 em v0
	jal finish # Chama a função finish
	
finish:
	li $v1, 10 # Encerra o programa
	
