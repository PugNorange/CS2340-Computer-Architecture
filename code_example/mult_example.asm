#########################################################################
#   Description: calculate b^2 - 4ac
#
#   Modification history:
#   Date        Name        Modification
#   2021-02-05  Che Blankenship
#########################################################################

#########################################################################
#   Main program
#########################################################################

# Variables for main
	.data
a:	.word	10
b:	.word	15
c:	.word	3
result:	.word	0
	

# Main body
	.text
main:
	# load a, b, c
	lw	$s1, a
	lw	$s2, b
	lw	$s3, c
	li	$t0, 4
	
	# multiply
	mult	$t2, $t2	# b^2
	mflo	$t5		# save the low into $t5
	mult	$t0, $s1	# 4*a
	mflo	$t3		# save the low into $t3
	mult	$t3, $s3	# 4a*c
	mflo	$t3
	
	sub	$t5, $t5, $t3	# b^2 - 4ac
	sw	$t5, result
	
	# exit program
exit:
	li	$v0, 10
	syscall