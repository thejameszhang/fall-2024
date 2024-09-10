# Local vars, args in regs, rval

   .text
main:
   li	$sp, 0x7ffffffc	# initialize $sp
   # PROLOGUE
   subu	$sp, $sp, 8
   sw	$ra, 8($sp)
   sw	$fp, 4($sp)
   addu	$fp, $sp, 8

   # BODY
   subu	$sp, $sp, 8	# grow stack for x,y
   li	$t0, 5  	# x = 5
   sw 	$t0, 8($sp)
   li	$t0, 7  	# y = 7
   sw 	$t0, 4($sp)
   
   # call f(x,y), pass x, y in $a0, $a1
   lw 	$a0, -8($fp)	# $a0 = x (base $fp)
   lw 	$a1, -12($fp)	# $a0 = y (base $fp)
   jal	f		# result in $v0

   move	$a0, $v0	# printf("%d", result)
   li  	$v0, 1
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
   subu	$sp, $sp, 4	# grow stack for z
   li	$t0, 10  	# z = 10
   sw 	$t0, 4($sp)

   move $v0, $t0	# $v0 = z
   add	$v0, $v0, $a0  	# $v0 = z + a
   add	$v0, $v0, $a1  	# $v0 = z + a + b

   # EPILOGUE
   move	$sp, $fp
   lw	$ra, ($fp)
   lw	$fp, -4($sp)
   jr 	$ra
