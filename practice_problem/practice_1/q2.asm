# practice program 2
# if (a > 0) a = -a
.data
a:	.word	6	# change to negative to test
result:	.word	0	# result

.text
main:	
	# your code here
	# load word
	lw	$t1,	a
	lw	$t4,	result
	slt	$t3,	$zero,	$t1	# check if $t1 > $zero
	beq 	$t3,	$zero,	exit	# if ($t3 == false) exit
	sub	$t4,	$zero,	$t1
	sw 	$t4,	result

exit:
	li	$v0, 10
	syscall