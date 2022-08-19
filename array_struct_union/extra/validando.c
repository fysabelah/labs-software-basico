#include<stdio.h>

typedef struct X1 {
   char c1;
   int i;
   char c2;
} X1;

typedef struct X2 {
   long l;
   char c;
} X2;

typedef struct X3 {
   int i;
   char c1;
   char c2;
} X3;

typedef struct X4 {
   struct X2 x;
   char c;
} X4;

typedef struct X5 {
   short s1;
   int i;
   int c[2][3];
   short s2;
} X5;

typedef union U1 {
   int i;
   char c[5];
} U1;

typedef union U2 {
   short s;
   char c[5];
} U2;

typedef union U3 {
   struct X3 x;
   union U2 u;
} U3;

int main () {

    printf("X1: %lu\n", sizeof(X1));
    printf("X2: %lu\n", sizeof(X2));
    printf("X3: %lu\n", sizeof(X3));
    printf("X4: %lu\n", sizeof(X4));
    printf("X5: %lu\n", sizeof(X5));
    printf("U1: %lu\n", sizeof(U1));
    printf("U2: %lu\n", sizeof(U2));
    printf("U3: %lu\n", sizeof(U3));

    return 0;
}