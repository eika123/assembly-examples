# example from https://gist.github.com/gandaro/1966795
# more info from https://w3.cs.jmu.edu/kirkpams/OpenCSF/Books/csf/html/Syscall.html#f11

# Important UNIX design philosophy point:
# Everything behaves like a file. Therefore all pheripherals are files, and
# writing to a screen is performed by writing to stdout, a "special" file.

# In general, users cannot do this directly. One invokes the OS to do it for the user.
# The syscall instruction will send an interrupt that causes the computer to trap into the
# operating system. Along with info passed by the user in registers, the operating
# system determines what "service" to provide the user.

.data
hello:
    .string "Hello world!\n"
hello_end: 
   .equ len, hello_end - hello

.text
.globl _start 
_start:
        # printing setup and system call, signature like
        # syscall(1, 1, pointer_to_buffer, length_of_buffer),
        # see https://w3.cs.jmu.edu/kirkpams/OpenCSF/Books/csf/html/Syscall.html#f11
        # on direct use of system call from C for details.

        movq $1,     %rax       # system call number 1: write
        movq $1,     %rdi       # file handle. Number 1 is stdout
        movq $hello, %rsi       # move address of hello string to rsi register
        movq $len,   %rdx       # number of bytes in the string
        syscall                 # trap into OS to perform the system call.

        # Try removing these. You may get a segmentation fault.
        # system call for exit(0)
        movq $60, %rax          # 60 is the exit system call
        movq $0,  %rdi          # exit system call looks here for expected return code
        syscall

### addendum
# On a 64-bit linux system you can see available system calls and their numberings
# in the file /usr/include/asm/unistd_64.h
# If you have time or like to procrastinate, have a look!
