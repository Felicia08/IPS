	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function write_nl
f.write_nl:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_b_1_,x10
	mv	x18, x10
# was:	mv	_tmp_4_, _param_b_1_
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
	mv	x10, x18
# was:	mv	_write_nlres_2_, _let_res_3_
# 	mv	x10,_write_nlres_2_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -16
	li	x11, 3
# was:	li	_div_L_14_, 3
	li	x10, 2
# was:	li	_div_R_15_, 2
	div	x12, x11, x10
# was:	div	_eq_L_12_, _div_L_14_, _div_R_15_
	li	x11, 1
# was:	li	_eq_R_13_, 1
	li	x10, 0
# was:	li	_arg_11_, 0
	bne	x12, x11, l.false_16_
# was:	bne	_eq_L_12_, _eq_R_13_, l.false_16_
	li	x10, 1
# was:	li	_arg_11_, 1
l.false_16_:
# 	mv	x10,_arg_11_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x18, x10
# was:	mv	_let_x0_10_, x10
	li	x10, 3
# was:	li	_Not_23_, 3
	xori	x11, x10, 1
# was:	xori	_div_L_21_, _Not_23_, 1
	li	x10, 2
# was:	li	_div_R_22_, 2
	div	x10, x11, x10
# was:	div	_eq_L_19_, _div_L_21_, _div_R_22_
	li	x11, 2
# was:	li	_Not_24_, 2
	xori	x12, x11, 1
# was:	xori	_eq_R_20_, _Not_24_, 1
	li	x11, 0
# was:	li	_arg_18_, 0
	bne	x10, x12, l.false_25_
# was:	bne	_eq_L_19_, _eq_R_20_, l.false_25_
	li	x11, 1
# was:	li	_arg_18_, 1
l.false_25_:
	mv	x10, x11
# was:	mv	x10, _arg_18_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x19, x10
# was:	mv	_let_x1_17_, x10
	li	x10, 3
# was:	li	_div_L_30_, 3
	li	x11, 2
# was:	li	_Not_32_, 2
	xori	x11, x11, 1
# was:	xori	_div_R_31_, _Not_32_, 1
	div	x10, x10, x11
# was:	div	_eq_L_28_, _div_L_30_, _div_R_31_
	li	x11, 2
# was:	li	_Not_33_, 2
	xori	x12, x11, 1
# was:	xori	_eq_R_29_, _Not_33_, 1
	li	x11, 0
# was:	li	_arg_27_, 0
	bne	x10, x12, l.false_34_
# was:	bne	_eq_L_28_, _eq_R_29_, l.false_34_
	li	x11, 1
# was:	li	_arg_27_, 1
l.false_34_:
	mv	x10, x11
# was:	mv	x10, _arg_27_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x20, x10
# was:	mv	_let_x2_26_, x10
	li	x10, 3
# was:	li	_Not_41_, 3
	xori	x10, x10, 1
# was:	xori	_div_L_39_, _Not_41_, 1
	li	x11, 2
# was:	li	_Not_42_, 2
	xori	x11, x11, 1
# was:	xori	_div_R_40_, _Not_42_, 1
	div	x10, x10, x11
# was:	div	_eq_L_37_, _div_L_39_, _div_R_40_
	li	x11, 1
# was:	li	_Not_43_, 1
	xori	x12, x11, 1
# was:	xori	_eq_R_38_, _Not_43_, 1
	li	x11, 0
# was:	li	_arg_36_, 0
	bne	x10, x12, l.false_44_
# was:	bne	_eq_L_37_, _eq_R_38_, l.false_44_
	li	x11, 1
# was:	li	_arg_36_, 1
l.false_44_:
	mv	x10, x11
# was:	mv	x10, _arg_36_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
# 	mv	_let_x3_35_,x10
# 	mv	_cond_L_50_,_let_x0_10_
	beq	x18, x0, l.false_53_
# was:	beq	_cond_L_50_, x0, l.false_53_
# 	mv	_Not_52_,_let_x1_17_
	xori	x11, x19, 1
# was:	xori	_cond_R_51_, _Not_52_, 1
	beq	x11, x0, l.false_53_
# was:	beq	_cond_R_51_, x0, l.false_53_
	li	x11, 1
# was:	li	_cond_L_48_, 1
	j	l.end_54_
l.false_53_:
	li	x11, 0
# was:	li	_cond_L_48_, 0
l.end_54_:
	beq	x11, x0, l.false_56_
# was:	beq	_cond_L_48_, x0, l.false_56_
# 	mv	_Not_55_,_let_x2_26_
	xori	x11, x20, 1
# was:	xori	_cond_R_49_, _Not_55_, 1
	beq	x11, x0, l.false_56_
# was:	beq	_cond_R_49_, x0, l.false_56_
	li	x11, 1
# was:	li	_cond_L_46_, 1
	j	l.end_57_
l.false_56_:
	li	x11, 0
# was:	li	_cond_L_46_, 0
l.end_57_:
	beq	x11, x0, l.false_58_
# was:	beq	_cond_L_46_, x0, l.false_58_
# 	mv	_cond_R_47_,_let_x3_35_
	beq	x10, x0, l.false_58_
# was:	beq	_cond_R_47_, x0, l.false_58_
	li	x10, 1
# was:	li	_arg_45_, 1
	j	l.end_59_
l.false_58_:
	li	x10, 0
# was:	li	_arg_45_, 0
l.end_59_:
# 	mv	x10,_arg_45_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
# 	mv	_mainres_9_,x10
# 	mv	x10,_mainres_9_
	addi	x2, x2, 16
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