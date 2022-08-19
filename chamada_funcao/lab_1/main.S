.section .rodata
    aux: .string "Hello"

.data 
    .globl val
    .align 4
    val: .int  432

    .globl age
    .align 2
    age: .word 4

    .globl r
    .align 4
    r: .int 0

    .globl err
    .align 4
    err: .int 4

.text
    .globl main

main: 
    pushq %rbp
    movq %rsp, %rbp

    # Chamada Sum
    movq $aux, %rdi
    movl val, %esi
    movw age, %dx
    movq $r, %rcx
    call sum
    movl %eax, err

    # Chamada show
    movl err, %edi
    movl r, %esi
    call show

    movl $0, %eax

    leave
    ret