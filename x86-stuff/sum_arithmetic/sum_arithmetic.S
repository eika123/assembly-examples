.global sum_arithmetic_asm


// calculates 1 + 2 + 3 + ... + n
// note the use of volatile registers only
sum_arithmetic_asm:
  // input n in edi
  xor %r8, %r8             // initialize summing variable s in r8 to zero       ---      xor two equal values is zero
  movl $1, %r9d            // set int k = 1 
  for_loop:
      addl %r9d, %r8d      // s += k
      addl $1, %r9d        // k++;
      cmpl %edi, %r9d      // compare k <= n;
      jle for_loop

  movl %r8d, %eax
  ret

// c-code for reference
/*
int sum_airthmetic_asm(int n) {
  int s = 0;
  for (int k = 0; k <= n; k++) {
    s += k;
  }
}
*/
