#include<stdio.h>

void calc(int*, int);
int proces(int*);

int main() {
    int v[5] = {1, 2, 3, 4, 5}, i;

    calc(v, 10);

    for (i = 0; i < 5; i++) {
        printf("%d\t", v[i]);
    }

    printf("\n");

    return 0;
}