# Homework 1
# Che Blankenship
# This program gets the user's name and 3 integers
# then calculate expressions and display the results.

.data 
	# 3 variables to hold input values: a, b, c
	a:	.word 		0
	b:	.word 		0
	c:	.word 		0
	# 3 variables to hold output values
	ans1:	.word 		0
	ans2:	.word 		0
	ans3:	.word 		0
	# a variable to hold the user’s name
	name:	.space 		20
	# 3 variables for messages
	msg1:	.asciiz  	"What is your name? "
	msg2:	.asciiz  	"Please enter an integer between 1-100: "
	msg3:	.asciiz  	"your answers are: "


.text
	main:
		# (1) prompt the user for name 
		la	$a0, msg1		
		li	$v0, 4			
		syscall
		# get user name
		li	$v0, 8			
		la	$a1, 20			
		la	$a0, name	
		syscall
	
	
		# (2) prompt the user for integer 1
		la	$a0, msg2		
		li	$v0, 4			
		syscall
		# read integer from user
		li	$v0, 5			
		syscall
		sw	$v0, a			
	
	
		# (3) prompt the user for integer 2
		la	$a0, msg2		
		li	$v0, 4			
		syscall
		# read integer from user
		li	$v0, 5			
		syscall
		sw	$v0, b			
	
	
		# (4) prompt the user for integer 3
		la	$a0, msg2		
		li	$v0, 4			
		syscall
		# read integer from user
		li	$v0, 5			
		syscall
		sw	$v0, c				
	
	
		# (5) calculate ans1 = 2a - c + 4 (use a+a for 2a) and store the result
		lw	$t0, a			# $t0 = a
		lw	$t1, c			# $t1 = c
		add	$t0, $t0, $t0		# $t0 = ($t0 + $t0) = 2a
		sub	$t0, $t0, $t1		# $t0 = $t0 - $t1 = 2a - c
		addi	$t0, $t0, 4		# $t0 = $t0 + 4 = 2a - c + 4
		sw	$t0, ans1		# store word temp register $t0 into ans1
		
		
		# (6) calculate ans2 = b - c + ( a - 2 ) and store the result
		lw	$t0, a
		lw	$t1, b
		lw	$t2, c
		subi	$t0, $t0, 2
		sub	$t1, $t1, $t2
		add	$t0, $t0, $t1
		sw	$t0, ans2
	
	
		# (7) calculate ans3 = ( a + 3 ) - ( b - 1 ) + ( c + 3 ) and store the result
		lw	$t0, a
		lw	$t1, b
		lw	$t2, c
		addi	$t3, $t0, 3
		subi	$t4, $t1, 1
		addi	$t5, $t2, 3
		sub 	$t6, $t3, $t4
		add	$t7, $t6, $t5
		sw	$t7, ans3
		
		
		# (8) display the user’s name and message for results
		# echo name
		li	$v0, 4
		la	$a0, name
		syscall
		# echo msg3
		li	$v0, 4
		la	$a0, msg3
		syscall
		# echo ans1
		li	$v0, 1
		lw	$a0, ans1 
		syscall
		li	$a0, 32
		li	$v0, 11
		syscall
		# echo ans2
		li	$v0, 1
		lw	$a0, ans2 
		syscall
		li	$a0, 32
		li	$v0, 11
		syscall
		# echo ans3
		li	$v0, 1
		lw	$a0, ans3 
		syscall
		li	$a0, 32
		li	$v0, 11
		syscall
	# exit
	exit:
		li	$v0, 10
		syscall
 
 
 
# Case 1 
# What is your name? Che
# Please enter an integer between 1-100: 10
# Please enter an integer between 1-100: 20
# Please enter an integer between 1-100: 3
# Che
# your answers are: 21 25 0 

# Case 2
# What is your name? Che
# Please enter an integer between 1-100: 55
# Please enter an integer between 1-100: 55
# Please enter an integer between 1-100: 55
# Che
# your answers are: 59 53 62 



