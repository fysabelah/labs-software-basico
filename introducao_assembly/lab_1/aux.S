.data

   .globl c
   c: .byte -20

   .globl i
   .align 4
   i: .int -256

   .globl j
   .align 4
   j: .int 512

   .globl ui
   .align 4
   ui: .int 1024

   .globl l
   .align 8
   l: .quad 128

   .globl ul
   .align 8
   ul: .quad 2048

   .globl us
   .align 2
   us: .word 111

.text

.globl aux
aux:
    pushq %rbp
    movq  %rsp, %rbp

	# Atribuição simples 
    movl $68000, j
	movl $4096, l
	movl j, %eax
	movl %eax, i

	# Soma
	movl $10, %eax
	addl i, %eax
	subl $5, %eax
	movl %eax, j

	# Multiplicação
	movl $2, %eax
	imull j, %eax
	movb %al, c

	# Casts
	# ui = i mesmo tipo, mesmo tamanho
	movl i, %eax
	movl %eax, ui
	# j = c movimento com extensão
	movsbl c, %eax
	movl %eax, j
	# ul = ui movimento com extensão
	movslq ui, %rcx
	movq %rcx, ul
	# us = ul movimento com truncamento
    movq ul, %rcx
	movw %cx, us

	# Ponteiros
	movq $l, %rdi
	movq $128, (%rdi)

    movq $i, %rdi
	movl j, %eax
	addl (%rdi), %eax
	movl %eax, j

    leave

    ret