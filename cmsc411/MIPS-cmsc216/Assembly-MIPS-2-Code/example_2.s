# example_2.s

   .data
y: 
   .word 45
str1:
   .asciiz "result: "

   .text
main:
   li  	$v0, 5		# read_int code in $v0
   syscall		# input int in $v0
   sw 	$v0, y		# end scanf("%d", &y)
   move $t1, $v0	# $t1 = in-use y

   li	$v0, 4		# printf("%s", str1)
   la	$a0, str1
   syscall

   li 	$t0, 45		# $t0 = 45 (first operand)
   mul	$t0, $t0, $t1	# $t0 = 45 * y (result)

   li  	$v0, 1		# printf("%d", result)
   move $a0, $t0
   syscall

   li  	$v0, 11		# printf("\n")
   li 	$a0, 10
   syscall

   jr 	$ra 		# return to kernel
