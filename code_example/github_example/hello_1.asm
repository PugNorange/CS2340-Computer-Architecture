#
#
.data
name:	.space	20
prompt:	.asciiz "Please enter your name: "
msg:	.asciiz "Hello "

.text 
main:
	# output prompt
	li	$v0, 4		# 4 - print string
	la	$a0, prompt
	syscall
	
	# input name
	li	$v0, 8		# 8 - read string
	li	$a1, 20		# $a1 is use for setting max number of char to read
	la	$a0, name	# $a0 is input buffer
	syscall
	
	# say hello
	li	$v0, 4
	la	$a0, msg
	syscall
	
	# print name
	li	$v0, 4
	la	$a0, name
	syscall
	
exit:
	li	$v0, 10
	syscall