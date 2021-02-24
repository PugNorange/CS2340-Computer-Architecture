# practice program 4
# for (i=0; i<10; i++)
#	c +=5;  
# use immediate load/add instructions

.data
c:	.word	0
msg:	.asciiz "complete"

.text
main:	
	# load words into reg
	lw	$t0,	c
	li	$t1,	0
	li	$t2,	9
	# if $t1 is not equal to $t2 (nine), keep calling loop
	j	loop
	j	exit



loop:
	beq	$t1,	$t2,	exit
	addi	$t0,	$t0,	5	# else  c += 5
	addi	$t1,	$t1,	1	# 	$t1 = $t1 + 1
	j	loop			# loop again
		

exit:
	li	$v0,	4
	la	$a0,	msg
	syscall
	li	$v0, 	10
	syscall