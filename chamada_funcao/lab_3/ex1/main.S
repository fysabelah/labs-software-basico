.section .rodata
    printf_1: .string "'a' maior do que 'b'\n"
    printf_2: .string "Valor de 'b': %d\n"

.data 
    .globl a
    a: .byte 97

    .globl a
    b: .byte 105

.text 
    .globl main
        main: 
            pushq %rbp
            movq %rsp, %rbp

            movb a, %dil
            movb b, %sil
            call maximo
            movl %eax, %r8d # valor ret

            movswl a, %r9d

            # _if (ret == a) -> (ret != a)
            cmpl %r8d, %r9d
            jne fim_if
                movq $printf_1, %rdi
                movl $0, %eax
                call printf

                jmp fim
            fim_if:
                movq $printf_2, %rdi
                movswl b, %esi
                movl $0, %eax
                call printf

            fim:
                movl $0, %eax
                leave
                ret     