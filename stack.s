.data
Stack_top equ 0x40008000

.balign 4
addressOfFormatOutput: .word formatOutput


.text
.global main
main:
	ldr r13, =Stack_top
	ldr r0, =0x125
	ldr r1, =0x144
	mov r2, #0x56
	BL mySub 			//calls a subrutine called mySub
	add r3, r0, r1
	add r3, r3, r2

	stmfd r13!, {r0-r2}
	ldr r0 , addressOfFormatOutput
	mov r1, r2
	bl printf
	
	ldmfd r13!, {r0-r2}
	add r3, r0, r1
	add r3, r3, r2


mySub:
	STMFD r13!, {r0-r2}
	mov r0, #0
	mov r1, #0
	mov r2, #0
	ldmfd r13, {r0-r2}
	bx lr

end
