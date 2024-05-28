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
# was:	slli	_tmp_31_, _arr_size_12_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_31_, _tmp_31_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_31_
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
	div	x17, x18, x17
# was:	div	_times_L_26_, _div_L_28_, _div_R_29_
	li	x18, 2
# was:	li	_times_R_27_, 2
	mul	x17, x17, x18
# was:	mul	_eq_R_25_, _times_L_26_, _times_R_27_
	li	x18, 0
# was:	li	_fun_arg_res_23_, 0
	bne	x19, x17, l.false_30_
# was:	bne	_eq_L_24_, _eq_R_25_, l.false_30_
	li	x18, 1
# was:	li	_fun_arg_res_23_, 1
l.false_30_:
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
# was:	mv	_arr_34_, _let_x_3_
	lw	x13, 0(x10)
# was:	lw	_size_33_, 0(_arr_34_)
	mv	x14, x3
# was:	mv	_let_y_32_, x3
	slli	x11, x13, 2
# was:	slli	_tmp_44_, _size_33_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_44_, _tmp_44_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_44_
	sw	x13, 0(x14)
# was:	sw	_size_33_, 0(_let_y_32_)
	addi	x11, x14, 4
# was:	addi	_addrg_37_, _let_y_32_, 4
	mv	x12, x0
# was:	mv	_i_38_, x0
	addi	x10, x10, 4
# was:	addi	_elem_35_, _arr_34_, 4
l.loop_beg_39_:
	bge	x12, x13, l.loop_end_40_
# was:	bge	_i_38_, _size_33_, l.loop_end_40_
	lw	x15, 0(x10)
# was:	lw	_res_36_, 0(_elem_35_)
	addi	x10, x10, 4
# was:	addi	_elem_35_, _elem_35_, 4
# 	mv	_times_L_42_,_res_36_
	mv	x16, x15
# was:	mv	_times_R_43_, _res_36_
	mul	x15, x15, x16
# was:	mul	_fun_arg_res_41_, _times_L_42_, _times_R_43_
# 	mv	_res_36_,_fun_arg_res_41_
	sw	x15, 0(x11)
# was:	sw	_res_36_, 0(_addrg_37_)
	addi	x11, x11, 4
# was:	addi	_addrg_37_, _addrg_37_, 4
	addi	x12, x12, 1
# was:	addi	_i_38_, _i_38_, 1
	j	l.loop_beg_39_
l.loop_end_40_:
	mv	x10, x14
# was:	mv	_arr_reg_46_, _let_y_32_
	lw	x13, 0(x10)
# was:	lw	_arr_size_47_, 0(_arr_reg_46_)
	mv	x12, x3
# was:	mv	_let_z_45_, x3
	slli	x11, x13, 2
# was:	slli	_tmp_66_, _arr_size_47_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_66_, _tmp_66_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_66_
	sw	x13, 0(x12)
# was:	sw	_arr_size_47_, 0(_let_z_45_)
	mv	x14, x0
# was:	mv	_arr_i_48_, x0
	mv	x16, x0
# was:	mv	_out_i_49_, x0
	addi	x17, x12, 0
# was:	addi	_addr header_54_, _let_z_45_, 0
	addi	x15, x12, 4
# was:	addi	_addrg_50_, _let_z_45_, 4
	addi	x11, x10, 4
# was:	addi	_elem_51_, _arr_reg_46_, 4
l.loop_beg_55_:
	bge	x14, x13, l.loop_end_57_
# was:	bge	_arr_i_48_, _arr_size_47_, l.loop_end_57_
	lw	x19, 0(x11)
# was:	lw	_res_53_, 0(_elem_51_)
	addi	x11, x11, 4
# was:	addi	_elem_51_, _elem_51_, 4
# 	mv	_div_L_63_,_res_53_
	li	x10, 16
# was:	li	_div_R_64_, 16
	div	x10, x19, x10
# was:	div	_times_L_61_, _div_L_63_, _div_R_64_
	li	x18, 16
# was:	li	_times_R_62_, 16
	mul	x10, x10, x18
# was:	mul	_eq_L_59_, _times_L_61_, _times_R_62_
# 	mv	_eq_R_60_,_res_53_
	li	x18, 0
# was:	li	_fun_arg_res_58_, 0
	bne	x10, x19, l.false_65_
# was:	bne	_eq_L_59_, _eq_R_60_, l.false_65_
	li	x18, 1
# was:	li	_fun_arg_res_58_, 1
l.false_65_:
# 	mv	_tmp_reg_52_,_fun_arg_res_58_
	beq	x18, x0, l.loop_false_56_
# was:	beq	_tmp_reg_52_, x0, l.loop_false_56_
	sw	x19, 0(x15)
# was:	sw	_res_53_, 0(_addrg_50_)
	addi	x15, x15, 4
# was:	addi	_addrg_50_, _addrg_50_, 4
	addi	x16, x16, 1
# was:	addi	_out_i_49_, _out_i_49_, 1
l.loop_false_56_:
	addi	x14, x14, 1
# was:	addi	_arr_i_48_, _arr_i_48_, 1
	j	l.loop_beg_55_
l.loop_end_57_:
	sw	x16, 0(x17)
# was:	sw	_out_i_49_, 0(_addr header_54_)
# 	mv	_arr_68_,_let_z_45_
	lw	x19, 0(x12)
# was:	lw	_size_67_, 0(_arr_68_)
	mv	x18, x3
# was:	mv	_mainres_1_, x3
	slli	x10, x19, 2
# was:	slli	_tmp_77_, _size_67_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_77_, _tmp_77_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_77_
	sw	x19, 0(x18)
# was:	sw	_size_67_, 0(_mainres_1_)
	addi	x20, x18, 4
# was:	addi	_addrg_71_, _mainres_1_, 4
	mv	x21, x0
# was:	mv	_i_72_, x0
	addi	x22, x12, 4
# was:	addi	_elem_69_, _arr_68_, 4
l.loop_beg_73_:
	bge	x21, x19, l.loop_end_74_
# was:	bge	_i_72_, _size_67_, l.loop_end_74_
	lw	x23, 0(x22)
# was:	lw	_res_70_, 0(_elem_69_)
	addi	x22, x22, 4
# was:	addi	_elem_69_, _elem_69_, 4
# 	mv	_tmp_76_,_res_70_
# 	mv	_fun_arg_res_75_,_tmp_76_
	mv	x10, x23
# was:	mv	x10, _fun_arg_res_75_
	jal	p.putint
# was:	jal	p.putint, x10
# 	mv	_res_70_,_fun_arg_res_75_
	sw	x23, 0(x20)
# was:	sw	_res_70_, 0(_addrg_71_)
	addi	x20, x20, 4
# was:	addi	_addrg_71_, _addrg_71_, 4
	addi	x21, x21, 1
# was:	addi	_i_72_, _i_72_, 1
	j	l.loop_beg_73_
l.loop_end_74_:
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