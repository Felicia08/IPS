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
	lw	x11, 0(x16)
# was:	lw	_arr_size_12_, 0(_arr_reg_4_)
	mv	x10, x3
# was:	mv	_let_x_3_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_32_, _arr_size_12_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_32_, _tmp_32_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_32_
	sw	x11, 0(x10)
# was:	sw	_arr_size_12_, 0(_let_x_3_)
	mv	x14, x0
# was:	mv	_arr_i_13_, x0
	mv	x15, x0
# was:	mv	_out_i_14_, x0
	addi	x13, x10, 0
# was:	addi	_addr header_19_, _let_x_3_, 0
	addi	x12, x10, 4
# was:	addi	_addrg_15_, _let_x_3_, 4
	addi	x16, x16, 4
# was:	addi	_elem_16_, _arr_reg_4_, 4
l.loop_beg_20_:
	bge	x14, x11, l.loop_end_22_
# was:	bge	_arr_i_13_, _arr_size_12_, l.loop_end_22_
	lw	x21, 0(x16)
# was:	lw	_res_18_, 0(_elem_16_)
	addi	x16, x16, 4
# was:	addi	_elem_16_, _elem_16_, 4
# 	mv	_eq_L_24_,_res_18_
	li	x17, 2
# was:	li	_div_R_29_, 2
	mv	x20, x21
# was:	mv	_div_L_28_, _res_18_
	beq	x20, x0, l.divide_with_zero_30_
# was:	beq	_div_L_28_, x0, l.divide_with_zero_30_
	div	x19, x20, x17
# was:	div	_times_L_26_, _div_L_28_, _div_R_29_
l.divide_with_zero_30_:
	li	x17, 2
# was:	li	_times_R_27_, 2
	mul	x20, x19, x17
# was:	mul	_eq_R_25_, _times_L_26_, _times_R_27_
	li	x17, 0
# was:	li	_fun_arg_res_23_, 0
	bne	x21, x20, l.false_31_
# was:	bne	_eq_L_24_, _eq_R_25_, l.false_31_
	li	x17, 1
# was:	li	_fun_arg_res_23_, 1
l.false_31_:
# 	mv	_tmp_reg_17_,_fun_arg_res_23_
	beq	x17, x0, l.loop_false_21_
# was:	beq	_tmp_reg_17_, x0, l.loop_false_21_
	sw	x21, 0(x12)
# was:	sw	_res_18_, 0(_addrg_15_)
	addi	x12, x12, 4
# was:	addi	_addrg_15_, _addrg_15_, 4
	addi	x15, x15, 1
# was:	addi	_out_i_14_, _out_i_14_, 1
l.loop_false_21_:
	addi	x14, x14, 1
# was:	addi	_arr_i_13_, _arr_i_13_, 1
	j	l.loop_beg_20_
l.loop_end_22_:
	sw	x15, 0(x13)
# was:	sw	_out_i_14_, 0(_addr header_19_)
# 	mv	_arr_35_,_let_x_3_
	lw	x11, 0(x10)
# was:	lw	_size_34_, 0(_arr_35_)
	mv	x16, x3
# was:	mv	_let_y_33_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_45_, _size_34_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_45_, _tmp_45_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_45_
	sw	x11, 0(x16)
# was:	sw	_size_34_, 0(_let_y_33_)
	addi	x13, x16, 4
# was:	addi	_addrg_38_, _let_y_33_, 4
	mv	x12, x0
# was:	mv	_i_39_, x0
	addi	x10, x10, 4
# was:	addi	_elem_36_, _arr_35_, 4
l.loop_beg_40_:
	bge	x12, x11, l.loop_end_41_
# was:	bge	_i_39_, _size_34_, l.loop_end_41_
	lw	x14, 0(x10)
# was:	lw	_res_37_, 0(_elem_36_)
	addi	x10, x10, 4
