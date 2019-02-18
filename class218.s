@Goal: the Program should convert a user string to all upper case

.global _start


_start:
    mov r7, #4
    mov r0, #1,
    mov r2, #22
    LDR r1, =prompt
    swi 0

end:
    mov r7, #1
    swi 0

.data
prompt: "Please enter a String:"
