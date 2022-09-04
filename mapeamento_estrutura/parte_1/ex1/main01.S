.section .rodata
    printf1: .string "color: %ld, filled: %d\n"

.data
      .globl c1 # para iniciar poderia ser .zero 24
      .align 8
      c1: 
        .int 0 # 4x
        .int 0 # 8y
        .byte 0 # 9 filled
        .zero 7 # padding
        .quad 0 # color

.text
    .globl main
        main:
            pushq %rbp
            movq %rsp, %rbp
            
            movq $c1, %r9

            movl $10, (%r9) # c1.x = 10
            
            movl (%r9), %r8d
            imull $2, %r8d
            movl %r8d, 4(%r9) # c1.y = 2 * c1.x;

            movb $1, 8(%r9) # c1.filled = 1;
            
            cmpl $30, 4(%r9)
            jg break_if

            cmpb $1, 8(%r9)
            jne else

            break_if:
                movq $2, 16(%r9)
                jmp endif
            
            else:
                movq $1, 16(%r9)

            endif:
                movq $printf1, %rdi
                movq 16(%r9), %rsi
                movsbl 8(%r9), %edx
                movl $0, %eax
                call printf

                leave 
                ret