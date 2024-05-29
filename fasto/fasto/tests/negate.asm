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
	li	x0, 1
# was:	li	_let_x0_2_, 1
	li	x0, 1
# was:	li	_let_b_I1_3_, 1
	li	x11, 1
# was:	li	_tmp_5_, 1
# 	mv	_let_b_4_,_tmp_5_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_6_
# was:	bne	_let_b_4_, x0, l.wBoolF_6_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_6_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_9_
# was:	la	_tmp_8_, s.X_9_
# s.X_9_: string "\n"
	mv	x18, x10
# was:	mv	_let_res_7_, _tmp_8_
# 	mv	x10,_tmp_8_
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_let_tmp_10_,_let_res_7_
	li	x0, 0
# was:	li	_let_x1_11_, 0
	li	x0, 0
# was:	li	_let_b_I2_12_, 0
	li	x11, 0
# was:	li	_tmp_14_, 0
# 	mv	_let_b_13_,_tmp_14_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_15_
# was:	bne	_let_b_13_, x0, l.wBoolF_15_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_15_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_18_
# was:	la	_tmp_17_, s.X_18_
# s.X_18_: string "\n"
	mv	x18, x10
# was:	mv	_let_res_16_, _tmp_17_
# 	mv	x10,_tmp_17_
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_let_tmp_19_,_let_res_16_
	li	x0, 0
# was:	li	_let_x2_20_, 0
	li	x0, 0
# was:	li	_let_b_I3_21_, 0
	li	x11, 0
# was:	li	_tmp_23_, 0
# 	mv	_let_b_22_,_tmp_23_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_24_
# was:	bne	_let_b_22_, x0, l.wBoolF_24_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_24_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_27_
# was:	la	_tmp_26_, s.X_27_
# s.X_27_: string "\n"
	mv	x18, x10
# was:	mv	_let_res_25_, _tmp_26_
# 	mv	x10,_tmp_26_
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_let_tmp_28_,_let_res_25_
	li	x0, 1
# was:	li	_let_x3_29_, 1
	li	x0, 1
# was:	li	_let_b_I4_30_, 1
	li	x11, 1
# was:	li	_tmp_32_, 1
# 	mv	_let_b_31_,_tmp_32_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_33_
# was:	bne	_let_b_31_, x0, l.wBoolF_33_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_33_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_36_
# was:	la	_tmp_35_, s.X_36_
# s.X_36_: string "\n"
	mv	x18, x10
# was:	mv	_let_res_34_, _tmp_35_
# 	mv	x10,_tmp_35_
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_let_tmp_37_,_let_res_34_
	li	x0, 1
# was:	li	_let_b_I5_38_, 1
	li	x0, 1
# was:	li	_let_b_39_, 1
	li	x18, 1
# was:	li	_tmp_41_, 1
# 	mv	_let_res_40_,_tmp_41_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x18, x0, l.wBoolF_42_
# was:	bne	_let_res_40_, x0, l.wBoolF_42_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_42_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_45_
# was:	la	_tmp_44_, s.X_45_
# s.X_45_: string "\n"
# 	mv	_let_tmp_43_,_tmp_44_
# 	mv	x10,_tmp_44_
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	_mainres_1_, _let_res_40_
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
s.X_45_:
	.word	1
	.ascii	"\n"
	.align	2
s.X_36_:
	.word	1
	.ascii	"\n"
	.align	2
s.X_27_:
	.word	1
	.ascii	"\n"
	.align	2
s.X_18_:
	.word	1
	.ascii	"\n"
	.align	2
s.X_9_:
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