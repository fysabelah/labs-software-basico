.section .rodata 

.data
    .globl i
    .align 4
    i: .int 0
    
    .globl bias
    .align 8
    bias: .quad 256

    .globl vet
    .align 1
    vet: .byte 12, 3, 20, 8

.text
    .globl main
        main:
            pushq %rbp
            movq %rsp, %rbp
            
            # inicio for
            movl $0, i

            inicio_for: 
                cmpl $4, i # _if (i < LEN) -> (i >= LEN)
                jge fim_for
                    movq $vet, %r9 # endereço vetor
                    movslq i, %rdx # Alarga o valor de i
                    imulq $1, %rdx # Pegando endereço do vetor
                    addq %rdx, %r9 # Posição vetor
                    
                    movb (%r9), %dil # Primeiro parâmetro
                    movw $10, %si # Segundo parâmetro
                    movq bias, %rdx # Terceiro parâmetro
                    call filtro # chamada função

                    movq %rax, bias

                    incl i
                jmp inicio_for
            fim_for: 
            
            movl $0, %eax

            leave
            ret