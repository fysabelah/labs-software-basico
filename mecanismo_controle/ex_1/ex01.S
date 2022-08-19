.section .rodata

.data
    .globl a
    .align 4
    a: .int 30

    .globl b
    .align 4
    b: .int 45

    .globl c
    .align 4
    c: .int -10

    .globl d
    .align 4
    d: .int 25

.text

.globl ex01

ex01:

   pushq %rbp
   movq  %rsp, %rbp

   .globl ex01
   .ex01:
   
   movl a, %eax
   cmpl b, %eax # if (a > b) -> if (a <= b)
   jle fim_1_if 
   # c = -c
   movl c, %edi
   negl %edi
   movl %edi, c

   # d = 2 * c;
   movl $2, %edi
   imull c, %edi
   movl %edi, d

   fim_1_if: 
   movl b, %eax
   cmpl a, %eax # if (b >= a) -> if (b < a)
   jl fim_2_if
   #c = (a + b) * c
   movl a, %edi
   addl b, %edi
   imull c, %edi
   movl %edi, c

   # d = 1024
   movl $1024, d

   fim_2_if:
   leave 
   ret