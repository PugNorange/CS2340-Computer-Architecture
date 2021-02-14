#########################################################################
#   Description: Homework #2
#
#   Date        Name
#   2021-02-07  Che Blankenship
#########################################################################

#########################################################################
#   Main program
#########################################################################

# Variables for main
	.data
promptMsg:	.asciiz "Enter some text: "
length:		.word	100
str:		.space 	100
charCount:	.word	0
wordCount:	.word	0
wordsMsg: 	.asciiz " words "
charsMsg: 	.asciiz " characters \n"
goodbye: 	.asciiz "Good Bye!"
progEnd: 	.asciiz "Message: "

# Main body
	.text
Loop:
	#show a dialog box to user to get string input
	la	$a0, promptMsg			# argument 0 - address of the prompt
	la 	$a1, str			# argument 1 - input buffer
	lw 	$a2, length			# argument 2 - max number of char to read
	li 	$v0, 54				# sys 54     - show dialog
	syscall					# system call
	
	#check status in $a1
	beq	$a1, -2, EndLoop		# result code -2 - cancel btn clicked
	beq 	$a1, -3, EndLoop		# result code -3 - blank input and ok btn clicked
	# if it does not hit these cases, continue.
	# call function count by passing address and lenght in $a0 and $a1
	la 	$a0, str			# argument 0 - input string from user 
	lw 	$a1, length			# argument 1 - length
	jal 	count				# jump to count function 

	# we receive count of chars and words in v0 and v1 respectively. store in memory
	sw 	$v0, charCount
	sw 	$v1, wordCount

	#display the string and counts
	la	$a0, str #displaying string
	li	$v0, 4
	syscall

	#display word count
	lw 	$a0, wordCount
	li 	$v0, 1
	syscall
	la 	$a0, wordsMsg
	li 	$v0, 4
	syscall

	#display char count
	lw	$a0, charCount
	li	$v0, 1
	syscall
	la	$a0, charsMsg
	li	$v0, 4
	syscall
	j Loop

EndLoop:
	#display goodbye message dialog
	la	$a0, progEnd
	la	$a1, goodbye
	li	$v0, 59
	syscall

#exit
li	$v0, 10
syscall

#########################################################################
# function count
# argument: $a0 as user input string, and $a1 as length
# return  : charcount in v0 and word count in v1
#########################################################################
count:
	addi	$sp, $sp, -4		# allocate 4 bytes
	sw 	$s1, 0($sp)		# save the value of $s0 to stack pointer at location zero (only 4 bytes allocated)
	move	$s1, $a0		# move 
	li 	$t1, 0 			# char count
	li 	$t2, 1 			# word count
Loop2:
	lb 	$t3, ($s1)		
	beq 	$t3, '\n', BreakLoop 	# check newline
	beq 	$t3, '\0', BreakLoop	# check null terminator
	add 	$t1, $t1,  1 		# if it doesn't hit the beq, increment char count
	beq 	$t3, ' ',  IncrWord	# check space. if space, call incrword to add +1 
	j 	NextLoc			# jump to next location and 
IncrWord:
	addi 	$t2, $t2, 1		
NextLoc:
	addi 	$s1, $s1, 1		# since we stored the $s1 into stack pointer, we are allowed to modify now
	j 	Loop2
BreakLoop:
	lw 	$s1, 0($sp)		# restore $s1 back into $s1 from stack pointer location zero
	add 	$sp, $sp, 4		# add back the allocated 4 bytes
	#return values in v0 and v1
	move 	$v0, $t1		# return value 1 - char count
	move 	$v1, $t2		# return value 2 - word count
	jr 	$ra			# go back to main
