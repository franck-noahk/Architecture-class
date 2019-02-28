.global _start


_start:
	mov r7, #4
	mov r0, #1
	mov r2, #22
	ldr r1, =prompt
	swi 0

read:
	mov r7, #3
	mov r0, #0
	mov r2, #255
	ldr r1, =orig
	swi 0
	mov r4, #255	@index start at end
	

end:
	mov r7, #1
	swi 0


.data
prompt: .ascii "Plase enter a String:"
orig: .space 255
new: .space 255

