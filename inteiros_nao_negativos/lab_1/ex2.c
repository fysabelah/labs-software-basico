#include <ctype.h>
#include <stdio.h>

int string2num(char *s) {

  int a = 0;

  for ( ; *s; s++)
    a = a * 10 + (*s - '0');

  return a;
}

int conversor(char *s, int base) {
  int a = 0, termo = 0;

  for ( ; *s; s++) {
    if (*s - '0' >= 17) {
        termo = *s - 'A' + 10;
    } else {
        termo = *s - '0';
    }

    a = a * base + termo;
  }

  return a;
}

int calcular_base10(char *s) {
    return conversor(s, 10);
}

int calcular_base8(char *s) {
    return conversor(s, 8);
}

int calcular_base16(char *s) {
    return conversor(s, 16);
}

int main () {

//   printf("==> %d\n", string2num("1234"));
//   printf("==> %d\n", string2num("1234") + 1);
//   printf("==> %d\n\n", string2num("1234") + string2num("1"));

//   printf("==> %d\n", calcular_base10("1234"));
//   printf("==> %d\n", calcular_base10("1234") + 1);
//   printf("==> %d\n\n", calcular_base10("1234") + calcular_base10("1"));
  
//   printf("==> %d\n", calcular_base8("1234"));
//   printf("==> %d\n", calcular_base8("1234") + 1);
//   printf("==> %d\n\n", calcular_base8("1234") + calcular_base8("1"));

  printf("==> %d\n", calcular_base16("1A"));
  printf("==> %d\n", calcular_base16("A09B") + 1);

  return 0;
}