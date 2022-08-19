.data
    .globl s
    .align 4
    s: .int 0

    .globl nums
    .align 4
    nums: .int 65, -105, 111, 34

.text

.globl sum
sum:  
    pushq %rbp
    movq  %rsp, %rbp

    movl $0, %eax # i

    inicio_loop:
        cmpl $4, %eax # i < 4
        jge fim_lopp
            movq $nums, %rsi # Pegando posição do vetor nums[i]
            movslq %eax, %r8
            imulq $4, %r8
            addq %r8, %rsi
            movl (%rsi), %esi

            movl s, %r8d # somando i com a posição do vetor s = s + nums[i]
            addl %esi, %r8d 
            movl %r8d, s

            addl $1, %eax
        jmp  inicio_loop
    fim_lopp:
    leave
    ret