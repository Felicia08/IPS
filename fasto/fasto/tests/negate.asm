	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -20
	li	x18, 1
# was:	li	_tmp_4_, 1
# 	mv	_let_res_3_,_tmp_4_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x18, x0, l.wBoolF_5_
# was:	bne	_let_res_3_, x0, l.wBoolF_5_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_5_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_8_
# was:	la	_tmp_7_, s.X_8_
# s.X_8_: string "\n"
# 	mv	_let_tmp_6_,_tmp_7_
# 	mv	x10,_tmp_7_
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_let_x0_2_,_let_res_3_
	li	x19, 0
# was:	li	_tmp_11_, 0
# 	mv	_let_res_10_,_tmp_11_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x19, x0, l.wBoolF_12_
# was:	bne	_let_res_10_, x0, l.wBoolF_12_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_12_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_15_
# was:	la	_tmp_14_, s.X_15_
# s.X_15_: string "\n"
# 	mv	_let_tmp_13_,_tmp_14_
# 	mv	x10,_tmp_14_
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_let_x1_9_,_let_res_10_
	li	x20, 0
# was:	li	_tmp_18_, 0
# 	mv	_let_res_17_,_tmp_18_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x20, x0, l.wBoolF_19_
# was:	bne	_let_res_17_, x0, l.wBoolF_19_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_19_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_22_
# was:	la	_tmp_21_, s.X_22_
# s.X_22_: string "\n"
# 	mv	_let_tmp_20_,_tmp_21_
# 	mv	x10,_tmp_21_
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_let_x2_16_,_let_res_17_
	li	x21, 1
# was:	li	_tmp_25_, 1
# 	mv	_let_res_24_,_tmp_25_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x21, x0, l.wBoolF_26_
# was:	bne	_let_res_24_, x0, l.wBoolF_26_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_26_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_29_
# was:	la	_tmp_28_, s.X_29_
# s.X_29_: string "\n"
# 	mv	_let_tmp_27_,_tmp_28_
# 	mv	x10,_tmp_28_
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_let_x3_23_,_let_res_24_
# 	mv	_cond_L_35_,_let_x0_2_
	beq	x18, x0, l.false_38_
# was:	beq	_cond_L_35_, x0, l.false_38_
# 	mv	_Not_37_,_let_x1_9_
	xori	x10, x19, 1
# was:	xori	_cond_R_36_, _Not_37_, 1
	beq	x10, x0, l.false_38_
# was:	beq	_cond_R_36_, x0, l.false_38_
	li	x10, 1
# was:	li	_cond_L_33_, 1
	j	l.end_39_
l.false_38_:
	li	x10, 0
# was:	li	_cond_L_33_, 0
l.end_39_:
	beq	x10, x0, l.false_41_
# was:	beq	_cond_L_33_, x0, l.false_41_
# 	mv	_Not_40_,_let_x2_16_
	xori	x10, x20, 1
# was:	xori	_cond_R_34_, _Not_40_, 1
	beq	x10, x0, l.false_41_
# was:	beq	_cond_R_34_, x0, l.false_41_
	li	x10, 1
# was:	li	_cond_L_31_, 1
	j	l.end_42_
l.false_41_:
	li	x10, 0
# was:	li	_cond_L_31_, 0
l.end_42_:
	beq	x10, x0, l.false_43_
# was:	beq	_cond_L_31_, x0, l.false_43_
# 	mv	_cond_R_32_,_let_x3_23_
	beq	x21, x0, l.false_43_
# was:	beq	_cond_R_32_, x0, l.false_43_
	li	x10, 1
# was:	li	_let_b_I5_30_, 1
	j	l.end_44_
l.false_43_:
	li	x10, 0
# was:	li	_let_b_I5_30_, 0
l.end_44_:
# 	mv	_tmp_46_,_let_b_I5_30_
	mv	x18, x10
# was:	mv	_let_res_45_, _tmp_46_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x18, x0, l.wBoolF_47_
# was:	bne	_let_res_45_, x0, l.wBoolF_47_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_47_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_50_
# was:	la	_tmp_49_, s.X_50_
# s.X_50_: string "\n"
# 	mv	_let_tmp_48_,_tmp_49_
# 	mv	x10,_tmp_49_
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	_mainres_1_, _let_res_45_
# 	mv	x10,_mainres_1_
	addi	x2, x2, 20
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
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
s.X_50_:
	.word	1
	.ascii	"\n"
	.align	2
s.X_29_:
	.word	1
	.ascii	"\n"
	.align	2
s.X_22_:
	.word	1
	.ascii	"\n"
	.align	2
s.X_15_:
	.word	1
	.ascii	"\n"
	.align	2
s.X_8_:
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