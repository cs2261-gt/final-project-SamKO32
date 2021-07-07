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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCoin.part.0, %function
drawCoin.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L3
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #17
	mov	r1, #4
	mvn	r3, r3, lsr #17
	ldr	r0, [r2]
	ldr	r2, .L3+4
	strh	r3, [r2, #10]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	coin
	.word	shadowOAM
	.size	drawCoin.part.0, .-drawCoin.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGbf.part.0, %function
drawGbf.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L6
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #17
	mov	r1, #8
	mvn	r3, r3, lsr #17
	ldr	r0, [r2]
	ldr	r2, .L6+4
	strh	r3, [r2, #18]	@ movhi
	strh	r0, [r2, #16]	@ movhi
	strh	r1, [r2, #20]	@ movhi
	bx	lr
.L7:
	.align	2
.L6:
	.word	gbf
	.word	shadowOAM
	.size	drawGbf.part.0, .-drawGbf.part.0
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #3
	mov	r4, #0
	mov	r5, #1
	mov	r2, #100
	mov	lr, #10
	mov	ip, #200
	mov	r0, #5
	mov	r1, #230
	ldr	r3, .L12
	str	r6, [r3]
	ldr	r3, .L12+4
	str	r4, [r3]
	ldr	r3, .L12+8
	str	r4, [r3]
	ldr	r3, .L12+12
	str	r2, [r3]
	str	r4, [r3, #16]
	str	lr, [r3, #4]
	str	r5, [r3, #12]
	str	r5, [r3, #8]
	str	r5, [r3, #24]
	ldr	r3, .L12+16
	str	r2, [r3]
	str	ip, [r3, #4]
	str	r5, [r3, #16]
	ldr	r3, .L12+20
	ldr	r6, .L12+24
	str	r0, [r3]
	ldr	r3, .L12+28
	str	r1, [r6, #4]
	mov	lr, pc
	bx	r3
	mov	r2, r4
	ldr	r3, .L12+32
	smull	ip, r1, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #4
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl r5
	ldr	r3, .L12+36
	str	r5, [r6, #8]
	str	r5, [r6, #12]
	str	r0, [r6]
	add	r1, r3, #120
.L9:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	add	r3, r3, #24
	cmp	r3, r1
	bne	.L9
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	lives
	.word	score
	.word	lost
	.word	mordecai
	.word	gbf
	.word	attacksLeft
	.word	coin
	.word	rand
	.word	458129845
	.word	attack
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
	ldr	r2, .L30
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #17
	mov	r1, #0
	mvn	r3, r3, lsr #17
	ldr	r0, .L30+4
	ldr	r0, [r0, #12]
	ldr	r2, [r2]
	push	{r4, lr}
	ldr	r4, .L30+8
	cmp	r0, r1
	strh	r3, [r4, #2]	@ movhi
	strh	r2, [r4]	@ movhi
	strh	r1, [r4, #4]	@ movhi
	blne	drawCoin.part.0
.L15:
	ldr	r3, .L30+12
	ldr	r3, [r3, #16]
	cmp	r3, #0
	blne	drawGbf.part.0
.L16:
	mov	lr, #12
	ldr	r3, .L30+16
	ldr	ip, .L30+20
	add	r1, r3, #120
.L18:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	ldmne	r3, {r0, r2}
	add	r3, r3, #24
	orrne	r2, r2, ip
	strhne	lr, [r4, #28]	@ movhi
	strhne	r2, [r4, #26]	@ movhi
	strhne	r0, [r4, #24]	@ movhi
	cmp	r3, r1
	bne	.L18
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	mordecai
	.word	coin
	.word	shadowOAM
	.word	gbf
	.word	attack
	.word	-32768
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
	mov	ip, #0
	mov	r0, #100
	mov	r1, #10
	ldr	r3, .L33
	stm	r3, {r0, r1}
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #24]
	str	ip, [r3, #16]
	bx	lr
.L34:
	.align	2
.L33:
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
	mov	r3, #32
	push	{r4, r5, lr}
	ldr	r2, .L60
	ldr	r4, .L60+4
	ldm	r2, {r1, r2}
	sub	sp, sp, #20
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	str	r1, [sp, #4]
	str	r2, [sp]
	ldr	r1, [r4]
	mov	r2, r3
	ldr	r0, [r4, #4]
	ldr	r5, .L60+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldrne	r2, .L60+12
	ldrne	r3, [r2]
	subne	r3, r3, #1
	strne	r3, [r2]
	ldr	r3, .L60+16
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L37
	ldr	r2, .L60+20
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L57
.L37:
	tst	r3, #128
	beq	.L39
	ldr	r2, .L60+20
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L58
.L39:
	tst	r3, #1
	beq	.L35
	ldr	r3, .L60+20
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L35
	ldr	r0, .L60+24
	mov	r2, r0
.L42:
	ldr	r1, [r2, #12]
	cmp	r1, #0
	beq	.L59
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #24
	bne	.L42
.L35:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L58:
	ldr	r2, [r4]
	cmp	r2, #99
	movle	r1, #2
	addle	r2, r2, #20
	strle	r2, [r4]
	strle	r1, [r4, #16]
	b	.L39
.L57:
	ldr	r2, [r4]
	cmp	r2, #10
	subgt	r2, r2, #20
	strgt	r2, [r4]
	mov	r2, #1
	str	r2, [r4, #16]
	b	.L37
.L59:
	mov	ip, #1
	add	r3, r3, r3, lsl ip
	add	r2, r0, r3, lsl #3
	ldr	r1, [r2, #8]
	ldm	r4, {r5, lr}
	add	r1, r1, ip
	str	r5, [r0, r3, lsl #3]
	str	lr, [r2, #4]
	str	r1, [r2, #8]
	str	ip, [r2, #12]
	b	.L35
.L61:
	.align	2
.L60:
	.word	gbf
	.word	mordecai
	.word	collision
	.word	lives
	.word	oldButtons
	.word	buttons
	.word	attack
	.size	updateMordecai, .-updateMordecai
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
	ldr	r2, .L63
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #17
	mov	r1, #0
	mvn	r3, r3, lsr #17
	ldr	r0, [r2]
	ldr	r2, .L63+4
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L64:
	.align	2
.L63:
	.word	mordecai
	.word	shadowOAM
	.size	drawMordecai, .-drawMordecai
	.align	2
	.global	delay
	.syntax unified
	.arm
	.fpu softvfp
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r1, r0, r0, lsl #5
	rsb	r1, r1, r1, lsl #6
	add	r0, r0, r1, lsl #3
	lsl	r1, r0, #6
	cmp	r1, #0
	bxle	lr
	mov	r2, #0
	sub	sp, sp, #8
.L67:
	ldr	r3, [sp, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, r1
	str	r3, [sp, #4]
	bne	.L67
	add	sp, sp, #8
	@ sp needed
	bx	lr
	.size	delay, .-delay
	.align	2
	.global	initAttack
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAttack, %function
initAttack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L77
	add	r1, r3, #120
.L74:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	add	r3, r3, #24
	cmp	r3, r1
	bne	.L74
	bx	lr
.L78:
	.align	2
.L77:
	.word	attack
	.size	initAttack, .-initAttack
	.align	2
	.global	updateAttack
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAttack, %function
updateAttack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #32
	push	{r4, r5, r6, lr}
	ldr	r6, .L87
	ldr	r2, [r6, #4]
	ldr	ip, [r6]
	sub	sp, sp, #16
	ldr	r1, [r0]
	mov	r4, r0
	ldr	r5, .L87+4
	ldr	r0, [r0, #4]
	stm	sp, {r2, ip}
	str	r3, [sp, #12]
	mov	r2, r3
	str	r3, [sp, #8]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L80
	mov	r1, #0
	mov	r2, #512
	ldr	r3, .L87+8
	str	r1, [r6, #16]
	str	r1, [r4, #12]
	strh	r2, [r3, #24]	@ movhi
	strh	r2, [r3, #16]	@ movhi
.L79:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L80:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L79
	ldr	r3, [r4, #4]
	cmp	r3, #197
	movgt	r2, #512
	ldrle	r2, [r4, #8]
	ldrgt	r3, .L87+8
	addle	r3, r2, r3
	strgt	r0, [r4, #12]
	strle	r3, [r4, #4]
	strhgt	r2, [r3, #24]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L88:
	.align	2
.L87:
	.word	gbf
	.word	collision
	.word	shadowOAM
	.size	updateAttack, .-updateAttack
	.align	2
	.global	fireAttack
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireAttack, %function
fireAttack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L100
	mov	r2, r0
	ldr	r1, [r2, #12]
	cmp	r1, #0
	mov	r3, #0
	beq	.L99
.L90:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #24
	bxeq	lr
	ldr	r1, [r2, #12]
	cmp	r1, #0
	bne	.L90
.L99:
	mov	ip, #1
	push	{r4, lr}
	ldr	r1, .L100+4
	add	r3, r3, r3, lsl ip
	add	r2, r0, r3, lsl #3
	ldm	r1, {r4, lr}
	ldr	r1, [r2, #8]
	add	r1, r1, ip
	str	r4, [r0, r3, lsl #3]
	str	lr, [r2, #4]
	str	r1, [r2, #8]
	str	ip, [r2, #12]
	pop	{r4, lr}
	bx	lr
.L101:
	.align	2
.L100:
	.word	attack
	.word	mordecai
	.size	fireAttack, .-fireAttack
	.align	2
	.global	drawAttack
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawAttack, %function
drawAttack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #12]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #4]
	mvn	r3, r3, lsl #17
	mov	r1, #12
	mvn	r3, r3, lsr #17
	ldr	r0, [r0]
	ldr	r2, .L107
	strh	r3, [r2, #26]	@ movhi
	strh	r0, [r2, #24]	@ movhi
	strh	r1, [r2, #28]	@ movhi
	bx	lr
.L108:
	.align	2
.L107:
	.word	shadowOAM
	.size	drawAttack, .-drawAttack
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
	mov	r2, #230
	push	{r4, lr}
	ldr	r4, .L111
	ldr	r3, .L111+4
	str	r2, [r4, #4]
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r3, .L111+8
	smull	ip, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl r1
	str	r3, [r4]
	str	r1, [r4, #8]
	str	r1, [r4, #12]
	pop	{r4, lr}
	bx	lr
.L112:
	.align	2
.L111:
	.word	coin
	.word	rand
	.word	458129845
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
	mov	r3, #32
	push	{r4, r5, lr}
	ldr	r4, .L126
	ldm	r4, {r1, r2}
	sub	sp, sp, #20
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	str	r2, [sp]
	str	r1, [sp, #4]
	ldr	r0, .L126+4
	mov	r2, r3
	ldr	r1, [r0]
	ldr	r5, .L126+8
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r1, #0
	movne	r2, #512
	ldrne	r3, .L126+12
	strne	r1, [r4, #12]
	ldr	r5, .L126+16
	strhne	r2, [r3, #8]	@ movhi
	mov	lr, pc
	bx	r5
	ldr	r3, .L126+20
	smull	r1, r2, r3, r0
	ldr	r1, [r4, #4]
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r1, #0
	sub	r3, r0, r3, lsl #1
	ble	.L115
	add	r0, r4, #8
	ldm	r0, {r0, r2}
	rsbs	r2, r2, #1
	movcc	r2, #0
	sub	r1, r1, r0
	str	r1, [r4, #4]
.L116:
	cmp	r3, #1
	movgt	r3, #0
	andle	r3, r2, #1
	cmp	r3, #0
	bne	.L125
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L115:
	mov	r1, #0
	mov	r0, #512
	str	r1, [r4, #12]
	ldr	r1, .L126+12
	mov	r2, #1
	strh	r0, [r1, #8]	@ movhi
	b	.L116
.L125:
	mov	r3, #230
	str	r3, [r4, #4]
	mov	lr, pc
	bx	r5
	mov	r1, #1
	ldr	r3, .L126+24
	smull	ip, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl r1
	str	r3, [r4]
	str	r1, [r4, #8]
	str	r1, [r4, #12]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L127:
	.align	2
.L126:
	.word	coin
	.word	mordecai
	.word	collision
	.word	shadowOAM
	.word	rand
	.word	1717986919
	.word	458129845
	.size	updateCoin, .-updateCoin
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
	push	{r4, lr}
	ldr	r4, .L130
	bl	updateMordecai
	bl	updateCoin
	mov	r0, r4
	bl	updateAttack
	add	r0, r4, #24
	bl	updateAttack
	add	r0, r4, #48
	bl	updateAttack
	add	r0, r4, #72
	bl	updateAttack
	add	r0, r4, #96
	pop	{r4, lr}
	b	updateAttack
.L131:
	.align	2
.L130:
	.word	attack
	.size	updateGame, .-updateGame
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
	ldr	r3, .L134
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bxeq	lr
	b	drawCoin.part.0
.L135:
	.align	2
.L134:
	.word	coin
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
	mov	r2, #200
	ldr	r1, .L137
	ldr	r3, .L137+4
	ldr	r1, [r1]
	str	r0, [r3, #16]
	stm	r3, {r1, r2}
	bx	lr
.L138:
	.align	2
.L137:
	.word	mordecai
	.word	gbf
	.size	initGbf, .-initGbf
	.align	2
	.global	updateGbf
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGbf, %function
updateGbf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateGbf, .-updateGbf
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
	ldr	r3, .L142
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bxeq	lr
	b	drawGbf.part.0
.L143:
	.align	2
.L142:
	.word	gbf
	.size	drawGbf, .-drawGbf
	.comm	attacksLeft,4,4
	.comm	score,4,4
	.comm	lost,4,4
	.comm	knifeCount,4,4
	.comm	lives,4,4
	.comm	attack,120,4
	.comm	gbf,36,4
	.comm	coin,32,4
	.comm	mordecai,28,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
