.global sum_array_asm

// calculates a[0] + a[1] + a[2] + ... + a[n - 1]
// note the use of volatile registers only
sum_array_asm:
  // input int arr[]   in rdi
  // input int n       in rsi
  xor %r8, %r8    # counter variable, k = 0
  xor %rax, %rax  # summing variable, s = 0

  // while( k < n ) {s += a[k]; k++ }
  while_loop:
    movl (%rdi, %r8, 4), %r10d  // fetch arr[k]
    addl %r10d, %eax;           // s = s + arr[k]
    addl $1, %r8d               // k = k + 1

    cmpl %esi, %r8d
    jl while_loop

  ret

// c-code for reference
/*
int sum_array_asm(int arr[], int n) {
  int s = 0;
  int k = 0;
  while (k < n) {
    s += arr[k];
    k++;
  }
}
*/
