.section .rodata
    fmt: .string "%d\n"
# caller main (tem algum amarelo que precisa salvar) -> f callee
# amarelo: main salva antes de chamar, recupera depois de chamado
# verde: f salva assim que entra e depois recupera no final 

.data

.text
    .globl show
        show:  
            pushq %rbp 
            movq %rsp, %rbp
            subq $32, %rsp

            # i
            movl $0, %r8d
            inicio_for:
                cmpl %esi, %r8d
                jge fim_for

                movslq %r8d, %r9
                imulq $4, %r9
                addq %rdi, %r9 

                movq %rdi, -8(%rbp) # Salvando o endereço do vetor na pila
                movq %rsi, -16(%rbp) # Salvando o tamanho do vetor 
                movq %r8, -24(%rbp) # Salvando o i, se eu usasse um verde não teria problema. Poderia ter salvo só o valor do i

                movq $fmt, %rdi # Passagem de parametros
                movl (%r9), %esi
                movl $0, %eax
                call printf

                # Recuperando
                movq -8(%rbp), %rdi
                movq -16(%rbp), %rsi
                movq -24(%rbp), %r8

                incl %r8d
                jmp inicio_for
            fim_for:
            leave 
            ret


