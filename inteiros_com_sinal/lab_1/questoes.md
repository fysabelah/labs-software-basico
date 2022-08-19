# Questões discursivas de *Inteiro com sinal*

## Questão 1

    Então primeiro analisando as conversões, temos:
    * short (16 bits):
        -3 = 0000000000000011 (3) = 1111111111111100 + 1 = 1111 1111 1111 1101
        Em hexa: FF FD
    * int (32 bits):
        -151 = 0000 0000 0000 0000 0000 0000 1001 0111 (151) = 1111 1111 1111 1111 1111 1111 0110 1000 + 1 = 1111 1111 1111 1111 1111 1111 0110 1001
        Em hexa: FF FF FF 69
    * char (8 bits): 
        *O intervalo é de 128 0 127. Então 150 em módulo 127 é igual 23. Como estourou passa para o negativo. Então fica -128 + 23 = -105.*
        -105 = 0110 1001 = 1001 0110 + 1 = 1001 0111
        Em hexa: 97


    A representação para short, int e char, respectivamente:
    0X100 = FD | 69 | 97
    0X101 = FF | FF |
    0X102 =    | FF |
    0X103 =    | FF |

## Questão 2

    Considerando 8 bits devido ao char, temos:
    * 1 = 0000 0001 = 1111 1110 + 1 = 1111 1111
    * -5 = 1111 1011 = 0000 0100 + 1 = 0000 0101
    * 35 = 0010 0011 = 1101 1100 + 1 = 1101 1101
    * -42 = 1101 0110 = 0010 1001 + 1 = 0010 1011
    * 127 = 0111 1111 = 1000 0000 + 1 = 1000 0001
    * -128. Este número fica o mesmo, não há alteração nele. Sendo este 1000 0000.

## Questão 3

    Tal questão pode ocorrer devido a extensão de tamanho e a conversão de sinais. Em uma seria você considerar que o número está em complemento a dois e no outro não. Então é um, na extensão seria propagado 0 e em outra 1. Logo, 

    -1 = 1111 1111 = FF
    unsigned int (1111 1111 1111 1111 1111 1111 1111 1111) = 0xFFFFFFFF
    unsigned int (0000 0000 0000 0000 0000 0000 1111 1111) = 0x000000FF

## Questão 4

   No primeiro, comparamos x = 4294967295 e y = 2, logo x < y, retornam não. Já no segundo, temos x = -1 e y = 2. Logo, x < y, retorna sim. Já no terceiro, temos x = -1 e y = 2, também retornando sim.
