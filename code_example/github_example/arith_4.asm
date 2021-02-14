#
#
.data 
a:		.word	8
b:		.word	7
c:		.word	2
d:		.word	1
result1:	.word	0
result2:	.word	0


.text
	# use addi 
	li	$t1, 2
	addi	$t1, $t1, 3
	addi	$t1, $t1, 5
	sw	$t1, result1
	
	# result2 = ( a + b) - (c + d);
	# step 1: load the data
	lw	$t1, a
	lw	$t2, b
	lw	$t3, c
	lw	$t4, d
	# step 2: (a + b)
	add	$t1, $t1, $t2
	# step 3: (c + d)
	add	$t3, $t3, $t4
	# step 4: ( a + b) - (c + d)
	sub	$t0, $t1, $t3
	# step 5: store into result2
	sw	$t0, result2
	
	
exit:
	li	$v0, 10
	syscall