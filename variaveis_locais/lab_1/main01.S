.section .rodata
    str1: .string "Soma: %ld\n"

.data

.globl main
    main:
        pushq %rbp
        movq %rsp, %rbp
        subq $32, %rsp

        # i -4
        # l -16
        # rbx -24

        movq %rbx, -24(%rbp)

        call constante
        movsbw %al,%bx

        movw %bx, %di
        leaq -16(%rbp), %rsi
        leaq -4(%rbp), %rdx
        call init

        movq $str1, %rdi

        leaq -16(%rbp), %r8
        movq (%r8), %rsi # valor de l esta aqui
        leaq -4(%rbp), %r9 # recupera o endereço de i
        movslq (%r9), %r8 # alarga i
        addq %r8, %rsi # somo i ao l
        movswq %bx, %r8
        addq %r8, %rsi # somo s ao l + i

        movl $0, %eax
        call printf

        movq -24(%rbp), %rbx
        leave
        ret