.data
message1: .asciiz "Please, provide a base number: "
message2: .asciiz "Please, provide a exponent number: "
message3: .asciiz "Result is: "

.text

main:

	li $v0, 4
	la $a0, message1
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0 	
	
	li $v0, 4
	la $a0, message2
	syscall
	
	li $v0, 5
	syscall
	
	move $a0, $t0	#base
	move $a1, $v0	#exponent 
	
	jal funcPow
	
	move $s0, $v0
	
	li $v0, 4
	la $a0, message3
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	funcPow:
		
		fact:
		
			addi $sp, $sp, -4	
			sw $ra, 0($sp) 
			
		 	bne $a1, $zero, Else
		 	addi $v0, $zero, 1 #return 1
		 	addi $sp, $sp, 4
		 	
			jr $ra
			
		Else:
			addi $a1, $a1, -1 #e-1
			jal fact
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
		
			mul $v0, $a0, $v0
		
			jr $ra
			
		
		
	
		


	
	
	
	
	
