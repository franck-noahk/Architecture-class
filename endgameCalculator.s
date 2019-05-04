.data
	.balign 4
	promptNum1: .asciz “Please enter some number that you want to work with”
	.balign 4
	inputNum1String: .asciz “%d”
	.balign 4
	outputString: .asciz “Your answer is %d”
	.balign 4
	return: .word 0
	.balign 4
	signPrompt: .word “What do you want the numbers to do?\n 1)add \n 2)subtract\n 3)multiply\n 4)divide”
.text
.global main
main: 
	ldr r11, addressOfReturn
	str lr, [r11]
promptUser:

add:

subtract:

multiply:

divide:

printFinalResult:


end:
	ldr r11, addressOfReturn
	ldr lr, [r11]
	bx lr

addressOfPromptNum1: .word promptNum1
addressOfInputNum1String: .word inputNum1String
addressOfOutputString: .word outputString
addressOfReturn: .word return




