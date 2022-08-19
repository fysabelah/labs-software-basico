# Laboratórios de Software Básico

Este repositório contêm os laboratórios da disciplina de Software Básico. Achei interesante mantê-lo, pois acredito que poderá ser uma fonte de aprendizado de Assembler através da associaçao com C.

Tentei sempre manter o arquivo Assembler com o mesmo nome que está em C. Porém caso não consiga identificar ou fique com alguma dúvida, fique a vontade para me contatar.

Para compilar os arquivos, basta digitar o comando baixo. Caso gostaria de conferir o resultado, basta trocar o arquivo .S para o .c referente. 
  
    gcc -no-pie -o nome_executavel nome_do_arquivo.c nome_arquivo.S
    
No caso onde é necessário o uso do printf, é obrigatório o uso do registrador %eax, pois este informa a quantidade de ponto flutuantes presentes. Por isto que muito vezes vemos a passagem de apenas 0. 

*Boa Sorte!!!*
