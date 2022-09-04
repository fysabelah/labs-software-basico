.section .rodata

.data
    .globl vet
    .align 4
    vet: .int 10, 20, 10, 40, 20

.text
    .globl process
        process: 
            pushq %rbp
            movq %rsp, %rbp

            movq $0, (%rdi) # *n = 0
            movl $0, %eax # return 0

            leave
            ret

    .globl calc
        calc:
            pushq %rbp
            movq %rsp, %rbp
            subq $16, %rsp

            # Salvar verde na pilha
            movq %rbx, -8(%rbp)

            # i = 0
            movl $0, %ebx

            begin_while:
                cmpl $5, %ebx
                jge end_while

                # vet[i]
                movq $vet, %r8
                movslq %ebx, %r9
                imulq $4, %r9
                addq %r9, %r8

                # _if 
                if_else:
                    cmpl %esi, (%r8)
                    jne else
                    
                    # Salvar o rdi
                    movq %rdi, -16(%rbp)

                    # Chamada de process
                    movq %r8, %rdi
                    call process

                    # Recuperar rdi
                    movq -16(%rbp), %rdi

                    # Atribuir retorno process
                    movl %eax, (%rdi)

                    jmp fim_if_else
                    else:
                        movl (%rdi), %esi
                fim_if_else:
                incl %ebx
                jmp begin_while

            end_while:
            # Recupera verde da pilha
            movq -8(%rbp), %rbx
            leave
            ret