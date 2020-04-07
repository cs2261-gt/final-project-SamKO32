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
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #3
	mov	r1, #64
	mov	r2, #1
	mov	lr, #30
	mov	ip, #0
	mov	r0, #50
	ldr	r3, .L4
	str	r4, [r3]
	ldr	r3, .L4+4
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	ldr	r1, .L4+8
	str	lr, [r3]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r2, [r3, #32]
	str	ip, [r3, #24]
	str	ip, [r3, #4]
	str	r0, [r1, #4]
	str	r0, [r1]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	lives
	.word	mordecai
	.word	coin
	.size	initGame, .-initGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #4
	ldr	r3, .L12
	ldr	r0, .L12+4
	push	{r4, lr}
	ldr	r2, [r3, #4]
	ldr	r4, [r0, #16]
	ldr	r1, .L12+8
	ldr	lr, [r3]
	ldr	r3, .L12+12
	orr	r2, r2, r1
	cmp	r4, #0
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	ip, [r3, #12]	@ movhi
	beq	.L6
	mov	ip, #8
	ldr	r2, [r0, #4]
	orr	r1, r2, r1
	strh	r1, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	strh	ip, [r3, #20]	@ movhi
.L6:
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	coin
	.word	gbf
	.word	-16384
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.align	2
	.global	initMordecai
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMordecai, %function
initMordecai:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	mov	r0, #64
	mov	r1, #0
	mov	ip, #30
	ldr	r3, .L15
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	ip, [r3]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r2, [r3, #32]
	str	r1, [r3, #24]
	str	r1, [r3, #4]
	bx	lr
.L16:
	.align	2
.L15:
	.word	mordecai
	.size	initMordecai, .-initMordecai
	.align	2
	.global	updateMordecai
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMordecai, %function
updateMordecai:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L22
	ldrh	r3, [r3]
	tst	r3, #64
	bxeq	lr
	ldr	r3, .L22+4
	ldrh	r3, [r3]
	tst	r3, #64
	bxne	lr
	mov	r1, #2
	ldr	r3, .L22+8
	ldr	r2, [r3, #4]
	add	r2, r2, #9
	str	r2, [r3, #4]
	str	r1, [r3, #24]
	bx	lr
.L23:
	.align	2
.L22:
	.word	oldButtons
	.word	buttons
	.word	mordecai
	.size	updateMordecai, .-updateMordecai
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	updateMordecai
	.size	updateGame, .-updateGame
	.align	2
	.global	drawMordecai
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMordecai, %function
drawMordecai:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L26
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #18
	mov	r1, #0
	mvn	r3, r3, lsr #18
	ldr	r0, [r2]
	ldr	r2, .L26+4
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L27:
	.align	2
.L26:
	.word	mordecai
	.word	shadowOAM
	.size	drawMordecai, .-drawMordecai
	.align	2
	.global	initCoin
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCoin, %function
initCoin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #50
	mov	ip, #0
	mov	r0, #1
	ldr	r2, .L29
	ldr	r3, .L29+4
	str	r1, [r2, #4]
	str	r1, [r2]
	str	ip, [r3, #4]
	str	r0, [r3, #32]
	bx	lr
.L30:
	.align	2
.L29:
	.word	coin
	.word	mordecai
	.size	initCoin, .-initCoin
	.align	2
	.global	updateCoin
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCoin, %function
updateCoin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateCoin, .-updateCoin
	.align	2
	.global	drawCoin
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCoin, %function
drawCoin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L33
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #18
	mov	r1, #4
	mvn	r3, r3, lsr #18
	ldr	r0, [r2]
	ldr	r2, .L33+4
	strh	r3, [r2, #10]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	bx	lr
.L34:
	.align	2
.L33:
	.word	coin
	.word	shadowOAM
	.size	drawCoin, .-drawCoin
	.align	2
	.global	initGbf
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGbf, %function
initGbf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #1
	mov	r1, #30
	mov	r2, #100
	ldr	r3, .L36
	str	r0, [r3, #16]
	str	r1, [r3, #4]
	str	r2, [r3]
	bx	lr
.L37:
	.align	2
.L36:
	.word	gbf
	.size	initGbf, .-initGbf
	.align	2
	.global	drawGbf
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGbf, %function
drawGbf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L43
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bxeq	lr
	ldr	r1, [r3, #4]
	mvn	r2, r1, lsl #18
	mov	r0, #8
	mvn	r2, r2, lsr #18
	ldr	r3, .L43+4
	strh	r2, [r3, #18]	@ movhi
	strh	r1, [r3, #16]	@ movhi
	strh	r0, [r3, #20]	@ movhi
	bx	lr
.L44:
	.align	2
.L43:
	.word	gbf
	.word	shadowOAM
	.size	drawGbf, .-drawGbf
	.comm	lost,4,4
	.comm	knifeCount,4,4
	.comm	lives,4,4
	.comm	gbf,28,4
	.comm	coin,20,4
	.comm	mordecai,36,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
