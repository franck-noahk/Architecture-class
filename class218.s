@Goal: the Program should convert a user string to all upper case

.global _start


_start:
    mov r7, #4
    mov r0, #1
    mov r2, #22
    LDR r1, =prompt
    swi 0

read: 
    mov r7, #3
    mov r0, #0
    mov r2, #255
    ldr r1, =string
    swi 0 
    mov r4, #0                  @index for array
    mov r5, #97                 @Ascii for 'a'
    mov r6, #122                @Ascii for 'z'

loop:
    cmp

write:
    mov r7, #4
    mov r0, #1
    mov r2, #255
    ldr r1, =string
    swi 0

end:
    mov r7, #1
    swi 0

.data
prompt: .ascii "Please enter a String:"
string: .ascii "                                                                                       "
