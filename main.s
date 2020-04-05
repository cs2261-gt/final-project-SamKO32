	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+8
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	GBFPal
	.word	18656
	.word	GBFTiles
	.word	100720640
	.word	GBFMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #7296
	mov	r1, #4608
	strh	r2, [r3, #10]	@ movhi
	ldr	r2, .L7
	strh	r1, [r3]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L7+4
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	hOff
	.word	vOff
	.size	initialize, .-initialize
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L14
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L14+4
	ldrh	r3, [r3]
	tst	r3, #8
	moveq	r2, #1
	ldreq	r3, .L14+8
	streq	r2, [r3]
	bx	lr
.L15:
	.align	2
.L14:
	.word	oldButtons
	.word	buttons
	.word	state
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L17
	str	r2, [r3]
	bx	lr
.L18:
	.align	2
.L17:
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	instructions, .-instructions
	.align	2
	.global	goToCredits
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToCredits, %function
goToCredits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	goToCredits, .-goToCredits
	.align	2
	.global	credits
	.syntax unified
	.arm
	.fpu softvfp
	.type	credits, %function
credits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	credits, .-credits
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L25
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L25+8
	ldr	r1, .L25+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L25+16
	ldr	r1, .L25+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L25+32
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L25+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	DMANow
	.word	gbfPausePal
	.word	18048
	.word	gbfPauseTiles
	.word	100720640
	.word	gbfPauseMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	game.part.0, %function
game.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L29
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToPause
.L30:
	.align	2
.L29:
	.word	buttons
	.size	game.part.0, .-game.part.0
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L33
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	game.part.0
.L34:
	.align	2
.L33:
	.word	oldButtons
	.size	game, .-game
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L36
	ldr	r2, .L44+4
	ldrh	r2, [r2]
	tst	r2, #8
	moveq	r1, #1
	ldreq	r2, .L44+8
	streq	r1, [r2]
.L36:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L44+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L45:
	.align	2
.L44:
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pause, .-pause
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #7296
	mov	r1, #4608
	push	{r4, r7, fp, lr}
	mov	r7, #1
	strh	r2, [r3, #10]	@ movhi
	ldr	r2, .L70
	strh	r1, [r3]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L70+4
	ldrh	r2, [r2]
	ldr	r4, .L70+8
	ldr	r9, .L70+12
	strh	r1, [r3, #16]	@ movhi
	ldr	r8, .L70+16
	strh	r2, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r8
	ldr	fp, .L70+20
	ldr	r1, [r4]
	ldrh	r2, [r9]
	ldr	r5, .L70+24
	ldr	r6, .L70+28
	ldr	r10, .L70+32
.L48:
	strh	r2, [fp]	@ movhi
	ldrh	r3, [r10, #48]
	strh	r3, [r9]	@ movhi
	cmp	r1, #5
	ldrls	pc, [pc, r1, asl #2]
	b	.L58
.L50:
	.word	.L55
	.word	.L54
	.word	.L54
	.word	.L54
	.word	.L51
	.word	.L49
.L54:
	tst	r2, #8
	beq	.L58
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	ldrh	r3, [r9]
.L58:
	mov	r2, r3
	b	.L48
.L55:
	tst	r2, #8
	beq	.L58
	tst	r3, #8
	moveq	r1, #1
	streq	r7, [r4]
	b	.L58
.L51:
	mov	lr, pc
	bx	r6
	ldr	r1, [r4]
	ldrh	r3, [r9]
	b	.L58
.L49:
	tst	r2, #8
	beq	.L58
	tst	r3, #8
	bne	.L58
	mov	lr, pc
	bx	r8
	ldr	r1, [r4]
	ldrh	r3, [r9]
	b	.L58
.L71:
	.align	2
.L70:
	.word	hOff
	.word	vOff
	.word	state
	.word	buttons
	.word	goToStart
	.word	oldButtons
	.word	game.part.0
	.word	pause
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L74
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L74+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L74+8
	ldr	r1, .L74+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L74+16
	ldr	r1, .L74+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L74+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L74+32
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L74+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L75:
	.align	2
.L74:
	.word	DMANow
	.word	gbfLosePal
	.word	9952
	.word	gbfLoseTiles
	.word	100720640
	.word	gbfLoseMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L81
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L81+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L82:
	.align	2
.L81:
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
