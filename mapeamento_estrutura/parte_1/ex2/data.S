.section .rodata
    printf1: .string "%ld\n"

.data

.text
    .globl show
        show: 
            pushq %rbp
            movq %rsp, %rbp
            subq $32, %rsp
            
            movq %rbx, -8(%rbp) 
            movq %r12, -16(%rbp)
            movq %r13, -24(%rbp)

            movq %rdi, %rbx # d
            leaq 8(%rdi), %r12 # ptr
            movl $0, %r13d # i 

            inicio_for:
                cmpl (%rbx), %r13d
                jge fim_for
                
                movslq %r13d, %r8
                imulq $8, %r8
                addq %r12, %r8

                movq $printf1, %rdi
                movq (%r8), %rsi
                movl $0, %eax
                call printf

                incl %r13d
                jmp inicio_for
            fim_for:
                movq -8(%rbp), %rbx 
                movq -16(%rbp), %r12
                movq -24(%rbp), %r13

                leave
                ret