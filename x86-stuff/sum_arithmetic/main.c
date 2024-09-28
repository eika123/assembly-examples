#include <stdio.h>

extern int sum_arithmetic_asm(int n);


int main() {
    int n = 100;
    int sum_n = sum_arithmetic_asm(n);
    printf("1 + 2 + ... + %d = %d", n, sum_n);
}