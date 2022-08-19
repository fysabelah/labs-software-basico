#include <stdio.h>

int is_little() {
    int var_auxiliar = 1022;
    unsigned char *add = (unsigned char *)&var_auxiliar;

    int pos0 = *add;
    int pos1 = *(++add);

    if (pos0 > pos1) return 1;

    return (0);
}

int main () {
  //Big Endian: Bit mais significativo, menor endereço de memória
  //Little Endian: Bit menos significativo, menor endereço de memória

  if (is_little())
    printf("Little-endian\n");
  else
    printf("Big-endian\n");

  return 0;
}