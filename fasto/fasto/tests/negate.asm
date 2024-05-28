	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
	li	x11, 1
# was:	li	_tmp_3_, 1
# 	mv	_let_b_2_,_tmp_3_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_4_
# was:	bne	_let_b_2_, x0, l.wBoolF_4_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_4_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_7_
# was:	la	_tmp_6_, s.X_7_
# s.X_7_: string "\n"
# 	mv	_let_res_5_,_tmp_6_
# 	mv	x10,_tmp_6_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 0
# was:	li	_tmp_9_, 0
# 	mv	_let_b_8_,_tmp_9_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_10_
# was:	bne	_let_b_8_, x0, l.wBoolF_10_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_10_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_13_
# was:	la	_tmp_12_, s.X_13_
# s.X_13_: string "\n"
# 	mv	_let_res_11_,_tmp_12_
# 	mv	x10,_tmp_12_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 0
# was:	li	_tmp_15_, 0
# 	mv	_let_b_14_,_tmp_15_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_16_
# was:	bne	_let_b_14_, x0, l.wBoolF_16_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_16_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_19_
# was:	la	_tmp_18_, s.X_19_
# s.X_19_: string "\n"
# 	mv	_let_res_17_,_tmp_18_
# 	mv	x10,_tmp_18_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x11, 1
# was:	li	_tmp_21_, 1
# 	mv	_let_b_20_,_tmp_21_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_22_
# was:	bne	_let_b_20_, x0, l.wBoolF_22_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_22_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_25_
# was:	la	_tmp_24_, s.X_25_
# s.X_25_: string "\n"
# 	mv	_let_res_23_,_tmp_24_
# 	mv	x10,_tmp_24_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x18, 1
# was:	li	_tmp_27_, 1
# 	mv	_let_res_26_,_tmp_27_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x18, x0, l.wBoolF_28_
# was:	bne	_let_res_26_, x0, l.wBoolF_28_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_28_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_31_
# was:	la	_tmp_30_, s.X_31_
# s.X_31_: string "\n"
# 	mv	_let_tmp_29_,_tmp_30_
# 	mv	x10,_tmp_30_
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	_mainres_1_, _let_res_26_
# 	mv	x10,_mainres_1_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Library functions in Fasto namespace
f.ord:
	mv	x10, x10
	jr	x1
f.chr:
	andi	x10, x10, 255
	jr	x1
# Internal procedures (for syscalls, etc.)
p.putint:
	li	x17, 1
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getint:
	li	x17, 5
	ecall
	jr	x1
p.putchar:
	li	x17, 11
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getchar:
	li	x17, 12
	ecall
	jr	x1
p.putstring:
	lw	x7, 0(x10)
	addi	x6, x10, 4
	add	x7, x6, x7
	li	x17, 11
l.ps_begin:
	bge	x6, x7, l.ps_done
	lbu	x10, 0(x6)
	ecall
	addi	x6, x6, 1
	j	l.ps_begin
l.ps_done:
	jr	x1
p.stop:
	li	x17, 93
	li	x10, 0
	ecall
p.RuntimeError:
	mv	x6, x10
	li	x17, 4
	la	x10, m.RunErr
	ecall
	li	x17, 1
	mv	x10, x6
	ecall
	li	x17, 4
	la	x10, m.colon_space
	ecall
	mv	x10, x11
	ecall
	la	x10, m.nl
	ecall
	jal	p.stop
	.data	
# Fixed strings for runtime I/O
m.RunErr:
	.asciz	"Runtime error at line "
m.colon_space:
	.asciz	": "
m.nl:
	.asciz	"\n"
m.space:
	.asciz	" "
# Message strings for specific errors
m.BadSize:
	.asciz	"negative array size"
m.BadIndex:
	.asciz	"array index out of bounds"
m.DivZero:
	.asciz	"division by zero"
# String literals (including lengths) from program
	.align	2
s.X_31_:
	.word	1
	.ascii	"\n"
	.align	2
s.X_25_:
	.word	1
	.ascii	"\n"
	.align	2
s.X_19_:
	.word	1
	.ascii	"\n"
	.align	2
s.X_13_:
	.word	1
	.ascii	"\n"
	.align	2
s.X_7_:
	.word	1
	.ascii	"\n"
	.align	2
s.true:
	.word	4
	.ascii	"true"
	.align	2
s.false:
	.word	5
	.ascii	"false"
	.align	2
# Space for Fasto heap
d.heap:
	.space	100000