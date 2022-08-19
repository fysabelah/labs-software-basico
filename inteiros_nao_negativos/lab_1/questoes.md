# Questões discursivas de *Inteiros não negativos*

## Questão 1

    Os prints irão apresentar o endereço de memória e o respectivo valor armazenado neste. Os valores armazenados serão apresentados em hexadecimal. Tendo 10000 na base 10 é equivalente a 2710 na base 16. Os valores serão armazenados como little endian. Vale lembrar que um int possui 32 bits, então ficaria 00002710. Considerando endereço inicial 0x100 e o cast para char, no endereço 0x100-> 10, 0x101->27, 0x102->00, 0x103->00.
    Ao alterar para long, teríamos 64 bits, logo aumentaríamos a quantidade de zero a esquerda. Já short teríamos 16 bits, teríamos apenas 2710 e um char com apenas 8 bits, teríamos apenas 10.

## Questão 2

    Nesta, a função string2num recebe um número em formato de string. O valor analisado pela função através de um ponteiro. A cada posição deste vetor/ponteiro, ele pegar um valor multiplica pelo valor inicial de a e faz uma subtração entre o valor armazenado na posição e '0' (48). Com isto, a string recebida é convertida em número a cada iteração.
