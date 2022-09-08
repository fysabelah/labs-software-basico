.section .rodata

.data

.text
    .globl calc
        calc:
            pushq %rbp
            movq %rsp, %rbp
            subq $64, %rsp

            movq -8(%rbp), %r12 # i
            movq -16(%rbp), %r13 # j
            # -24 sum
            # -48 vet1[0]
            # -58 vet2[0]

            movl $0, %r12d # i
            movl $4, %r13d # j

            leaq -48(%rbp), %rdi
            movl $5, %esi
            movl %r12d, %edx
            call filli

            leaq -58(%rbp), %rdi
            movl $5, %esi
            movl %r13d, %edx
            call fills

            leaq -24(%rbp), %r8
            movl $0, (%r8)


            leaq -24(%rbp), %r8 # recuperando o valor de sum
            movl (%r8), %eax # sum

            inicio_for:
                cmpl $5, %r12d
                jge fim_for

                # vet1[i]
                leaq -48(%rbp), %r8
                movslq %r12d, %r9
                imulq $4, %r9
                addq %r9, %r8 # &vet1[i]
                
                addl (%r8), %eax # sum + vet1[i]

                # vet2[i]
                leaq -58(%rbp), %r8
                movslq %r13d, %r9
                imulq $2, %r9
                addq %r9, %r8 # &vet2[j]

                movswl (%r8), %r9d # sum + vet2[j]

                addl %r9d, %eax # sum + vet2[j]

                incl %r12d
                decl %r13d

                jmp inicio_for
            fim_for:
                movq -8(%rbp), %r12 # i
                movq -16(%rbp), %r13 # j
                leave
                ret