# was:	addi	_elem_36_, _elem_36_, 4
# 	mv	_times_L_43_,_res_37_
	mv	x15, x14
# was:	mv	_times_R_44_, _res_37_
	mul	x14, x14, x15
# was:	mul	_fun_arg_res_42_, _times_L_43_, _times_R_44_
# 	mv	_res_37_,_fun_arg_res_42_
	sw	x14, 0(x13)
# was:	sw	_res_37_, 0(_addrg_38_)
	addi	x13, x13, 4
# was:	addi	_addrg_38_, _addrg_38_, 4
	addi	x12, x12, 1
# was:	addi	_i_39_, _i_39_, 1
	j	l.loop_beg_40_
l.loop_end_41_:
# 	mv	_arr_reg_47_,_let_y_33_
	lw	x10, 0(x16)
# was:	lw	_arr_size_48_, 0(_arr_reg_47_)
	mv	x11, x3
# was:	mv	_let_z_46_, x3
	slli	x12, x10, 2
# was:	slli	_tmp_68_, _arr_size_48_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_68_, _tmp_68_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_68_
	sw	x10, 0(x11)
# was:	sw	_arr_size_48_, 0(_let_z_46_)
	mv	x13, x0
# was:	mv	_arr_i_49_, x0
	mv	x12, x0
# was:	mv	_out_i_50_, x0
	addi	x14, x11, 0
# was:	addi	_addr header_55_, _let_z_46_, 0
	addi	x15, x11, 4
# was:	addi	_addrg_51_, _let_z_46_, 4
	addi	x16, x16, 4
# was:	addi	_elem_52_, _arr_reg_47_, 4
l.loop_beg_56_:
	bge	x13, x10, l.loop_end_58_
# was:	bge	_arr_i_49_, _arr_size_48_, l.loop_end_58_
	lw	x20, 0(x16)
# was:	lw	_res_54_, 0(_elem_52_)
	addi	x16, x16, 4
# was:	addi	_elem_52_, _elem_52_, 4
	li	x17, 16
# was:	li	_div_R_65_, 16
# 	mv	_div_L_64_,_res_54_
	beq	x20, x0, l.divide_with_zero_66_
# was:	beq	_div_L_64_, x0, l.divide_with_zero_66_
	div	x18, x20, x17
# was:	div	_times_L_62_, _div_L_64_, _div_R_65_
l.divide_with_zero_66_:
	li	x17, 16
# was:	li	_times_R_63_, 16
	mul	x19, x18, x17
# was:	mul	_eq_L_60_, _times_L_62_, _times_R_63_
# 	mv	_eq_R_61_,_res_54_
	li	x17, 0
# was:	li	_fun_arg_res_59_, 0
	bne	x19, x20, l.false_67_
# was:	bne	_eq_L_60_, _eq_R_61_, l.false_67_
	li	x17, 1
# was:	li	_fun_arg_res_59_, 1
l.false_67_:
# 	mv	_tmp_reg_53_,_fun_arg_res_59_
	beq	x17, x0, l.loop_false_57_
# was:	beq	_tmp_reg_53_, x0, l.loop_false_57_
	sw	x20, 0(x15)
# was:	sw	_res_54_, 0(_addrg_51_)
	addi	x15, x15, 4
# was:	addi	_addrg_51_, _addrg_51_, 4
	addi	x12, x12, 1
# was:	addi	_out_i_50_, _out_i_50_, 1
l.loop_false_57_:
	addi	x13, x13, 1
# was:	addi	_arr_i_49_, _arr_i_49_, 1
	j	l.loop_beg_56_
l.loop_end_58_:
	sw	x12, 0(x14)
# was:	sw	_out_i_50_, 0(_addr header_55_)
# 	mv	_let_x_I1_69_,_let_z_46_
# 	mv	_let_x_70_,_let_z_46_
# 	mv	_arr_72_,_let_z_46_
	lw	x19, 0(x11)
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
	addi	x22, x11, 4
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