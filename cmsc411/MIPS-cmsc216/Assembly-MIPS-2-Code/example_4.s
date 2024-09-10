# example4.s
#  - [n, i, sum] in-use in [$t0, $t1, $t2]
#  - i*i in $t3

      .data
str1: .asciiz	"sum: "
n:    .word 20
i:    .word 1
sum:  .word 0

      .text
main: lw	$t0, n		   # $t0 = n in-use
      lw 	$t1, i		   # $t1 = i in-use
      lw	$t2, sum	   # $t2 = sum in-use

loop: bgt	$t1, $t0, endloop    # if i > n goto end
      mul	$t3, $t1, $t1 	   # $t3 = i * i
      add 	$t2, $t2, $t3 	   # sum = sum + i * i
      add 	$t1, $t1, 1  	   # i = i + 1
      j 	loop
endloop:
      sw	$t0, n		   # update memory n
      sw 	$t1, i		   # update memory i
      sw	$t2, sum	   # update memory sum

      li 	$v0, 4		   # printf("%s", str1)
      la 	$a0, str1
      syscall
 
      li  	$v0, 1		   # printf("%d", sum)
      move	$a0, $t2
      syscall

      li  	$v0, 11		   # printf("\n")
      li 	$a0, 10
      syscall

      jr 	$ra 		   # return to kernel
