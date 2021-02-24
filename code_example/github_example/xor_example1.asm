# demo xor swap


	.text
	li	$t1, 5
	li	$t2, 0xa
	
	# swap using add
	# add	$t3, $t1, $0	# temp = $t1 + zero
	# add	$t1, $t2, $0
	# add	$t2, $t3, $0
	
	
	# swap using xor
	xor	$t1, $t1, $t2
	xor	$t2, $t1, $t2
	xor	$t1, $t1, $t2
	
	
	
	li	$v0, 10
	syscall
	
	