# Local vars, args in stack, rval

   .text
main:
   li	$sp, 0x7ffffffc	# initialize $sp

   # PROLOGUE
   sub 	$sp, $sp, 8
   sw	$ra, 8($sp)
   sw	$fp, 4($sp)
   add	$fp, $sp, 8

   # BODY
   sub 	$sp, $sp, 8	# grow stack for x,y
   li	$t0, 5  	# x = 5
   sw 	$t0, 8($sp)
   li	$t0, 7  	# y = 7
   sw 	$t0, 4($sp)
   
   # call f(x,y), passing args y,x on stack
   #   $t0 already has y
   #   read x (using base $fp) into $t1
   lw	$t1, -8($fp)	# $t1 = x
   subu	$sp, $sp, 8	# grow stack for args
   # - push args (using base $sp)
   sw 	$t0, 8($sp)	# push y (arg b)
   sw 	$t1, 4($sp)	# push x (arg a)
   jal	f

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
   j	$ra


f:
   # PROLOGUE
   subu $sp, $sp, 8
   sw	$ra, 8($sp)
   sw	$fp, 4($sp)
   addu	$fp, $sp, 8

   # BODY
   sub 	$sp, $sp, 4	# grow stack for z
   li	$t0, 10  	# z = 10
   sw 	$t0, 4($sp)

   # params a,b at $fp + 4, $fp + 8, $t0 has z
   lw	$t1, 4($fp)	# $t1 = a
   lw	$t2, 8($fp)	# $t2 = b
   add	$t0, $t0, $t1  	# $t0 = z + a
   add	$t0, $t0, $t2  	# $t0 = z + a + b
   move	$v0, $t0	# $v0 = z + a + b

   # EPILOGUE
   move	$sp, $fp
   lw	$ra, ($fp)
   lw	$fp, -4($sp)
   jr 	$ra
