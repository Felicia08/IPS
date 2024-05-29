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
# Function write_1darr
f.write_1darr:
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
# was:	mv	_write_1darrres_5_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_15_, _size_6_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_15_, _tmp_15_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_15_
	sw	x18, 0(x19)
# was:	sw	_size_6_, 0(_write_1darrres_5_)
	addi	x20, x19, 4
# was:	addi	_addrg_10_, _write_1darrres_5_, 4
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
# was:	mv	x10, _write_1darrres_5_
	addi	x2, x2, 24
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function write_2darr
f.write_2darr:
	sw	x1, -4(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -24
# 	mv	_param_x_16_,x10
# 	mv	_arr_19_,_param_x_16_
	lw	x18, 0(x10)
# was:	lw	_size_18_, 0(_arr_19_)
	mv	x19, x3
# was:	mv	_write_2darrres_17_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_27_, _size_18_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_27_, _tmp_27_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_27_
	sw	x18, 0(x19)
# was:	sw	_size_18_, 0(_write_2darrres_17_)
	addi	x20, x19, 4
# was:	addi	_addrg_22_, _write_2darrres_17_, 4
	mv	x21, x0
# was:	mv	_i_23_, x0
	addi	x22, x10, 4
# was:	addi	_elem_20_, _arr_19_, 4
l.loop_beg_24_:
	bge	x21, x18, l.loop_end_25_
# was:	bge	_i_23_, _size_18_, l.loop_end_25_
	lw	x10, 0(x22)
# was:	lw	_res_21_, 0(_elem_20_)
	addi	x22, x22, 4
# was:	addi	_elem_20_, _elem_20_, 4
# 	mv	x10,_res_21_
	jal	f.write_1darr
# was:	jal	f.write_1darr, x10
# 	mv	_tmp_26_,x10
# 	mv	_res_21_,_tmp_26_
	sw	x10, 0(x20)
# was:	sw	_res_21_, 0(_addrg_22_)
	addi	x20, x20, 4
# was:	addi	_addrg_22_, _addrg_22_, 4
	addi	x21, x21, 1
# was:	addi	_i_23_, _i_23_, 1
	j	l.loop_beg_24_
l.loop_end_25_:
	mv	x10, x19
# was:	mv	x10, _write_2darrres_17_
	addi	x2, x2, 24
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function even
f.even:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_a_28_,x10
# 	mv	_div_L_34_,_param_a_28_
	li	x11, 2
# was:	li	_div_R_35_, 2
	div	x12, x10, x11
# was:	div	_times_L_32_, _div_L_34_, _div_R_35_
	li	x11, 2
# was:	li	_times_R_33_, 2
	mul	x11, x12, x11
# was:	mul	_eq_L_30_, _times_L_32_, _times_R_33_
	mv	x12, x10
# was:	mv	_eq_R_31_, _param_a_28_
	li	x10, 0
# was:	li	_evenres_29_, 0
	bne	x11, x12, l.false_36_
# was:	bne	_eq_L_30_, _eq_R_31_, l.false_36_
	li	x10, 1
# was:	li	_evenres_29_, 1
l.false_36_:
# 	mv	x10,_evenres_29_
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
# 	mv	_let_n_38_,x10
# 	mv	_size_44_,_let_n_38_
	bge	x10, x0, l.safe_45_
# was:	bge	_size_44_, x0, l.safe_45_
	li	x10, 11
# was:	li	x10, 11
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_45_:
	mv	x14, x3
# was:	mv	_arr_41_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_50_, _size_44_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_50_, _tmp_50_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_50_
	sw	x10, 0(x14)
# was:	sw	_size_44_, 0(_arr_41_)
	addi	x12, x14, 4
# was:	addi	_addr_46_, _arr_41_, 4
	mv	x11, x0
# was:	mv	_i_47_, x0
l.loop_beg_48_:
	bge	x11, x10, l.loop_end_49_
# was:	bge	_i_47_, _size_44_, l.loop_end_49_
	sw	x11, 0(x12)
# was:	sw	_i_47_, 0(_addr_46_)
	addi	x12, x12, 4
# was:	addi	_addr_46_, _addr_46_, 4
	addi	x11, x11, 1
# was:	addi	_i_47_, _i_47_, 1
	j	l.loop_beg_48_
l.loop_end_49_:
	lw	x12, 0(x14)
# was:	lw	_size_40_, 0(_arr_41_)
	mv	x13, x3
# was:	mv	_let_a2d_39_, x3
	slli	x10, x12, 2
# was:	slli	_tmp_65_, _size_40_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_65_, _tmp_65_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_65_
	sw	x12, 0(x13)
# was:	sw	_size_40_, 0(_let_a2d_39_)
	addi	x11, x13, 4
# was:	addi	_addrg_51_, _let_a2d_39_, 4
	mv	x10, x0
# was:	mv	_i_52_, x0
	addi	x14, x14, 4
# was:	addi	_elem_42_, _arr_41_, 4
l.loop_beg_53_:
	bge	x10, x12, l.loop_end_54_
# was:	bge	_i_52_, _size_40_, l.loop_end_54_
	lw	x15, 0(x14)
# was:	lw	_res_43_, 0(_elem_42_)
	addi	x14, x14, 4
# was:	addi	_elem_42_, _elem_42_, 4
# 	mv	_plus_L_57_,_res_43_
	li	x16, 2
# was:	li	_plus_R_58_, 2
	add	x15, x15, x16
# was:	add	_size_56_, _plus_L_57_, _plus_R_58_
	bge	x15, x0, l.safe_59_
# was:	bge	_size_56_, x0, l.safe_59_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_59_:
	mv	x16, x3
# was:	mv	_fun_arg_res_55_, x3
	slli	x17, x15, 2
# was:	slli	_tmp_64_, _size_56_, 2
	addi	x17, x17, 4
# was:	addi	_tmp_64_, _tmp_64_, 4
	add	x3, x3, x17
# was:	add	x3, x3, _tmp_64_
	sw	x15, 0(x16)
# was:	sw	_size_56_, 0(_fun_arg_res_55_)
	addi	x18, x16, 4
# was:	addi	_addr_60_, _fun_arg_res_55_, 4
	mv	x17, x0
# was:	mv	_i_61_, x0
l.loop_beg_62_:
	bge	x17, x15, l.loop_end_63_
# was:	bge	_i_61_, _size_56_, l.loop_end_63_
	sw	x17, 0(x18)
# was:	sw	_i_61_, 0(_addr_60_)
	addi	x18, x18, 4
# was:	addi	_addr_60_, _addr_60_, 4
	addi	x17, x17, 1
# was:	addi	_i_61_, _i_61_, 1
	j	l.loop_beg_62_
l.loop_end_63_:
	mv	x15, x16
# was:	mv	_res_43_, _fun_arg_res_55_
	sw	x15, 0(x11)
# was:	sw	_res_43_, 0(_addrg_51_)
	addi	x11, x11, 4
# was:	addi	_addrg_51_, _addrg_51_, 4
	addi	x10, x10, 1
# was:	addi	_i_52_, _i_52_, 1
	j	l.loop_beg_53_
l.loop_end_54_:
# 	mv	_arr_reg_67_,_let_a2d_39_
	lw	x18, 0(x13)
# was:	lw	_arr_size_68_, 0(_arr_reg_67_)
	mv	x19, x3
# was:	mv	_let_a2df_66_, x3
	slli	x10, x18, 2
# was:	slli	_tmp_91_, _arr_size_68_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_91_, _tmp_91_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_91_
	sw	x18, 0(x19)
# was:	sw	_arr_size_68_, 0(_let_a2df_66_)
	mv	x23, x0
# was:	mv	_arr_i_69_, x0
	mv	x22, x0
# was:	mv	_out_i_70_, x0
	addi	x20, x19, 0
# was:	addi	_addr header_75_, _let_a2df_66_, 0
	addi	x21, x19, 4
# was:	addi	_addrg_71_, _let_a2df_66_, 4
	addi	x25, x13, 4
# was:	addi	_elem_72_, _arr_reg_67_, 4
l.loop_beg_76_:
	bge	x23, x18, l.loop_end_78_
# was:	bge	_arr_i_69_, _arr_size_68_, l.loop_end_78_
	lw	x24, 0(x25)
# was:	lw	_res_74_, 0(_elem_72_)
	addi	x25, x25, 4
# was:	addi	_elem_72_, _elem_72_, 4
	mv	x11, x24
# was:	mv	_arr_81_, _res_74_
	lw	x12, 0(x11)
# was:	lw	_size_82_, 0(_arr_81_)
	li	x14, 0
# was:	li	_let_r_80_, 0
	addi	x11, x11, 4
# was:	addi	_arr_81_, _arr_81_, 4
	mv	x10, x0
# was:	mv	_ind_var_83_, x0
l.loop_beg_85_:
	bge	x10, x12, l.loop_end_86_
# was:	bge	_ind_var_83_, _size_82_, l.loop_end_86_
	lw	x13, 0(x11)
# was:	lw	_tmp_84_, 0(_arr_81_)
	addi	x11, x11, 4
# was:	addi	_arr_81_, _arr_81_, 4
# 	mv	_plus_L_88_,_let_r_80_
# 	mv	_plus_R_89_,_tmp_84_
	add	x14, x14, x13
# was:	add	_fun_arg_res_87_, _plus_L_88_, _plus_R_89_
# 	mv	_let_r_80_,_fun_arg_res_87_
	addi	x10, x10, 1
# was:	addi	_ind_var_83_, _ind_var_83_, 1
	j	l.loop_beg_85_
l.loop_end_86_:
	mv	x10, x14
# was:	mv	_arg_90_, _let_r_80_
# 	mv	x10,_arg_90_
	jal	f.even
# was:	jal	f.even, x10
# 	mv	_fun_arg_res_79_,x10
# 	mv	_tmp_reg_73_,_fun_arg_res_79_
	beq	x10, x0, l.loop_false_77_
# was:	beq	_tmp_reg_73_, x0, l.loop_false_77_
	sw	x24, 0(x21)
# was:	sw	_res_74_, 0(_addrg_71_)
	addi	x21, x21, 4
# was:	addi	_addrg_71_, _addrg_71_, 4
	addi	x22, x22, 1
# was:	addi	_out_i_70_, _out_i_70_, 1
l.loop_false_77_:
	addi	x23, x23, 1
# was:	addi	_arr_i_69_, _arr_i_69_, 1
	j	l.loop_beg_76_
l.loop_end_78_:
	sw	x22, 0(x20)
# was:	sw	_out_i_70_, 0(_addr header_75_)
	mv	x10, x19
# was:	mv	_arg_92_, _let_a2df_66_
# 	mv	x10,_arg_92_
	jal	f.write_2darr
# was:	jal	f.write_2darr, x10
# 	mv	_mainres_37_,x10
# 	mv	x10,_mainres_37_
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