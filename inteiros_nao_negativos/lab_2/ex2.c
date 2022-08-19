#include <ctype.h>
#include <stdio.h>


char numCorrespondenteBase(int numero) {
    if (numero < 10) return '0' + numero;

    return 'a' + numero - 10;
}

void reordenaResultado(char *resp, int tamanho) {
    int limite = tamanho;
    int aux; 

    for (int i = 0; i < tamanho/2; i++) {
        aux = resp[i];
        resp[i] = resp[limite - 1];
        resp[limite - 1] = aux;
    }
}

void num2string(int num, int base, char *resp) {

    int resto, i;

    for (i = 0; num != 0; i ++) {
        resto = num % base;
        num = num / base;
        resp[i] = numCorrespondenteBase(resto);
    }

    resp[i] = '\0';

    if (i > 1) {
        reordenaResultado(resp, i);
    }
}

int main () {

  char buf[128];

  num2string(1024, 2, buf);
  printf("==> %s\n", buf);

  num2string(1024, 16, buf);
  printf("==> %s\n", buf);

  num2string(1234, 16, buf);
  printf("==> %s\n", buf);

  num2string(1024, 32, buf);
  printf("==> %s\n", buf);

  return 0;
}