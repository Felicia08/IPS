	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -28
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_2_,x10
# 	mv	_size_5_,_let_n_2_
	bge	x10, x0, l.safe_6_
# was:	bge	_size_5_, x0, l.safe_6_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_6_:
	mv	x16, x3
# was:	mv	_arr_reg_4_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_11_, _size_5_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_11_, _tmp_11_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_11_
	sw	x10, 0(x16)
# was:	sw	_size_5_, 0(_arr_reg_4_)
	addi	x11, x16, 4
# was:	addi	_addr_7_, _arr_reg_4_, 4
	mv	x12, x0
# was:	mv	_i_8_, x0
l.loop_beg_9_:
	bge	x12, x10, l.loop_end_10_
# was:	bge	_i_8_, _size_5_, l.loop_end_10_
	sw	x12, 0(x11)
# was:	sw	_i_8_, 0(_addr_7_)
	addi	x11, x11, 4
# was:	addi	_addr_7_, _addr_7_, 4
	addi	x12, x12, 1
# was:	addi	_i_8_, _i_8_, 1
	j	l.loop_beg_9_
l.loop_end_10_:
	lw	x10, 0(x16)
# was:	lw	_arr_size_12_, 0(_arr_reg_4_)
	mv	x11, x3
# was:	mv	_let_x_3_, x3
	slli	x12, x10, 2
# was:	slli	_tmp_33_, _arr_size_12_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_33_, _tmp_33_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_33_
	sw	x10, 0(x11)
# was:	sw	_arr_size_12_, 0(_let_x_3_)
	mv	x12, x0
# was:	mv	_arr_i_13_, x0
	mv	x13, x0
# was:	mv	_out_i_14_, x0
	addi	x14, x11, 0
# was:	addi	_addr header_19_, _let_x_3_, 0
	addi	x15, x11, 4
# was:	addi	_addrg_15_, _let_x_3_, 4
	addi	x16, x16, 4
# was:	addi	_elem_16_, _arr_reg_4_, 4
l.loop_beg_20_:
	bge	x12, x10, l.loop_end_22_
# was:	bge	_arr_i_13_, _arr_size_12_, l.loop_end_22_
	lw	x19, 0(x16)
# was:	lw	_res_18_, 0(_elem_16_)
	addi	x16, x16, 4
# was:	addi	_elem_16_, _elem_16_, 4
# 	mv	_eq_L_24_,_res_18_
	mv	x18, x19
# was:	mv	_div_L_28_, _res_18_
	li	x17, 2
# was:	li	_div_R_29_, 2
	beq	x17, x0, l.error_31_
# was:	beq	_div_R_29_, x0, l.error_31_
	div	x17, x18, x17
# was:	div	_times_L_26_, _div_L_28_, _div_R_29_
	j	l.labelend_30_
l.error_31_:
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.labelend_30_:
	li	x18, 2
# was:	li	_times_R_27_, 2
	mul	x17, x17, x18
# was:	mul	_eq_R_25_, _times_L_26_, _times_R_27_
	li	x18, 0
# was:	li	_fun_arg_res_23_, 0
	bne	x19, x17, l.false_32_
# was:	bne	_eq_L_24_, _eq_R_25_, l.false_32_
	li	x18, 1
# was:	li	_fun_arg_res_23_, 1
l.false_32_:
# 	mv	_tmp_reg_17_,_fun_arg_res_23_
	beq	x18, x0, l.loop_false_21_
# was:	beq	_tmp_reg_17_, x0, l.loop_false_21_
	sw	x19, 0(x15)
# was:	sw	_res_18_, 0(_addrg_15_)
	addi	x15, x15, 4
# was:	addi	_addrg_15_, _addrg_15_, 4
	addi	x13, x13, 1
# was:	addi	_out_i_14_, _out_i_14_, 1
l.loop_false_21_:
	addi	x12, x12, 1
# was:	addi	_arr_i_13_, _arr_i_13_, 1
	j	l.loop_beg_20_
l.loop_end_22_:
	sw	x13, 0(x14)
# was:	sw	_out_i_14_, 0(_addr header_19_)
	mv	x10, x11
# was:	mv	_arr_36_, _let_x_3_
	lw	x13, 0(x10)
# was:	lw	_size_35_, 0(_arr_36_)
	mv	x14, x3
# was:	mv	_let_y_34_, x3
	slli	x11, x13, 2
# was:	slli	_tmp_46_, _size_35_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_46_, _tmp_46_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_46_
	sw	x13, 0(x14)
# was:	sw	_size_35_, 0(_let_y_34_)
	addi	x11, x14, 4
# was:	addi	_addrg_39_, _let_y_34_, 4
	mv	x12, x0
# was:	mv	_i_40_, x0
	addi	x10, x10, 4
# was:	addi	_elem_37_, _arr_36_, 4
l.loop_beg_41_:
	bge	x12, x13, l.loop_end_42_
# was:	bge	_i_40_, _size_35_, l.loop_end_42_
	lw	x15, 0(x10)
# was:	lw	_res_38_, 0(_elem_37_)
	addi	x10, x10, 4
# was:	addi	_elem_37_, _elem_37_, 4
# 	mv	_times_L_44_,_res_38_
	mv	x16, x15
# was:	mv	_times_R_45_, _res_38_
	mul	x15, x15, x16
