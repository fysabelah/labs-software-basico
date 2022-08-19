.data 
    .globl last
    .align 8
    last: .quad 0

    .globl values
    .align 8
    .values: .quad 50, -10, 60, -20, 70

.text 
    .globl swap

    swap:
        # int j
        movl $4, %eax

        # int i
        movl $0, %edi

        inicio_for:
            cmpl %edi, %eax
            jge fim_for

            # long temp = values[i]
            movq $values, %r8
            movslq %edi, %r9
            imulq $4, %r9
            addq %r8, %r9
            movl (%r9), %esi # temp %esi

            incl %edi # i++
            decl %eax # j--

            jmp inicio_for
        fim_for:

        leave 
        ret