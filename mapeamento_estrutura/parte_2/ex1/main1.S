.section .rodata
    str01: .string "Diferença em %d/%d: %ld\n"


.data
    .globl prods
    .align 8
    prods: .zero 48

.text
    .globl media
        media:
            pushq %rbp
            movq %rsp, %rbp
            subq $32, %rsp

            movq %r12, -8(%rbp)
            movq %r13, -16(%rbp)
            movq %r14, -24(%rbp)
            movq %r15, -32(%rbp)

            movq %rdi, %r12   # *ptr
            movq %rsi, %r13   # size
            movl $0, %r14d    # i = 0
            movq $0, %r15     # soma = 0

            loop_f:
                movslq %r14d, %rax  
                cmpq %r13, %rax   # i >= size
                jge fim_loop_f

                # soma += ptr[i].preco;
                imulq $24, %rax 
                addq %r12, %rax
                addq 8(%rax), %r15

                incl %r14d        # i++
                jmp loop_f

            fim_loop_f:
                # return soma / size;
                movq %r15, %rax
                cqto
                idivq %r13

                movq -8(%rbp), %r12
                movq -16(%rbp), %r13
                movq -24(%rbp), %r14
                movq -32(%rbp), %r15

                leave
                ret

    .globl main
        main:
            pushq %rbp
            movq %rsp, %rbp
            subq $16, %rsp

            movl $0, %r8d     # i = 0
            
            movq $prods, %r9
            movb $1, (%r9) # prods[0].mes
            movq $100, 8(%r9) # prods[0].preco
            movl $2020, 16(%r9) # prods[0].ano

            addq $24, %r9 # prods[1]
            
            movb $2, (%r9) # prods[1].mes
            movq $120, 8(%r9) # prods[1].preco
            movl $2020, 16(%r9) # prods[1].ano
            
            movq %r8, -8(%rbp)

            # m = media(prods, SIZE);
            movq $prods, %rdi # prods
            movq $2, %rsi  # SIZE
            call media    
            movq %rax, %r9    # %r9(m) recebe o retorno de media

            movq -8(%rbp), %r8

        loop_w:
            cmpl $2, %r8d
            jge fim_loop_w
            
            movq $prods, %r10
            movslq %r8d, %r11
            imulq $24, %r11
            addq %r10, %r11 # r11 = &prods[i]

            movq $str01, %rdi
            movsbl (%r11), %esi
            movl 16(%r11), %edx
            movq 8(%r11), %rcx
            subq %r9, %rcx

            # Salvando m e i devido a chamada
            movq %r8, -8(%rbp)
            movq %r9, -16(%rbp)

            movl $0, %eax
            call printf

            movq -8(%rbp), %r8
            movq -16(%rbp), %r9

            incl %r8d      # i++

            jmp loop_w

        fim_loop_w:
            movl $0, %eax
            
            leave
            ret