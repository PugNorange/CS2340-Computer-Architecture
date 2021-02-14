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
f:	.word	0
g:	.word	5
h:	.word	6
i:	.word	3
j:	.word	3
	

# Main body
	.text
main:
	# load a, b, c
	lw	$s0, f
	lw	$s1, g
	lw	$s2, h
	lw	$s3, i
	lw	$s4, j
	
	bne	$s3, $s4, Else
	add	$s0, $s1, $s2
	j 	Exit
Else:	sub	$s0, $s1, $s2
	
	# exit program
Exit:
	li	$v0, 10
	syscall