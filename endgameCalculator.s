//compiled with gcc compiler only


.data
	.balign 4
	promptNum1: .asciz "Please enter some number that you want to work with"
	.balign 4
	inputNum1String: .asciz "%d"
	.balign 4
	outputString: .asciz "Your answer is %d"
	.balign 4
	return: .word 0
	.balign 4
	signPrompt: .asciz "What do you want the numbers to do?\n 1)add \n 2)subtract\n 3)multiply\n 4)divide"
	.balign 4
	answer: .word 0
`	.balign 4 
	signAnswer: .word 0
	.balign 4
	error: .asciz "Error recieved in input s given.\n"
	.balign 4
	overflow: .asciz "Congragulations, you broke the matrix with an overflow, or more commonly known:\nSegmentation Fault"
.balign 2
.text

.global main
main: 
	ldr r11, addressOfReturn
	str lr, [r11]



	//at end of promptUser, the registers will hold
	//r5, first number entered
	//r6, second number entered
	//r7, the number of the sign answer
promptUser:	
	ldr r0, addressOfPromptNum1
	bx printf
	ldr r0, addressOfInputNum1String
	ldr r1, addressOfAnswer		
	bx scanf
	ldr r0, addressOfSignPrompt
	bx printf
	ldr r0, addressOfPromptNum1
	ldr r1, addressOfSignAnswer
	bx scanf
	ldr r5, addressOfAnswer
	ldr r0, addressOfInputNum1String
	bx printf
	ldr r0, addressOfInputNum1String
	ldr r1, addressOfAnswer
	bx scanf
	ldr r6, addressOfAnswer
	ldr r7, addressOfSignAnswer

decision:
	cmp r7, #1
	b add
	cmp r7, #2
	b subtract
	cmp r7, #3
	b multiply
	cmp r7, #4
	b divide
	b errorMessage

add:
	adds r2, r5, r6

	b printFinalResult

subtract:
	b printFinalResult

multiply:
	b printFinalResult

divide:
	b printFinalResult

errorMessage: 
	ldr r1, addressOfError
	bx printf
	b end

overflowMessage: 
	ldr r1, addressOfOverflow
	bx printf
	b end
printFinalResult:
	ldr r1, addressOfOutputString
	
end:
	ldr r11, addressOfReturn
	ldr lr, [r11]
	bx lr

//addresses
addressOfPromptNum1: .word promptNum1
addressOfInputNum1String: .word inputNum1String
addressOfOutputString: .word outputString
addressOfReturn: .word return
addressOfAnswer: .word answer
addressOfSignPrompt: .word signPrompt
addressOfSignAnswer: .word signAnswer
addressOfError: .word errorString
addressOfOverflow: .word overflow