# was:	mul	_fun_arg_res_43_, _times_L_44_, _times_R_45_
# 	mv	_res_38_,_fun_arg_res_43_
	sw	x15, 0(x11)
# was:	sw	_res_38_, 0(_addrg_39_)
	addi	x11, x11, 4
# was:	addi	_addrg_39_, _addrg_39_, 4
	addi	x12, x12, 1
# was:	addi	_i_40_, _i_40_, 1
	j	l.loop_beg_41_
l.loop_end_42_:
	mv	x10, x14
# was:	mv	_arr_reg_48_, _let_y_34_
	lw	x13, 0(x10)
# was:	lw	_arr_size_49_, 0(_arr_reg_48_)
	mv	x12, x3
# was:	mv	_let_z_47_, x3
	slli	x11, x13, 2
# was:	slli	_tmp_70_, _arr_size_49_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_70_, _tmp_70_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_70_
	sw	x13, 0(x12)
# was:	sw	_arr_size_49_, 0(_let_z_47_)
	mv	x14, x0
# was:	mv	_arr_i_50_, x0
	mv	x16, x0
# was:	mv	_out_i_51_, x0
	addi	x17, x12, 0
# was:	addi	_addr header_56_, _let_z_47_, 0
	addi	x15, x12, 4
# was:	addi	_addrg_52_, _let_z_47_, 4
	addi	x11, x10, 4
# was:	addi	_elem_53_, _arr_reg_48_, 4
l.loop_beg_57_:
	bge	x14, x13, l.loop_end_59_
# was:	bge	_arr_i_50_, _arr_size_49_, l.loop_end_59_
	lw	x19, 0(x11)
# was:	lw	_res_55_, 0(_elem_53_)
	addi	x11, x11, 4
# was:	addi	_elem_53_, _elem_53_, 4
# 	mv	_div_L_65_,_res_55_
	li	x10, 16
# was:	li	_div_R_66_, 16
	beq	x10, x0, l.error_68_
# was:	beq	_div_R_66_, x0, l.error_68_
	div	x10, x19, x10
# was:	div	_times_L_63_, _div_L_65_, _div_R_66_
	j	l.labelend_67_
l.error_68_:
	li	x10, 6
# was:	li	x10, 6
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.labelend_67_:
	li	x18, 16
# was:	li	_times_R_64_, 16
	mul	x10, x10, x18
# was:	mul	_eq_L_61_, _times_L_63_, _times_R_64_
# 	mv	_eq_R_62_,_res_55_
	li	x18, 0
# was:	li	_fun_arg_res_60_, 0
	bne	x10, x19, l.false_69_
# was:	bne	_eq_L_61_, _eq_R_62_, l.false_69_
	li	x18, 1
# was:	li	_fun_arg_res_60_, 1
l.false_69_:
# 	mv	_tmp_reg_54_,_fun_arg_res_60_
	beq	x18, x0, l.loop_false_58_
# was:	beq	_tmp_reg_54_, x0, l.loop_false_58_
	sw	x19, 0(x15)
# was:	sw	_res_55_, 0(_addrg_52_)
	addi	x15, x15, 4
# was:	addi	_addrg_52_, _addrg_52_, 4
	addi	x16, x16, 1
# was:	addi	_out_i_51_, _out_i_51_, 1
l.loop_false_58_:
	addi	x14, x14, 1
# was:	addi	_arr_i_50_, _arr_i_50_, 1
	j	l.loop_beg_57_
l.loop_end_59_:
	sw	x16, 0(x17)
# was:	sw	_out_i_51_, 0(_addr header_56_)
# 	mv	_arr_72_,_let_z_47_
	lw	x19, 0(x12)
# was:	lw	_size_71_, 0(_arr_72_)
	mv	x18, x3
# was:	mv	_mainres_1_, x3
	slli	x10, x19, 2
# was:	slli	_tmp_81_, _size_71_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_81_, _tmp_81_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_81_
	sw	x19, 0(x18)
# was:	sw	_size_71_, 0(_mainres_1_)
	addi	x20, x18, 4
# was:	addi	_addrg_75_, _mainres_1_, 4
	mv	x21, x0
# was:	mv	_i_76_, x0
	addi	x22, x12, 4
# was:	addi	_elem_73_, _arr_72_, 4
l.loop_beg_77_:
	bge	x21, x19, l.loop_end_78_
# was:	bge	_i_76_, _size_71_, l.loop_end_78_
	lw	x23, 0(x22)
# was:	lw	_res_74_, 0(_elem_73_)
	addi	x22, x22, 4
# was:	addi	_elem_73_, _elem_73_, 4
# 	mv	_tmp_80_,_res_74_
# 	mv	_fun_arg_res_79_,_tmp_80_
	mv	x10, x23
# was:	mv	x10, _fun_arg_res_79_
	jal	p.putint
# was:	jal	p.putint, x10
# 	mv	_res_74_,_fun_arg_res_79_
	sw	x23, 0(x20)
# was:	sw	_res_74_, 0(_addrg_75_)
	addi	x20, x20, 4
# was:	addi	_addrg_75_, _addrg_75_, 4
	addi	x21, x21, 1
# was:	addi	_i_76_, _i_76_, 1
	j	l.loop_beg_77_
l.loop_end_78_:
	mv	x10, x18
# was:	mv	x10, _mainres_1_
	addi	x2, x2, 28
	lw	x23, -28(x2)
	lw	x22, -24(x2)
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