#include <stdio.h>

extern int sum_array_asm(int arr[], int n);


int main() {
    int n = 100;
    int array[n];
    for (int i=0; i<n; i++) {
        array[i] = i + 1;
    }
    int sum_array = sum_array_asm(array, n);
    printf("a[0] + a[1] + ... + a[%d] = %d", n - 1, sum_array);
}
