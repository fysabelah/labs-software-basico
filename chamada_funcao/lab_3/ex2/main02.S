.section .rodata
    printf_01: .string "Iteração %d, v = %d\n"

.data
    .globl i
    .align 4
    i: .int 0

    .globl vetA
    .align 2
    vetA: .word 28, 42, 16, 23, 47

    .globl vetB
    .align 4
    vetB: .int 0, 0, 0, 0, 0

.text
    .globl main
        main:
            pushq %rbp
            movq %rsp, %rbp

            inicio_while: 
                # _if(i < 5) -> (i >= 5)
                cmpl $5, i
                jge fim_while
                    movq $vetA, %r8 # endereço de vetA
                    movslq i, %r9
                    imulq $2, %r9
                    addq %r8, %r9 # vetA[i]

                    shlw $2, (%r9) # vetA[i] << 2
                    movw (%r9), %r8w # v = vetA[i] << 2

                    # chamada printf
                    movq $printf_01, %rdi
                    movl i, %esi
                    movswl %r8w, %edx
                    movl $0, %eax
                    # call printf não pode chamar porque bagunça os registradores

                    # chamada process
                    movl i, %edi # i
                    movw %r8w, %si # v
                    movq $vetB, %rdx # endereço de vetB
                    movslq i, %r9
                    imulq $4, %r9
                    addq %r9, %rdx # &vetB[i]
                    call process

                    incl i
                    jmp inicio_while
                fim_while:
                    movq $vetB, %rdi # &vetB
                    movq $5, %rsi
                    call show
                    
                    movl $0, %eax
                    leave
                    ret