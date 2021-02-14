#########################################################################
#   Description: loop example
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
n:	.word	3
count:	.word	0
	

# Main body
	.text
main:
	li	$t1, 0
	lw	$t2, n

loop:	beq	$t1, $t2, done
	addi	$t1, $t1, 1	#i++
	j	loop
	
done:	sw	$t1, count
	
	# exit program
exit:
	li	$v0, 10
	syscall