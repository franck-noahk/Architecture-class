.data

.balign 4
format_output: .asciz "%d\n" //for printf

.balign 4
return: .word 0

.text

address_of_format_output: .word format_output
address_of_return: .word return

.global main

MY_SUB:
  STMFD R13!, {R0-R2}
  MOV R0, #0
  MOV R1, #0
  MOV R2, #0
  LDMFD R13!, {R0-R2}

  BX LR

main:
LDR r5, address_of_return // make r5 a pointer to return
STR lr, [r5] // store current value at address in r5 into r5


  MOV R0, #125
  MOV R1, #144
  MOV R2, #56
  BL MY_SUB   @calls a subroutine named MY_SUB
  ADD R3, R0, R1
  ADD R3, R3, R2

  STMFD R13!, {R0-R2}

  LDR R0, address_of_format_output  //printf arg 1
  MOV R1, R2
	BL printf

  LDMFD R13!, {R0-R2}

  ADD R3, R0, R1
  ADD R3, R3, R2

  LDR R0, address_of_format_output  //printf arg 1
  MOV R1, R3
  BL printf

  LDR r5, address_of_return // make r5 a pointer to return
  LDR lr, [r5] // store value of r5 into lr
  BX lr
