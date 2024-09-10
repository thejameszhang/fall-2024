# example_3.s

	.data
str1:  .asciiz "Enter int n: "
str2:  .asciiz "n is odd\n"
str3:  .asciiz "n is even\n"
n:     .word 0

       .text
main:  li	 $v0, 4		# printf("%s", str1)
       la	$a0, str1
       syscall

       li 	$v0, 5		# scanf("%d", &n)
       syscall
       sw	$v0, n
       move	$t0, $v0	# $t0 = in-use n

       rem	$t0, $t0, 2	# $t0 = n % 2

       beqz	$t0, else	# if $t0 == 0 goto else
       la	$a0, str2 	# $a0 = "n is odd\n"
       j	endif
else:  la 	$a0, str3 	# $a0 = "n is even\n"
endif: li 	$v0, 4		# print_str code
       syscall			# print string at address $a0

       jr 	$ra 		# return to kernel
