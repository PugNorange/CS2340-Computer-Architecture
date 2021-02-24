

.data
msg:		.asciiz	"Enter a number to find it's factorial:  "
resultMsg:	.ascii 	"\n The factorial of the number is "
input:		.word	0
ans:		.word	0

.text
	main:
		# prompt user to enter number
		li	$v0,	4
		la	$a0,	msg
		syscall
		# read the num 
		li 	$v0,	5
		syscall 
		sw	$v0,	input		# save the $v0 user input into variable `input`
		
		# call factorial function
		lw	$a0,	input		# set $a0 = input	
		jal	Factorial		# call Factorial
		sw	$v0,	ans		# return value $v0 into variable ans
		
		# Display results
		li	$v0,	4
		la	$a0,	resultMsg
		syscall
		# number
		li	$v0,	1
		add	$a0,	$zero,	$v0
		syscall
		
		# end program
		la	$v0,	10
		syscall


# --------------------------------------------------------- #
	Factorial:
		addi	$sp,	$sp,	-8	# create space for two words 
		sw	$ra,	0($sp)		# save return address to stack location 0
		sw	$s0,	4($sp)		# save local variable to stack location 4
	
		# base case
		li	$v0,	1
		beq 	$a0,	$zero,	FactDone
	
		# 
		add	$s0,	$a0,	$zero	# set $s0 eql to 
		subi	$a0,	$a0,	1
		jal	Factorial

		mul	$v0,	$s0,	$v0
	
	FactDone:
		lw	$ra,	0($sp)
		lw	$s0,	4($sp)
		addi	$sp,	$sp,	8
		jr	$ra

	
	