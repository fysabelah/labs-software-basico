# Questões discursivas de *Compilação*

## Questão 2

    Quando o GCC é invocado, ele faz o preprocessamento, compilação, geração do assembly e o linker.

## Questão 3

    Possui mais de 10 opções (letra c).

## Questão 4

    O AS é o responsável pela geração do Assembler, mais precisamente é o Assembler GNU portátil. Já o ld é o linker, realiza a ligação entre os arquivos.

## Questão 5

    * Para parar logo após o pré-processamento é a opção -E. Conforme a documentação "Preprocess only; do not compile, assemble or link".    
    * Parar logo após a compilação é a opção -S.
    * -c é a opção para parar o processo logo depois de compilar e antes de gerar o executável.

## Questão 6

    Sim, é possível identificar as fases através das chamadas de do compilador, do as e do ld.

## Questão 7

    Considerando apenas as chamadas das macros como de função, ao chamar inc, com a = 10 e b = 20, temos retorno de a = 11 e b = 21. A chamada de dobro temos um incremento de b antes da chamada, logo b = 20, dobro(++b) = dobro(21). Retorno é igual a = 42 e b = 21. Já para calc(10, 6), resultando em a = 10 e b = 22.
    Por trata-se de um macro, acaba que será feito apenas um replace, o que faz com que determinados trechos de códigos não funcionem conforme o esperado.
    Então, este trecho:
    ˋˋˋc
        if (a > 15)
            inc(a, b);
    ˋˋˋ
    Vira,
    ˋˋˋc
        if (a > 15)
            x++;
        y++;
    ˋˋˋ
    Com isso, os valores divergem os que seria esperado.
