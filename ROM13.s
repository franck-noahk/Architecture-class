@Goal: create a program that encripts a string given by 
@the user, and returns it to the command line in ROT13


.global _start

_start:				@start should print the prompt
	mov r7, #4
	mov r0, #1
	mov r2, #22
	ldr r1, =prompt
	swi 0
read:
	mov r7, #3
	mov r0, #0
	mov r2, #255
	ldr r1, =string
	swi 0
	mov r4, #0		@index
	mov r5, #65		@value for 'A'
	mov r6, #90		@value for 'Z'
	mov r10, #97	@value for 'a'
	mov r11, #122	@value for 'z'
loop:
	cmp r4, #255		@checks if loop = 255
	BEQ write
	ldrb r8, [r1, r4]
	cmp r8, r5 		@comparing element to A
	bge LetterDecision		@Breaks to skip algorith if lower askii than A 
	blt increaseIndex	@reguardless of what happens need to increast the loop

letterDecision: 
	cmp r8, r6
	ble UpperLetter
	cmp r8, r10
	blt increaseIndex
	cmp r8, r11
	blt LittleLetter
	b increaseIndex

UpperLetter:
	mov r0, #76
	cmp r8, r0
	ble add13
	bge sub13

LittleLetter:
	mov r0, #76
	cmp r8, r0
	ble add13
	bge sub13

add13:
	add r8, r8, #13

sub13:
	sub r8, r8, #13

increaseIndex:
	add r4, r4, #1
	blt loop		@returns to the start of the loop

store:


end:
	mov r7, #1
	swi 0
.data
prompt: .ascii "Please enter a String:"
string: .space 256


