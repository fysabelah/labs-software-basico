.section .rodata


.data


.text

    .globl fat
        fat:
            pushq %rbp
            movq %rsp, %rbp
            subq $16, %rsp 

            cmpl $0, %edi
            jle fim_if
                movq %rdi, -8(%rbp) # Salvando o parametro passado

                subl $1, %edi
                call fat # Chamada recursiva

                movq -8(%rbp), %rdi # Recuperando o registrador

                imull %edi, %eax # Soma do retorno
                leave 
                ret

            fim_if:
                movl $1, %eax
            leave
            ret