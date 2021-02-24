# practice program 1
# if (a < 0) a = -a

.data
a:	.word	-5

	.text

main:		
# your code here 
	lw	$t2,	a		# load word a into temp register $t2
	slt 	$t3,	$t2,	$zero	# if ( $t2 < 0 ), $t3 set to zero. else one.
	beq	$t3,	$zero,	else	# If $t3 is zero (true), continue. else, jump to else
	sub 	$t2,	$zero,	$t2	# a = zero - a

else:
	j	exit

exit:
	li	$v0, 10
	syscall