#include <stdio.h>

int sum(const char *prefix, int v1, short v2, int *s);
void show(int err, int r);

int val = 432;
short age = 4;
int r = 0;
int err = 0;

int main() {

    err = sum("Hello", val, age, &r);

    show(err, r);

    return 0;
}