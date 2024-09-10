# Recursion, local vars, args in regs, rval

   .text
main:
   li	$sp, 0x7ffffffc	# initialize $sp

   # PROLOGUE
   subu	$sp, $sp, 8
   sw	$ra, 8($sp)
   sw	$fp, 4($sp)
   addu	$fp, $sp, 8

   # BODY
   subu	$sp, $sp, 4 	# grow stack for n = 4>
   li	$t0, 4  	# n = 20, $fp-8
   sw 	$t0, 4($sp)

   # call f(n), passing arg in $a0
   lw	$a0, -8($fp)	# arg = n
   jal	f

   move	$a0, $v0	# printf("%d", result)
   li  	$v0, 1		# print_int
   syscall
   li	$a0, 10		# printf("%c", '\n')
   li  	$v0, 11
   syscall

   # EPILOGUE
   move	$sp, $fp
   lw	$ra, ($fp)
   lw	$fp, -4($sp)
   jr	$ra

f:
   # PROLOGUE
   subu	$sp, $sp, 8
   sw	$ra, 8($sp)
   sw	$fp, 4($sp)
   addu	$fp, $sp, 8

   # BODY
   bne	$a0, 1, rec     # if $a0 == 1 goto rec
   move	$v0, $a0
   j	ret

rec:
   subu	$sp, $sp, 4	# save arg j on stack
   sw 	$a0, 4($sp)
   sub	$a0, $a0, 1	# $a0 = arg j-1
   jal  f 		# call f
   # $v0 == f(j-1)
   lw	$t1, 4($sp)	# $t1 = j
   mul	$t1, $t1, $t1  	# $t1 = j*j
   add	$v0, $v0, $t1  	# $v0 = f(j-1) + j*j 

ret:
   # EPILOGUE
   move	$sp, $fp
   lw	$ra, ($fp)
   lw	$fp, -4($sp)
   jr 	$ra
