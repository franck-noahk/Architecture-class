//compiled with gcc compiler only


.data
	.balign 4
	promptNum1: .asciz "Please enter some number that you want to work with\n"
	.balign 4
	inputNum1String: .asciz "%d"
	.balign 4
	outputString: .asciz "Your answer is %d\n"
	.balign 4
	return: .word 0
	.balign 4
	signPrompt: .asciz "What do you want the numbers to do?\n 1)add \n 2)subtract\n 3)multiply\n 4)divide\n"
	.balign 4
	answer: .word 0
	.balign 4 
	signAnswer: .word 0
	.balign 4
	errorString: .asciz "Error recieved in input s given.\n"
	.balign 4
	overflow: .asciz "Congragulations, you broke the matrix with an overflow.:\n"
	.balign 4
	inputNum2Answer: .word 0
	.balign 4
	answer2: .word 0
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
	bl printf
	ldr r0, addressOfInputNum1String
	ldr r1, addressOfAnswer		
	bl scanf
	ldr r5, addressOfAnswer
	ldr r5, [r5]
	ldr r0, addressOfSignPrompt
	bl printf
	ldr r0, addressOfInputNum1String
	ldr r1, addressOfSignAnswer
	bl scanf
	ldr r7, addressOfSignAnswer
	ldr r7, [r7]
	ldr r0, addressOfPromptNum1
	bl printf
	ldr r0, addressOfInputNum1String
	ldr r1, addressOfAnswer2
	bl scanf
	ldr r6, addressOfAnswer2
	ldr r6, [r6]

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
	cmp r5, #0
	ble negative_add

positive_add:
	cmp r6, #0
	ble A_only_1_negative
	adds r1, r5, r6			//might be getting segmation fault here.
	cmp r5, #2147483647
	bge overflowMessage
	cmp r6, #2147483647
	bge overflowMessage
	cmp r1, #2147483647
	bge overflowMessage
	bmi overflowMessage
	//bvs overflowMessage		//branches if overflow flag is set
	b printFinalResult

negative_add:
	 cmp r6, #0 
	 ble A_both_negative

A_both_negative:
	adds r1, r5, r6
	cmp r1, #0 
	bge overflowMessage
	bprintFinalResult

A_only_1_negative:


subtract:
	b printFinalResult

multiply:
	b printFinalResult

divide:
	b printFinalResult

errorMessage:				//getting segmentation fault here 
	ldr r0, addressOfError
	bl printf
	b end

overflowMessage: 
	ldr r0, addressOfOverflow
	bl printf
	b end
printFinalResult:
	ldr r0, addressOfOutputString
	bl printf	
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
addressOfInputNum2String: .word inputNum2Answer
addressOfAnswer2: .word answer2


