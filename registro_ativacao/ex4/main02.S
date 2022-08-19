.section .rodata

.data
    .globl v1
    .align 2
    v1: .short 1, 2

    .globl v2
    .align 8
    v2: .quad 1, 2, 3


.text
    .globl aux
        aux:
            pushq %rbp
            movq %rsp, %rbp
            subq $32, %rsp  
            
            movq %rbx, -8(%rbp) # Salvando verde %rbx porque vou usar
            
            movl $2, %ebx
            inicio_for:
                cmpl $0, %ebx
                jl fim_for  

                # Salvando amarelo
                movq %rdi, -16(%rbp)
                movq %rsi, -24(%rbp)

                # %rdi Aqui no primeiro parâmetro ambas recebem o mesmo, logo não precisa repassar
                # %rsi Aqui no segundo parâmetro ambas recebem o mesmo, logo não precisa repassar
                movq $v2, %rdx
                movl %ebx, %ecx
                call sum

                # Recuperando amarelo
                movq -16(%rbp), %rdi
                movq -24(%rbp), %rsi

                decl %ebx

                jmp inicio_for
            fim_for:
            movq -8(%rbp), %rbx # Recuperanod verde %rbx porque vou usar
            leave 
            ret

    .globl main
        main:
            pushq %rbp
            movq %rsp, %rbp
            subq $16, %rsp

            movq %rbx, -8(%rbp)  # Salva o verde
            movl $0, %ebx 

            inicio_while:
                cmpl $2, %ebx
                jge fim_while

                movq $v1, %rdi
                movl %ebx, %esi
                call aux

                incl %ebx  

                jmp inicio_while          
            fim_while:
            movq -8(%rbp), %rbx
            movq $0, %rax

            leave
            ret