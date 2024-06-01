	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function write_int
f.write_int:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_x_1_,x10
	mv	x18, x10
# was:	mv	_tmp_3_, _param_x_1_
# 	mv	_write_intres_2_,_tmp_3_
	mv	x10, x18
# was:	mv	x10, _write_intres_2_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _write_intres_2_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function write_int_arr
f.write_int_arr:
	sw	x1, -4(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -24
# 	mv	_param_x_4_,x10
# 	mv	_arr_7_,_param_x_4_
	lw	x18, 0(x10)
# was:	lw	_size_6_, 0(_arr_7_)
	mv	x19, x3
# was:	mv	_write_int_arrres_5_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_15_, _size_6_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_15_, _tmp_15_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_15_
	sw	x18, 0(x19)
# was:	sw	_size_6_, 0(_write_int_arrres_5_)
	addi	x20, x19, 4
# was:	addi	_addrg_10_, _write_int_arrres_5_, 4
	mv	x21, x0
# was:	mv	_i_11_, x0
	addi	x22, x10, 4
# was:	addi	_elem_8_, _arr_7_, 4
l.loop_beg_12_:
	bge	x21, x18, l.loop_end_13_
# was:	bge	_i_11_, _size_6_, l.loop_end_13_
	lw	x10, 0(x22)
# was:	lw	_res_9_, 0(_elem_8_)
	addi	x22, x22, 4
# was:	addi	_elem_8_, _elem_8_, 4
# 	mv	x10,_res_9_
	jal	f.write_int
# was:	jal	f.write_int, x10
# 	mv	_tmp_14_,x10
# 	mv	_res_9_,_tmp_14_
	sw	x10, 0(x20)
# was:	sw	_res_9_, 0(_addrg_10_)
	addi	x20, x20, 4
# was:	addi	_addrg_10_, _addrg_10_, 4
	addi	x21, x21, 1
# was:	addi	_i_11_, _i_11_, 1
	j	l.loop_beg_12_
l.loop_end_13_:
	mv	x10, x19
# was:	mv	x10, _write_int_arrres_5_
	addi	x2, x2, 24
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function isMul16
f.isMul16:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_a_16_,x10
# 	mv	_div_L_22_,_param_a_16_
	li	x11, 16
# was:	li	_div_R_23_, 16
	beq	x11, x0, l.error_25_
# was:	beq	_div_R_23_, x0, l.error_25_
	div	x12, x10, x11
# was:	div	_times_L_20_, _div_L_22_, _div_R_23_
	j	l.labelend_24_
l.error_25_:
	li	x10, 6
# was:	li	x10, 6
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.labelend_24_:
	li	x11, 16
# was:	li	_times_R_21_, 16
	mul	x11, x12, x11
# was:	mul	_eq_L_18_, _times_L_20_, _times_R_21_
	mv	x12, x10
# was:	mv	_eq_R_19_, _param_a_16_
	li	x10, 0
# was:	li	_isMul16res_17_, 0
	bne	x11, x12, l.false_26_
# was:	bne	_eq_L_18_, _eq_R_19_, l.false_26_
	li	x10, 1
# was:	li	_isMul16res_17_, 1
l.false_26_:
# 	mv	x10,_isMul16res_17_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x25, -36(x2)
	sw	x24, -32(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -36
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_28_,x10
# 	mv	_size_31_,_let_n_28_
	bge	x10, x0, l.safe_32_
# was:	bge	_size_31_, x0, l.safe_32_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_32_:
	mv	x16, x3
# was:	mv	_arr_reg_30_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_37_, _size_31_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_37_, _tmp_37_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_37_
	sw	x10, 0(x16)
# was:	sw	_size_31_, 0(_arr_reg_30_)
	addi	x11, x16, 4
# was:	addi	_addr_33_, _arr_reg_30_, 4
	mv	x12, x0
# was:	mv	_i_34_, x0
l.loop_beg_35_:
	bge	x12, x10, l.loop_end_36_
# was:	bge	_i_34_, _size_31_, l.loop_end_36_
	sw	x12, 0(x11)
# was:	sw	_i_34_, 0(_addr_33_)
	addi	x11, x11, 4
# was:	addi	_addr_33_, _addr_33_, 4
	addi	x12, x12, 1
# was:	addi	_i_34_, _i_34_, 1
	j	l.loop_beg_35_
l.loop_end_36_:
	lw	x15, 0(x16)
# was:	lw	_arr_size_38_, 0(_arr_reg_30_)
	mv	x13, x3
# was:	mv	_let_x_29_, x3
	slli	x10, x15, 2
# was:	slli	_tmp_59_, _arr_size_38_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_59_, _tmp_59_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_59_
	sw	x15, 0(x13)
# was:	sw	_arr_size_38_, 0(_let_x_29_)
	mv	x12, x0
# was:	mv	_arr_i_39_, x0
	mv	x14, x0
# was:	mv	_out_i_40_, x0
	addi	x10, x13, 0
# was:	addi	_addr header_45_, _let_x_29_, 0
	addi	x11, x13, 4
# was:	addi	_addrg_41_, _let_x_29_, 4
	addi	x16, x16, 4
# was:	addi	_elem_42_, _arr_reg_30_, 4
l.loop_beg_46_:
	bge	x12, x15, l.loop_end_48_
# was:	bge	_arr_i_39_, _arr_size_38_, l.loop_end_48_
	lw	x19, 0(x16)
# was:	lw	_res_44_, 0(_elem_42_)
	addi	x16, x16, 4
# was:	addi	_elem_42_, _elem_42_, 4
# 	mv	_eq_L_50_,_res_44_
	mv	x18, x19
# was:	mv	_div_L_54_, _res_44_
	li	x17, 2
# was:	li	_div_R_55_, 2
	beq	x17, x0, l.error_57_
# was:	beq	_div_R_55_, x0, l.error_57_
	div	x18, x18, x17
# was:	div	_times_L_52_, _div_L_54_, _div_R_55_
	j	l.labelend_56_
l.error_57_:
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.labelend_56_:
	li	x17, 2
# was:	li	_times_R_53_, 2
	mul	x18, x18, x17
# was:	mul	_eq_R_51_, _times_L_52_, _times_R_53_
	li	x17, 0
# was:	li	_fun_arg_res_49_, 0
	bne	x19, x18, l.false_58_
# was:	bne	_eq_L_50_, _eq_R_51_, l.false_58_
	li	x17, 1
# was:	li	_fun_arg_res_49_, 1
l.false_58_:
# 	mv	_tmp_reg_43_,_fun_arg_res_49_
	beq	x17, x0, l.loop_false_47_
# was:	beq	_tmp_reg_43_, x0, l.loop_false_47_
	sw	x19, 0(x11)
# was:	sw	_res_44_, 0(_addrg_41_)
	addi	x11, x11, 4
# was:	addi	_addrg_41_, _addrg_41_, 4
	addi	x14, x14, 1
# was:	addi	_out_i_40_, _out_i_40_, 1
l.loop_false_47_:
	addi	x12, x12, 1
# was:	addi	_arr_i_39_, _arr_i_39_, 1
	j	l.loop_beg_46_
l.loop_end_48_:
	sw	x14, 0(x10)
# was:	sw	_out_i_40_, 0(_addr header_45_)
	mv	x14, x13
# was:	mv	_arr_62_, _let_x_29_
	lw	x11, 0(x14)
# was:	lw	_size_61_, 0(_arr_62_)
	mv	x10, x3
# was:	mv	_let_y_60_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_72_, _size_61_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_72_, _tmp_72_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_72_
	sw	x11, 0(x10)
# was:	sw	_size_61_, 0(_let_y_60_)
	addi	x12, x10, 4
# was:	addi	_addrg_65_, _let_y_60_, 4
	mv	x13, x0
# was:	mv	_i_66_, x0
	addi	x14, x14, 4
# was:	addi	_elem_63_, _arr_62_, 4
l.loop_beg_67_:
	bge	x13, x11, l.loop_end_68_
# was:	bge	_i_66_, _size_61_, l.loop_end_68_
	lw	x15, 0(x14)
# was:	lw	_res_64_, 0(_elem_63_)
	addi	x14, x14, 4
# was:	addi	_elem_63_, _elem_63_, 4
# 	mv	_times_L_70_,_res_64_
	mv	x16, x15
# was:	mv	_times_R_71_, _res_64_
	mul	x15, x15, x16
# was:	mul	_fun_arg_res_69_, _times_L_70_, _times_R_71_
# 	mv	_res_64_,_fun_arg_res_69_
	sw	x15, 0(x12)
# was:	sw	_res_64_, 0(_addrg_65_)
	addi	x12, x12, 4
# was:	addi	_addrg_65_, _addrg_65_, 4
	addi	x13, x13, 1
# was:	addi	_i_66_, _i_66_, 1
	j	l.loop_beg_67_
l.loop_end_68_:
# 	mv	_arr_reg_74_,_let_y_60_
	lw	x18, 0(x10)
# was:	lw	_arr_size_75_, 0(_arr_reg_74_)
	mv	x19, x3
# was:	mv	_let_z_73_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_87_, _arr_size_75_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_87_, _tmp_87_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_87_
	sw	x18, 0(x19)
# was:	sw	_arr_size_75_, 0(_let_z_73_)
	mv	x23, x0
# was:	mv	_arr_i_76_, x0
	mv	x21, x0
# was:	mv	_out_i_77_, x0
	addi	x24, x19, 0
# was:	addi	_addr header_82_, _let_z_73_, 0
	addi	x22, x19, 4
# was:	addi	_addrg_78_, _let_z_73_, 4
	addi	x25, x10, 4
# was:	addi	_elem_79_, _arr_reg_74_, 4
l.loop_beg_83_:
	bge	x23, x18, l.loop_end_85_
# was:	bge	_arr_i_76_, _arr_size_75_, l.loop_end_85_
	lw	x20, 0(x25)
# was:	lw	_res_81_, 0(_elem_79_)
	addi	x25, x25, 4
# was:	addi	_elem_79_, _elem_79_, 4
	mv	x10, x20
# was:	mv	x10, _res_81_
	jal	f.isMul16
# was:	jal	f.isMul16, x10
# 	mv	_tmp_86_,x10
# 	mv	_tmp_reg_80_,_tmp_86_
	beq	x10, x0, l.loop_false_84_
# was:	beq	_tmp_reg_80_, x0, l.loop_false_84_
	sw	x20, 0(x22)
# was:	sw	_res_81_, 0(_addrg_78_)
	addi	x22, x22, 4
# was:	addi	_addrg_78_, _addrg_78_, 4
	addi	x21, x21, 1
# was:	addi	_out_i_77_, _out_i_77_, 1
l.loop_false_84_:
	addi	x23, x23, 1
# was:	addi	_arr_i_76_, _arr_i_76_, 1
	j	l.loop_beg_83_
l.loop_end_85_:
	sw	x21, 0(x24)
# was:	sw	_out_i_77_, 0(_addr header_82_)
	mv	x10, x19
# was:	mv	_arg_88_, _let_z_73_
# 	mv	x10,_arg_88_
	jal	f.write_int_arr
# was:	jal	f.write_int_arr, x10
# 	mv	_mainres_27_,x10
# 	mv	x10,_mainres_27_
	addi	x2, x2, 36
	lw	x25, -36(x2)
	lw	x24, -32(x2)
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