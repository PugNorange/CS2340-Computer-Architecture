#
#
.data
age:	.word	0
msg1:	.asciiz	"Please enter your age: "
msg2:	.asciiz "Your age is: "


.text 
main:
	# prompt the user for age
	li	$v0, 4		# sys 4 - print string 
	la	$a0, msg1	# argument - pass msg1
	syscall			# system call
	
	# read the user input
	li	$v0, 5		# sys 5 - read integer
	syscall			# system call
	
	# store the integer into a memory
	sw	$v0, age
	
	# print the `your age is `
	li	$v0, 4		# sys 4 - print str
	la	$a0, msg2	# argument - pass msg2
	syscall			# system call
	
	# print age
	li	$v0, 1		# sys 1 - print int
	li	$a0, age	# argument - pass age
	syscall
	
exit:
	li	$v0, 10
	syscall
	
	