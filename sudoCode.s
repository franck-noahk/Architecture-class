	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"sudoCode.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"result :%d\012\000"
	.text
	.align	2
	.global	divisionBySubtraction
	.syntax unified
	.arm
	.fpu vfp
	.type	divisionBySubtraction, %function
divisionBySubtraction:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-16]
	b	.L2
.L3:
	ldr	r1, [fp, #-8]
	ldr	r0, .L5
	bl	printf
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	sub	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bge	.L3
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L6:
	.align	2
.L5:
	.word	.LC0
	.size	divisionBySubtraction, .-divisionBySubtraction
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Please enter a number that you wish to divide\000"
	.align	2
.LC2:
	.ascii	"%d\000"
	.align	2
.LC3:
	.ascii	"Please enter your second number into the terminal\000"
	.align	2
.LC4:
	.ascii	"please enter number 2 larger than number 1\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r0, .L11
	bl	puts
	sub	r3, fp, #8
	mov	r1, r3
	ldr	r0, .L11+4
	bl	__isoc99_scanf
	ldr	r0, .L11+8
	bl	puts
	sub	r3, fp, #12
	mov	r1, r3
	ldr	r0, .L11+4
	bl	__isoc99_scanf
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bge	.L8
	ldr	r0, .L11+12
	bl	puts
	mov	r3, #0
	b	.L10
.L8:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	mov	r1, r2
	mov	r0, r3
	bl	divisionBySubtraction
	mov	r3, r0
	mov	r1, r3
	ldr	r0, .L11+4
	bl	printf
	mov	r3, #0
.L10:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L12:
	.align	2
.L11:
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.size	main, .-main
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
