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
	li	x10, 3
# was:	li	_div_L_14_, 3
	li	x11, 2
# was:	li	_div_R_15_, 2
	beq	x11, x0, l.error_17_
# was:	beq	_div_R_15_, x0, l.error_17_
	div	x10, x10, x11
# was:	div	_eq_L_12_, _div_L_14_, _div_R_15_
	j	l.labelend_16_
l.error_17_:
	li	x10, 7
# was:	li	x10, 7
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.labelend_16_:
	li	x11, 1
# was:	li	_eq_R_13_, 1
	li	x12, 0
# was:	li	_arg_11_, 0
	bne	x10, x11, l.false_18_
# was:	bne	_eq_L_12_, _eq_R_13_, l.false_18_
	li	x12, 1
# was:	li	_arg_11_, 1
l.false_18_:
	mv	x10, x12
# was:	mv	x10, _arg_11_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x19, x10
# was:	mv	_let_x0_10_, x10
	li	x10, 3
# was:	li	_R_Neg_25_, 3
	li	x11, -1
# was:	li	_L_Neg_26_, -1
	mul	x10, x10, x11
# was:	mul	_div_L_23_, _R_Neg_25_, _L_Neg_26_
	li	x11, 2
# was:	li	_div_R_24_, 2
	beq	x11, x0, l.error_28_
# was:	beq	_div_R_24_, x0, l.error_28_
	div	x10, x10, x11
# was:	div	_eq_L_21_, _div_L_23_, _div_R_24_
	j	l.labelend_27_
l.error_28_:
	li	x10, 8
# was:	li	x10, 8
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.labelend_27_:
	li	x11, 2
# was:	li	_R_Neg_29_, 2
	li	x12, -1
# was:	li	_L_Neg_30_, -1
	mul	x11, x11, x12
# was:	mul	_eq_R_22_, _R_Neg_29_, _L_Neg_30_
	li	x12, 0
# was:	li	_arg_20_, 0
	bne	x10, x11, l.false_31_
# was:	bne	_eq_L_21_, _eq_R_22_, l.false_31_
	li	x12, 1
# was:	li	_arg_20_, 1
l.false_31_:
	mv	x10, x12
# was:	mv	x10, _arg_20_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x18, x10
# was:	mv	_let_x1_19_, x10
	li	x11, 3
# was:	li	_div_L_36_, 3
	li	x10, 2
# was:	li	_R_Neg_38_, 2
	li	x12, -1
# was:	li	_L_Neg_39_, -1
	mul	x10, x10, x12
# was:	mul	_div_R_37_, _R_Neg_38_, _L_Neg_39_
	beq	x10, x0, l.error_41_
# was:	beq	_div_R_37_, x0, l.error_41_
	div	x11, x11, x10
# was:	div	_eq_L_34_, _div_L_36_, _div_R_37_
	j	l.labelend_40_
l.error_41_:
	li	x10, 9
# was:	li	x10, 9
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.labelend_40_:
	li	x10, 2
# was:	li	_R_Neg_42_, 2
	li	x12, -1
# was:	li	_L_Neg_43_, -1
	mul	x10, x10, x12
# was:	mul	_eq_R_35_, _R_Neg_42_, _L_Neg_43_
	li	x12, 0
# was:	li	_arg_33_, 0
	bne	x11, x10, l.false_44_
# was:	bne	_eq_L_34_, _eq_R_35_, l.false_44_
	li	x12, 1
# was:	li	_arg_33_, 1
l.false_44_:
	mv	x10, x12
# was:	mv	x10, _arg_33_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x20, x10
# was:	mv	_let_x2_32_, x10
	li	x10, 3
# was:	li	_R_Neg_51_, 3
	li	x11, -1
# was:	li	_L_Neg_52_, -1
	mul	x10, x10, x11
# was:	mul	_div_L_49_, _R_Neg_51_, _L_Neg_52_
	li	x12, 2
# was:	li	_R_Neg_53_, 2
	li	x11, -1
# was:	li	_L_Neg_54_, -1
	mul	x11, x12, x11
# was:	mul	_div_R_50_, _R_Neg_53_, _L_Neg_54_
	beq	x11, x0, l.error_56_
# was:	beq	_div_R_50_, x0, l.error_56_
	div	x10, x10, x11
# was:	div	_eq_L_47_, _div_L_49_, _div_R_50_
	j	l.labelend_55_
l.error_56_:
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.labelend_55_:
	li	x12, 1
# was:	li	_eq_R_48_, 1
	li	x11, 0
# was:	li	_arg_46_, 0
	bne	x10, x12, l.false_57_
# was:	bne	_eq_L_47_, _eq_R_48_, l.false_57_
	li	x11, 1
# was:	li	_arg_46_, 1
l.false_57_:
	mv	x10, x11
# was:	mv	x10, _arg_46_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
# 	mv	_let_x3_45_,x10
# 	mv	_cond_L_63_,_let_x0_10_
	beq	x19, x0, l.false_66_
# was:	beq	_cond_L_63_, x0, l.false_66_
# 	mv	_Not_65_,_let_x1_19_
	xori	x11, x18, 1
# was:	xori	_cond_R_64_, _Not_65_, 1
	beq	x11, x0, l.false_66_
# was:	beq	_cond_R_64_, x0, l.false_66_
	li	x11, 1
# was:	li	_cond_L_61_, 1
	j	l.end_67_
l.false_66_:
	li	x11, 0
# was:	li	_cond_L_61_, 0
l.end_67_:
	beq	x11, x0, l.false_69_
# was:	beq	_cond_L_61_, x0, l.false_69_
# 	mv	_Not_68_,_let_x2_32_
	xori	x11, x20, 1
# was:	xori	_cond_R_62_, _Not_68_, 1
	beq	x11, x0, l.false_69_
# was:	beq	_cond_R_62_, x0, l.false_69_
	li	x11, 1
# was:	li	_cond_L_59_, 1
	j	l.end_70_
l.false_69_:
	li	x11, 0
# was:	li	_cond_L_59_, 0
l.end_70_:
	beq	x11, x0, l.false_71_
# was:	beq	_cond_L_59_, x0, l.false_71_
# 	mv	_cond_R_60_,_let_x3_45_
	beq	x10, x0, l.false_71_
# was:	beq	_cond_R_60_, x0, l.false_71_
	li	x10, 1
# was:	li	_arg_58_, 1
	j	l.end_72_
l.false_71_:
	li	x10, 0
# was:	li	_arg_58_, 0
l.end_72_:
# 	mv	x10,_arg_58_
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