# practice program 6
# while (s2[i] = s1[i] != '/0'):
#	i++

.data
s1:	.asciiz	"hi"
	.align	2
s2:	.space	4


.text
main:	
	la	$t1,	s1
	la	$t2,	s2
	

whileLoop:
	lbu	$t3,	($t1)		# load byte into reg
	sb	$t3,	($t2)		# store byte into the space reg
	beq	$t3,	$zero,	exit
	addi	$t1,	$t1,	1	# increase one byte of address
	addi	$t2,	$t2,	1
	j	whileLoop


exit:	li	$v0, 10
	syscall

