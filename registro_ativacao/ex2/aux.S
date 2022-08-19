.section .rodata   
    fmt: .string "Valor: x = %ld, i = %d\n"

.data 
    .globl x
    .align 8
    x: .quad 10

.text
    .globl aux
        aux: 
            pushq %rbp
            movq %rsp, %rbp
            subq $32, %rsp

            # x = 5
            movl $5, x

            # Salvando na pilha os valores
            movl %edi, -4(%rbp) # i
            movq %rsi, -16(%rbp) # *ptr

            # Preparando para chamada
            movq $fmt, %rdi
            movslq x, %rsi
            movq -4(%rbp), %rdx
            movl $0, %eax
            call printf

            # Recuperando
            movl -4(%rbp), %edi
            movq -16(%rbp), %rsi

            # Criando o retorno
            movslq x, %rax
            movslq %edi, %r8
            addq %r8, %rax
            addq (%rsi), %rax

            leave
            ret