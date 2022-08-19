.data

	# char str[] = "BEBAMUITOCAFE"
    .globl str
	.align 1
    str: .string "BEBAMUITOCAFE"
.text

.globl process

process:

   pushq %rbp
   movq  %rsp, %rbp

   # r8 = &str
   movq $str, %r8

beginwhile:

   cmpb $0, (%r8)
   je endwhile          
   
   movb (%r8), %al # al = *r8
   addb $32, %al # al = al + 32
   movb %al, (%r8) # *r8 = al

   incq %r8 # r8++
   
   jmp beginwhile      

endwhile:
   leave

   ret