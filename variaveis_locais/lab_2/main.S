.section .rodata 
    printf1: .string "tipo = %d, ID = %ld, nome = '%s', idade = %d\n"

    printf2: .string "tipo = %d, ID = %ld, nome = '%s', cor = '%s'\n"

.data

.text
    .globl main
        main:
            pushq %rbp
            movq %rsp, %rbp
            subq $128, %rsp

            # -40 inicio person p
            # -120 inicio car c[2] = c[0]

            leaq -40(%rbp), %rdi
            call readPerson

            leaq -120(%rbp), %rdi
            call readCar

            leaq -80(%rbp), %rdi
            call readCar
            
            leaq -40(%rbp), %rdi
            call showPerson

            leaq -120(%rbp), %rdi
            call showCar
            
            leaq -80(%rbp), %rdi
            call showCar

            leave 
            ret

    .globl showPerson
        showPerson:
            pushq %rbp
            movq %rsp, %rbp
            subq $16, %rsp

            movq %rbx, -8(%rbp)

            # trocando parametro para não sobrescrever
            movq %rdi, %rbx
        
            movq $printf1, %rdi
            movl (%rbx), %esi
            movq 8(%rbx), %rdx
            leaq 16(%rbx), %rcx
            movl 32(%rbx), %r8d
            movl $0, %eax
            call printf

            movq -4(%rbp), %rbx

            leave
            ret
    
    .globl showCar
        showCar:
            pushq %rbp
            movq %rsp, %rbp
            subq $16, %rsp

            movq %rbx, -8(%rbp)

            movq %rdi, %rbx

            movq $printf2, %rdi
            movl (%rbx), %esi
            movq 8(%rbx), %rdx
            leaq 16(%rbx), %rcx
            leaq 32(%rbx), %r8
            movl $0, %eax
            call printf

            movq -4(%rbp), %rbx

            leave
            ret