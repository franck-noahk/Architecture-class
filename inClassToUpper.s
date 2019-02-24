@ This program will convert a user-provided string to all upper case

.global _start

_start:
	MOV R7, #4		@these 5 lines print the prompt
		MOV R0, #1
			MOV R2, #22
				LDR R1, =prompt
					SWI 0

					read:
						MOV R7, #3		@these 5 lines read 255 chars from keyboard
							MOV R0, #0
								MOV R2, #255
									LDR R1, =string
										SWI 0
											MOV R4, #0   		@index for array
												MOV R5, #97  		@ascii for 'a'
													MOV R6, #122 		@ascii for 'z'

													loop:
														CMP R4, #255		@check if # of loops = 255
															BEQ write		@exit loop if so
																LDRB R8, [R1, R4]	@load byte to register from string
																	CMP R8, R5		@compare byte to 'a'
																		BLT skip		@skip letter if less than 'a'
																			CMP R8, R6		@compare byte to 'z'
																				BGE skip		@skip letter if greater than 'z'
																					SUB R8, R8, #32		@convert to uppercase
																						STRB R8, [R1, R4]	@store byte to string

																						skip:
																							ADD R4, R4, #1		@increment counter
																								B loop			@go to top of loop

																								write:
																									MOV R7, #4		@these 5 lines print the modified string
																										MOV R0, #1
																											MOV R2, #255
																												LDR R1, =string
																													SWI 0

																													end:
																														MOV R7, #1		@these two exit the program gracefully
																															SWI 0

																															.data

																															prompt: .ascii "Please enter a string:"		@the prompt

																															string: .space 256		@empty string of length 256
