
## working
# example from https://gist.github.com/gandaro/1966795


.data
hello:
    .string "Hello world!\n"
hello_end:
    .equ len, hello_end - hello

.text
.globl _start
_start:
    movl $4, %eax               # write(1, hello, strlen(hello))
    movl $1, %ebx
    movl $hello, %ecx
    movl $len, %edx
    
    # interrupt -> 
    int  $0x80  

    movl $1, %eax # exit(0)
    movl $0, %ebx
    int  $0x80