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
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+44
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+48
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	r0, #60
	mov	r1, #110
	ldr	lr, .L4+52
	ldr	ip, .L4+56
	ldr	r3, .L4+60
	str	r2, [lr]
	stm	r3, {r0, r1}
	str	r2, [ip]
	pop	{r4, lr}
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
	.word	83886592
	.word	mordecaiHeadPal
	.word	100728832
	.word	mordecaiHeadTiles
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	hOff
	.word	state
	.word	.LANCHOR0
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
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions.part.0, %function
instructions.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L12:
	.align	2
.L11:
	.word	buttons
	.size	instructions.part.0, .-instructions.part.0
	.set	credits.part.0,instructions.part.0
	.align	2
	.global	drawPointer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPointer, %function
drawPointer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L14
	ldr	r3, [r2]
	mvn	r3, r3, lsl #18
	mov	r1, #0
	mvn	r3, r3, lsr #18
	ldr	r0, [r2, #4]
	ldr	r2, .L14+4
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LANCHOR0
	.word	shadowOAM
	.size	drawPointer, .-drawPointer
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
	push	{r4, lr}
	mov	r3, #512
	ldr	r4, .L18
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L18+4
	mov	lr, pc
	bx	r4
	mov	r3, #15488
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L18+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L18+12
	ldr	r1, .L18+16
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L18+20
	ldr	r1, .L18+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L18+28
	ldr	r1, .L18+32
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L18+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L18+40
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L18+44
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L18+48
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L19:
	.align	2
.L18:
	.word	DMANow
	.word	gbfGamePal
	.word	gbfGameTiles
	.word	100720640
	.word	gbfGameMap
	.word	83886592
	.word	gameSheetPal
	.word	100728832
	.word	gameSheetTiles
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
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
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L22
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L22+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L22+8
	ldr	r1, .L22+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L22+16
	ldr	r1, .L22+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L22+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L22+32
	mov	lr, pc
	bx	r4
	mov	r0, #0
	mov	r2, #2
	ldr	r1, .L22+36
	ldr	r3, .L22+40
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	DMANow
	.word	gbfInstrPal
	.word	19232
	.word	gbfInstrTiles
	.word	100720640
	.word	gbfInstrMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	hOff
	.word	state
	.size	goToInstructions, .-goToInstructions
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L43
	ldr	r3, [r5]
	mvn	r3, r3, lsl #18
	mov	r1, #0
	mvn	r3, r3, lsr #18
	ldr	r4, .L43+4
	ldr	r0, [r5, #4]
	strh	r3, [r4, #2]	@ movhi
	strh	r0, [r4]	@ movhi
	strh	r1, [r4, #4]	@ movhi
	ldr	r2, .L43+8
	mov	lr, pc
	bx	r2
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r4, .L43+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L43+16
	ldrh	r3, [r3]
	tst	r3, #16
	beq	.L25
	ldr	r2, .L43+20
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L39
.L25:
	tst	r3, #32
	beq	.L26
	ldr	r2, .L43+20
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L40
.L26:
	tst	r3, #8
	beq	.L24
	ldr	r3, .L43+20
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L24
	ldr	r3, [r5]
	cmp	r3, #60
	beq	.L41
	cmp	r3, #130
	beq	.L42
.L24:
	pop	{r4, r5, r6, lr}
	bx	lr
.L40:
	ldr	r2, [r5]
	cmp	r2, #60
	subgt	r2, r2, #70
	strgt	r2, [r5]
	b	.L26
.L39:
	ldr	r2, [r5]
	cmp	r2, #199
	addle	r2, r2, #70
	strle	r2, [r5]
	b	.L25
.L41:
	ldr	r3, .L43+24
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToGame
.L42:
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L44:
	.align	2
.L43:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	start, .-start
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
	ldr	r3, .L47
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	instructions.part.0
.L48:
	.align	2
.L47:
	.word	oldButtons
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
	b	instructions
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
	ldr	r4, .L53
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L53+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L53+8
	ldr	r1, .L53+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L53+16
	ldr	r1, .L53+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L53+24
	ldr	r1, .L53+28
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L53+32
	ldr	r1, .L53+36
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+44
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L53+48
	mov	lr, pc
	bx	r4
	mov	lr, #0
	mov	ip, #60
	mov	r0, #97
	mov	r1, #4
	ldr	r2, .L53+52
	ldr	r3, .L53+56
	str	lr, [r2]
	ldr	r2, .L53+60
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r2]
	pop	{r4, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	DMANow
	.word	gbfPausePal
	.word	18048
	.word	gbfPauseTiles
	.word	100720640
	.word	gbfPauseMap
	.word	83886592
	.word	mordecaiHeadPal
	.word	100728832
	.word	mordecaiHeadTiles
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	hOff
	.word	.LANCHOR0
	.word	state
	.size	goToPause, .-goToPause
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L76
	ldr	r3, [r5]
	mvn	r3, r3, lsl #18
	mov	r1, #0
	mvn	r3, r3, lsr #18
	ldr	r4, .L76+4
	ldr	r0, [r5, #4]
	strh	r3, [r4, #2]	@ movhi
	strh	r0, [r4]	@ movhi
	strh	r1, [r4, #4]	@ movhi
	ldr	r2, .L76+8
	mov	lr, pc
	bx	r2
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r4, .L76+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L76+16
	ldrh	r3, [r3]
	tst	r3, #16
	beq	.L56
	ldr	r2, .L76+20
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L71
.L56:
	tst	r3, #32
	beq	.L57
	ldr	r2, .L76+20
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L72
.L57:
	tst	r3, #8
	beq	.L55
	ldr	r3, .L76+20
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L55
	ldr	r3, [r5]
	cmp	r3, #60
	beq	.L73
	cmp	r3, #130
	beq	.L74
	cmp	r3, #200
	beq	.L75
.L55:
	pop	{r4, r5, r6, lr}
	bx	lr
.L72:
	ldr	r2, [r5]
	cmp	r2, #60
	subgt	r2, r2, #70
	strgt	r2, [r5]
	b	.L57
.L71:
	ldr	r2, [r5]
	cmp	r2, #179
	addle	r2, r2, #70
	strle	r2, [r5]
	b	.L56
.L73:
	pop	{r4, r5, r6, lr}
	b	goToGame
.L75:
	pop	{r4, r5, r6, lr}
	b	goToStart
.L74:
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L77:
	.align	2
.L76:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
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
	ldr	r4, .L80
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L80+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L80+8
	ldr	r1, .L80+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L80+16
	ldr	r1, .L80+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L80+24
	ldr	r1, .L80+28
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L80+32
	ldr	r1, .L80+36
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L80+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L80+44
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L80+48
	mov	lr, pc
	bx	r4
	mov	lr, #0
	mov	ip, #60
	mov	r0, #97
	mov	r1, #5
	ldr	r2, .L80+52
	ldr	r3, .L80+56
	str	lr, [r2]
	ldr	r2, .L80+60
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r2]
	pop	{r4, lr}
	bx	lr
.L81:
	.align	2
.L80:
	.word	DMANow
	.word	gbfLosePal
	.word	9952
	.word	gbfLoseTiles
	.word	100720640
	.word	gbfLoseMap
	.word	83886592
	.word	mordecaiHeadPal
	.word	100728832
	.word	mordecaiHeadTiles
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	hOff
	.word	.LANCHOR0
	.word	state
	.size	goToLose, .-goToLose
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L94
	mov	lr, pc
	bx	r3
	ldr	r4, .L94+4
	ldr	r3, .L94+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L94+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L94+16
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L83
	ldr	r2, .L94+20
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L92
.L83:
	tst	r3, #4
	beq	.L84
	ldr	r3, .L94+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L93
.L84:
	mov	r0, #67108864
	ldr	r1, .L94+24
	ldr	r3, [r1]
	add	r3, r3, #1
	lsl	r2, r3, #16
	lsr	r2, r2, #16
	str	r3, [r1]
	pop	{r4, r5, r6, lr}
	strh	r2, [r0, #20]	@ movhi
	bx	lr
.L93:
	bl	goToLose
	b	.L84
.L92:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L83
.L95:
	.align	2
.L94:
	.word	drawGame
	.word	oldButtons
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	buttons
	.word	hOff
	.size	game, .-game
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L121
	ldrh	r3, [r4]
	tst	r3, #16
	beq	.L97
	ldr	r2, .L121+4
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L116
.L97:
	tst	r3, #32
	beq	.L98
	ldr	r2, .L121+4
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L117
.L98:
	tst	r3, #8
	beq	.L96
	ldr	r5, .L121+4
	ldrh	r3, [r5]
	tst	r3, #8
	bne	.L96
	ldr	r3, .L121+8
	ldr	r3, [r3]
	cmp	r3, #60
	beq	.L118
	cmp	r3, #130
	beq	.L119
	cmp	r3, #200
	beq	.L120
.L105:
	pop	{r4, r5, r6, lr}
	b	goToStart
.L118:
	bl	goToGame
.L103:
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L96
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L105
.L96:
	pop	{r4, r5, r6, lr}
	bx	lr
.L117:
	ldr	r1, .L121+8
	ldr	r2, [r1]
	cmp	r2, #60
	subgt	r2, r2, #70
	strgt	r2, [r1]
	b	.L98
.L116:
	ldr	r1, .L121+8
	ldr	r2, [r1]
	cmp	r2, #179
	addle	r2, r2, #70
	strle	r2, [r1]
	b	.L97
.L119:
	bl	goToInstructions
	b	.L103
.L120:
	bl	goToStart
	b	.L103
.L122:
	.align	2
.L121:
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.size	lose, .-lose
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
	strh	r2, [r3, #10]	@ movhi
	ldr	r2, .L138
	strh	r1, [r3]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L138+4
	ldrh	r2, [r2]
	ldr	r6, .L138+8
	ldr	fp, .L138+12
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r3, .L138+16
	mov	lr, pc
	bx	r3
	ldr	r5, .L138+20
	ldr	r2, [r6]
	ldrh	r0, [fp]
	ldr	r10, .L138+24
	ldr	r9, .L138+28
	ldr	r8, .L138+32
	ldr	r7, .L138+36
	ldr	r4, .L138+40
.L125:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L134
.L127:
	.word	.L132
	.word	.L131
	.word	.L130
	.word	.L129
	.word	.L128
	.word	.L126
.L126:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L125
.L128:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L125
.L129:
	tst	r0, #8
	beq	.L134
	ldr	r3, .L138+44
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L125
.L130:
	tst	r0, #8
	beq	.L134
	ldr	r3, .L138+48
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L125
.L131:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L125
.L132:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L125
.L134:
	mov	r0, r3
	b	.L125
.L139:
	.align	2
.L138:
	.word	hOff
	.word	vOff
	.word	state
	.word	buttons
	.word	goToStart
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	lose
	.word	67109120
	.word	credits.part.0
	.word	instructions.part.0
	.size	main, .-main
	.global	morRow
	.global	morCol
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	morCol, %object
	.size	morCol, 4
morCol:
	.word	60
	.type	morRow, %object
	.size	morRow, 4
morRow:
	.word	110
	.ident	"GCC: (devkitARM release 53) 9.1.0"
