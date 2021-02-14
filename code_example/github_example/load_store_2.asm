#
#

.data 
#a:	.word	3
#b:	.word 	4
#c:	.word 	9
#d:	.word 	9
arr1:	.word 	3, 4
arr2:	.word 	9, 9


.text
main:
	# load a and b
	#lw	$t1, a
	#lw	$t2, b
	
	# store word into c and d
	#sw	$t1, c	# place the $t1 data into address c
	#sw	$t2, d 	# place the $t2 data into address d
	
	# store using the array
	la	$t1, arr1
	la	$t2, arr2
	lw	$t0, ($t1)	# () means the address. here using it as an index. load word into $t0
	sw	$t0, ($t2)	# store $t0 value into index zero address.
	
	# store index 1 value from arr1 into arr2 index 1
	lw	$t0, 4($t1)	# each index can be access by +4
	sw	$t0, 4($t2)
	
exit:
	li	$v0, 10
	syscall