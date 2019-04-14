//Goal is to prompt the user and to figure out how old their dog is in dog years after math. 
//use 7 to be the number of dog years
//using gcc compiler.


.global main
.data

	.balign 4
	return: .word 0
	.balign 4
	dog_prompt: .asciz "Do you have a Dog? 0 for yes and 1 for no\n"
	.balign 4
	format_output: .asciz "%d\n"
	.balign 4
	input_string: .asciz "%d"
	.balign 4
	funny1: .asciz "404 Error found\nBanishment until dog found.\n"
	.balign 4
	funny2: .asciz ""
	.balign 4
	dog_years: .word 0
	.balign 4
	answer: .word 0
	.balign 4
	final_answer: .asciz "\nYour dog is %d years old.\n"
	.balign 4
	prompt2: .asciz "That is good you chose correctly, now how old is your dog?\n"
.align 2
.text
joke:
	ldr r0, address_of_funny1
	bl printf
	b end
main:

prompting_user:
	ldr r1, address_of_return
	str lr, [r1]
	ldr r0, address_of_dog_prompt
	bl printf

	ldr r0, address_of_input_string
	ldr r1, address_of_answer
	bl scanf
	ldr r0, address_of_answer
	ldr r0, [r0]

	cmp r0, #1
	beq joke
	cmp r0, #0
	beq serious

serious:
	ldr r0, address_of_prompt2
	bl printf
	ldr r0, address_of_input_string
	ldr r1, address_of_dog_years
	bl scanf

	ldr r0, address_of_dog_years
	ldr r1, [r0]
	mov r4, #7
	mul r0, r1, r4
	mov r1, r0
	ldr r0, address_of_final_answer
	bl printf

end:
	ldr r1, address_of_return
	ldr lr, [r1]
	bx lr

address_of_return: .word return
address_of_dog_prompt: .word dog_prompt
address_of_format_output: .word format_output
address_of_input_string: .word input_string
address_of_funny1: .word funny1
address_of_funny2: .word funny2
address_of_dog_years: .word dog_years
address_of_answer: .word answer
address_of_prompt2: .word prompt2
address_of_final_answer: .word final_answer
