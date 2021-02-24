# practice program 5
# for (i=0; i<10; i++) a[i] +=5; 

.data
a:	.word	5, 9, 2, 1, 4, 6, 3, 9, 2, 1
len:	.word	10
index:	.word	0


.text
main:	
	la	$t0,	a
	lw	$t1,	len
	lw	$t2,	index
	j	loop


loop:
	beq	$t1,	$t2,	exit
	lw	$t3,	($t0)		# $t3 = arr[i]
	addi	$t3,	$t3,	5	# $t3[i] = $t3[i] + 5 
	sw	$t3,	($t0)		# save it
	addi	$t2,	$t2,	1	# index = index + 1
	addi	$t0,	$t0,	4	# next address element
	j	loop
	

exit:
	li	$v0,	10
	syscall