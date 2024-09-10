# No args, no rval, no local vars
   .data
strf:
   .asciiz "in f\n"
strg:
   .asciiz "in g\n"

   .text
main:
   li	$sp, 0x7ffffffc	# initialize $sp

   # PROLOGUE
   subu	$sp, $sp, 8
   sw	$ra, 8($sp)
   sw	$fp, 4($sp)
   addu	$fp, $sp, 8

   # BODY
   jal	f		# call f

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
   li  	$v0, 4		# printf("%s", strf)
   la	$a0, strf
   syscall

   jal 	g
   
   # EPILOGUE
   move	$sp, $fp
   lw	$ra, ($fp)
   lw	$fp, -4($sp)
   jr 	$ra


g:
   # PROLOGUE
   subu	$sp, $sp, 8
   sw	$ra, 8($sp)
   sw	$fp, 4($sp)
   addu	$fp, $sp, 8

   # BODY
   li  	$v0, 4		# printf("%s", strg)
   la	$a0, strg
   syscall
   
   # EPILOGUE
   move	$sp, $fp
   lw	$ra, ($fp)
   lw	$fp, -4($sp)
   jr 	$ra
