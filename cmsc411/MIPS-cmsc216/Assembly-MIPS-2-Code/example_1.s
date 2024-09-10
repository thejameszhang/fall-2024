# example_1.s

   .data
str1:
   .asciiz "result: "

   .text
main:
   li	$v0, 4		# print_str code in $v0
   la	$a0, str1 	# address of str in $a0
   syscall		# printf("%s", str1)

   li 	$t0, 45		# $t0 = 45 (first operand)
   li	$t1, 29		# $t1 = 29 (second operand)
   mul	$t1, $t0, $t1	# $t1 = 45 * 29

   li  	$v0, 1		# print_int code in $v0
   move $a0, $t1	# int to print in $a0
   syscall		# printf("%d", 45 * 29)

   li  	$v0, 11		# print_char code in $v0
   li 	$a0, 10  	# ascii('\n') == 10
   syscall		# printf('\n')

   jr 	$ra 		# return to kernel
