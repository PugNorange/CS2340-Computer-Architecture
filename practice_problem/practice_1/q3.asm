# practice program 3
# if (a <= b) c = b else c = a  

.data
a:	.word	5
b:	.word	6
c:	.word	0


.text
main:	
	# load word
	lw	$t0,	a
	lw	$t1,	b
	lw	$t2,	c
	# branch less than equal
	ble	$t0,	$t1,	lessThanEql
	j	notLessThanEql


lessThanEql:
	# c = b
	add 	$t2,	$t2,	$t1
	j	exit


notLessThanEql:
	# c = a
	add	$t2,	$t2,	$t0
	j	exit


exit:	li	$v0, 10
	syscall