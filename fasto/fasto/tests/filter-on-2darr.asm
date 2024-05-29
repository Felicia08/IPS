	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x28, -48(x2)
	sw	x27, -44(x2)
	sw	x26, -40(x2)
	sw	x25, -36(x2)
	sw	x24, -32(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -48
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_2_,x10
	mv	x11, x10
# was:	mv	_size_8_, _let_n_2_
	bge	x11, x0, l.safe_9_
# was:	bge	_size_8_, x0, l.safe_9_
	li	x10, 11
# was:	li	x10, 11
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_9_:
	mv	x14, x3
# was:	mv	_arr_5_, x3
	slli	x10, x11, 2
# was:	slli	_tmp_14_, _size_8_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_14_, _tmp_14_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_14_
	sw	x11, 0(x14)
# was:	sw	_size_8_, 0(_arr_5_)
	addi	x12, x14, 4
# was:	addi	_addr_10_, _arr_5_, 4
	mv	x10, x0
# was:	mv	_i_11_, x0
l.loop_beg_12_:
	bge	x10, x11, l.loop_end_13_
# was:	bge	_i_11_, _size_8_, l.loop_end_13_
	sw	x10, 0(x12)
# was:	sw	_i_11_, 0(_addr_10_)
	addi	x12, x12, 4
# was:	addi	_addr_10_, _addr_10_, 4
	addi	x10, x10, 1
# was:	addi	_i_11_, _i_11_, 1
	j	l.loop_beg_12_
l.loop_end_13_:
	lw	x10, 0(x14)
# was:	lw	_size_4_, 0(_arr_5_)
	mv	x11, x3
# was:	mv	_let_a2d_3_, x3
	slli	x12, x10, 2
# was:	slli	_tmp_29_, _size_4_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_29_, _tmp_29_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_29_
	sw	x10, 0(x11)
# was:	sw	_size_4_, 0(_let_a2d_3_)
	addi	x13, x11, 4
# was:	addi	_addrg_15_, _let_a2d_3_, 4
	mv	x12, x0
# was:	mv	_i_16_, x0
	addi	x14, x14, 4
# was:	addi	_elem_6_, _arr_5_, 4
l.loop_beg_17_:
	bge	x12, x10, l.loop_end_18_
# was:	bge	_i_16_, _size_4_, l.loop_end_18_
	lw	x15, 0(x14)
# was:	lw	_res_7_, 0(_elem_6_)
	addi	x14, x14, 4
# was:	addi	_elem_6_, _elem_6_, 4
# 	mv	_plus_L_21_,_res_7_
	li	x16, 2
# was:	li	_plus_R_22_, 2
	add	x15, x15, x16
# was:	add	_size_20_, _plus_L_21_, _plus_R_22_
	bge	x15, x0, l.safe_23_
# was:	bge	_size_20_, x0, l.safe_23_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_23_:
	mv	x16, x3
# was:	mv	_fun_arg_res_19_, x3
	slli	x17, x15, 2
# was:	slli	_tmp_28_, _size_20_, 2
	addi	x17, x17, 4
# was:	addi	_tmp_28_, _tmp_28_, 4
	add	x3, x3, x17
# was:	add	x3, x3, _tmp_28_
	sw	x15, 0(x16)
# was:	sw	_size_20_, 0(_fun_arg_res_19_)
	addi	x18, x16, 4
# was:	addi	_addr_24_, _fun_arg_res_19_, 4
	mv	x17, x0
# was:	mv	_i_25_, x0
l.loop_beg_26_:
	bge	x17, x15, l.loop_end_27_
# was:	bge	_i_25_, _size_20_, l.loop_end_27_
	sw	x17, 0(x18)
# was:	sw	_i_25_, 0(_addr_24_)
	addi	x18, x18, 4
# was:	addi	_addr_24_, _addr_24_, 4
	addi	x17, x17, 1
# was:	addi	_i_25_, _i_25_, 1
	j	l.loop_beg_26_
l.loop_end_27_:
	mv	x15, x16
# was:	mv	_res_7_, _fun_arg_res_19_
	sw	x15, 0(x13)
# was:	sw	_res_7_, 0(_addrg_15_)
	addi	x13, x13, 4
# was:	addi	_addrg_15_, _addrg_15_, 4
	addi	x12, x12, 1
# was:	addi	_i_16_, _i_16_, 1
	j	l.loop_beg_17_
l.loop_end_18_:
	mv	x16, x11
# was:	mv	_arr_reg_31_, _let_a2d_3_
	lw	x14, 0(x16)
# was:	lw	_arr_size_32_, 0(_arr_reg_31_)
	mv	x13, x3
# was:	mv	_let_a2df_30_, x3
	slli	x10, x14, 2
# was:	slli	_tmp_63_, _arr_size_32_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_63_, _tmp_63_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_63_
	sw	x14, 0(x13)
# was:	sw	_arr_size_32_, 0(_let_a2df_30_)
	mv	x12, x0
# was:	mv	_arr_i_33_, x0
	mv	x11, x0
# was:	mv	_out_i_34_, x0
	addi	x10, x13, 0
# was:	addi	_addr header_39_, _let_a2df_30_, 0
	addi	x15, x13, 4
# was:	addi	_addrg_35_, _let_a2df_30_, 4
	addi	x17, x16, 4
# was:	addi	_elem_36_, _arr_reg_31_, 4
l.loop_beg_40_:
	bge	x12, x14, l.loop_end_42_
# was:	bge	_arr_i_33_, _arr_size_32_, l.loop_end_42_
	lw	x16, 0(x17)
# was:	lw	_res_38_, 0(_elem_36_)
	addi	x17, x17, 4
# was:	addi	_elem_36_, _elem_36_, 4
	mv	x20, x16
# was:	mv	_arr_45_, _res_38_
	lw	x19, 0(x20)
# was:	lw	_size_46_, 0(_arr_45_)
	li	x22, 0
# was:	li	_let_r_44_, 0
	addi	x20, x20, 4
# was:	addi	_arr_45_, _arr_45_, 4
	mv	x18, x0
# was:	mv	_ind_var_47_, x0
l.loop_beg_49_:
	bge	x18, x19, l.loop_end_50_
# was:	bge	_ind_var_47_, _size_46_, l.loop_end_50_
	lw	x21, 0(x20)
# was:	lw	_tmp_48_, 0(_arr_45_)
	addi	x20, x20, 4
# was:	addi	_arr_45_, _arr_45_, 4
# 	mv	_plus_L_52_,_let_r_44_
# 	mv	_plus_R_53_,_tmp_48_
	add	x22, x22, x21
# was:	add	_fun_arg_res_51_, _plus_L_52_, _plus_R_53_
# 	mv	_let_r_44_,_fun_arg_res_51_
	addi	x18, x18, 1
# was:	addi	_ind_var_47_, _ind_var_47_, 1
	j	l.loop_beg_49_
l.loop_end_50_:
# 	mv	_div_L_58_,_let_r_44_
	li	x18, 2
# was:	li	_div_R_59_, 2
	beq	x18, x0, l.error_61_
# was:	beq	_div_R_59_, x0, l.error_61_
	div	x19, x22, x18
# was:	div	_times_L_56_, _div_L_58_, _div_R_59_
	j	l.labelend_60_
l.error_61_:
	li	x10, 6
# was:	li	x10, 6
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.labelend_60_:
	li	x18, 2
# was:	li	_times_R_57_, 2
	mul	x18, x19, x18
# was:	mul	_eq_L_54_, _times_L_56_, _times_R_57_
# 	mv	_eq_R_55_,_let_r_44_
	li	x19, 0
# was:	li	_fun_arg_res_43_, 0
	bne	x18, x22, l.false_62_
# was:	bne	_eq_L_54_, _eq_R_55_, l.false_62_
	li	x19, 1
# was:	li	_fun_arg_res_43_, 1
l.false_62_:
# 	mv	_tmp_reg_37_,_fun_arg_res_43_
	beq	x19, x0, l.loop_false_41_
# was:	beq	_tmp_reg_37_, x0, l.loop_false_41_
	sw	x16, 0(x15)
# was:	sw	_res_38_, 0(_addrg_35_)
	addi	x15, x15, 4
# was:	addi	_addrg_35_, _addrg_35_, 4
	addi	x11, x11, 1
# was:	addi	_out_i_34_, _out_i_34_, 1
l.loop_false_41_:
	addi	x12, x12, 1
# was:	addi	_arr_i_33_, _arr_i_33_, 1
	j	l.loop_beg_40_
l.loop_end_42_:
	sw	x11, 0(x10)
# was:	sw	_out_i_34_, 0(_addr header_39_)
# 	mv	_arr_65_,_let_a2df_30_
	lw	x22, 0(x13)
# was:	lw	_size_64_, 0(_arr_65_)
	mv	x21, x3
# was:	mv	_mainres_1_, x3
	slli	x10, x22, 2
# was:	slli	_tmp_84_, _size_64_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_84_, _tmp_84_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_84_
	sw	x22, 0(x21)
# was:	sw	_size_64_, 0(_mainres_1_)
	addi	x19, x21, 4
# was:	addi	_addrg_68_, _mainres_1_, 4
	mv	x20, x0
# was:	mv	_i_69_, x0
	addi	x18, x13, 4
# was:	addi	_elem_66_, _arr_65_, 4
l.loop_beg_70_:
	bge	x20, x22, l.loop_end_71_
# was:	bge	_i_69_, _size_64_, l.loop_end_71_
	lw	x10, 0(x18)
# was:	lw	_res_67_, 0(_elem_66_)
	addi	x18, x18, 4
# was:	addi	_elem_66_, _elem_66_, 4
# 	mv	_arr_74_,_res_67_
	lw	x23, 0(x10)
# was:	lw	_size_73_, 0(_arr_74_)
	mv	x24, x3
# was:	mv	_fun_arg_res_72_, x3
	slli	x11, x23, 2
# was:	slli	_tmp_83_, _size_73_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_83_, _tmp_83_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_83_
	sw	x23, 0(x24)
# was:	sw	_size_73_, 0(_fun_arg_res_72_)
	addi	x25, x24, 4
# was:	addi	_addrg_77_, _fun_arg_res_72_, 4
	mv	x26, x0
# was:	mv	_i_78_, x0
	addi	x27, x10, 4
# was:	addi	_elem_75_, _arr_74_, 4
l.loop_beg_79_:
	bge	x26, x23, l.loop_end_80_
# was:	bge	_i_78_, _size_73_, l.loop_end_80_
	lw	x28, 0(x27)
# was:	lw	_res_76_, 0(_elem_75_)
	addi	x27, x27, 4
# was:	addi	_elem_75_, _elem_75_, 4
# 	mv	_tmp_82_,_res_76_
# 	mv	_fun_arg_res_81_,_tmp_82_
	mv	x10, x28
# was:	mv	x10, _fun_arg_res_81_
	jal	p.putint
# was:	jal	p.putint, x10
# 	mv	_res_76_,_fun_arg_res_81_
	sw	x28, 0(x25)
# was:	sw	_res_76_, 0(_addrg_77_)
	addi	x25, x25, 4
# was:	addi	_addrg_77_, _addrg_77_, 4
	addi	x26, x26, 1
# was:	addi	_i_78_, _i_78_, 1
	j	l.loop_beg_79_
l.loop_end_80_:
	mv	x10, x24
# was:	mv	_res_67_, _fun_arg_res_72_
	sw	x10, 0(x19)
# was:	sw	_res_67_, 0(_addrg_68_)
	addi	x19, x19, 4
# was:	addi	_addrg_68_, _addrg_68_, 4
	addi	x20, x20, 1
# was:	addi	_i_69_, _i_69_, 1
	j	l.loop_beg_70_
l.loop_end_71_:
	mv	x10, x21
# was:	mv	x10, _mainres_1_
	addi	x2, x2, 48
	lw	x28, -48(x2)
	lw	x27, -44(x2)
	lw	x26, -40(x2)
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