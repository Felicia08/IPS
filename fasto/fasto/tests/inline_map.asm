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
# 	mv	_let_N_2_,x10
# 	mv	_size_4_,_let_N_2_
	bge	x10, x0, l.safe_5_
# was:	bge	_size_4_, x0, l.safe_5_
	li	x10, 15
# was:	li	x10, 15
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_5_:
	mv	x11, x3
# was:	mv	_let_z_3_, x3
	slli	x12, x10, 2
# was:	slli	_tmp_10_, _size_4_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_10_, _tmp_10_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_10_
	sw	x10, 0(x11)
# was:	sw	_size_4_, 0(_let_z_3_)
	addi	x12, x11, 4
# was:	addi	_addr_6_, _let_z_3_, 4
	mv	x11, x0
# was:	mv	_i_7_, x0
l.loop_beg_8_:
	bge	x11, x10, l.loop_end_9_
# was:	bge	_i_7_, _size_4_, l.loop_end_9_
	sw	x11, 0(x12)
# was:	sw	_i_7_, 0(_addr_6_)
	addi	x12, x12, 4
# was:	addi	_addr_6_, _addr_6_, 4
	addi	x11, x11, 1
# was:	addi	_i_7_, _i_7_, 1
	j	l.loop_beg_8_
l.loop_end_9_:
	mv	x11, x10
# was:	mv	_plus_L_12_, _let_N_2_
# 	mv	_plus_R_13_,_let_N_2_
	add	x0, x11, x10
# was:	add	_let_q_11_, _plus_L_12_, _plus_R_13_
# 	mv	_plus_L_17_,_let_N_2_
	mv	x11, x10
# was:	mv	_plus_R_18_, _let_N_2_
	add	x11, x10, x11
# was:	add	_plus_L_15_, _plus_L_17_, _plus_R_18_
# 	mv	_plus_R_16_,_let_N_2_
	add	x13, x11, x10
# was:	add	_let_z_14_, _plus_L_15_, _plus_R_16_
# 	mv	_let_y_19_,_let_z_14_
# 	mv	_let_a_I3_20_,_let_z_14_
	li	x0, 8
# was:	li	_let_a_21_, 8
# 	mv	_arr_24_,_let_z_14_
	lw	x12, 0(x13)
# was:	lw	_size_23_, 0(_arr_24_)
	mv	x11, x3
# was:	mv	_let_x_22_, x3
	slli	x10, x12, 2
# was:	slli	_tmp_34_, _size_23_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_34_, _tmp_34_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_34_
	sw	x12, 0(x11)
# was:	sw	_size_23_, 0(_let_x_22_)
	addi	x10, x11, 4
# was:	addi	_addrg_27_, _let_x_22_, 4
	mv	x11, x0
# was:	mv	_i_28_, x0
	addi	x13, x13, 4
# was:	addi	_elem_25_, _arr_24_, 4
l.loop_beg_29_:
	bge	x11, x12, l.loop_end_30_
# was:	bge	_i_28_, _size_23_, l.loop_end_30_
	lw	x14, 0(x13)
# was:	lw	_res_26_, 0(_elem_25_)
	addi	x13, x13, 4
# was:	addi	_elem_25_, _elem_25_, 4
# 	mv	_plus_L_32_,_res_26_
	li	x15, 5
# was:	li	_plus_R_33_, 5
	add	x14, x14, x15
# was:	add	_fun_arg_res_31_, _plus_L_32_, _plus_R_33_
# 	mv	_res_26_,_fun_arg_res_31_
	sw	x14, 0(x10)
# was:	sw	_res_26_, 0(_addrg_27_)
	addi	x10, x10, 4
# was:	addi	_addrg_27_, _addrg_27_, 4
	addi	x11, x11, 1
# was:	addi	_i_28_, _i_28_, 1
	j	l.loop_beg_29_
l.loop_end_30_:
	li	x0, 8
# was:	li	_let_y_35_, 8
	li	x14, 8
# was:	li	_arr_38_, 8
	lw	x11, 0(x14)
# was:	lw	_size_37_, 0(_arr_38_)
	mv	x10, x3
# was:	mv	_let_w_36_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_48_, _size_37_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_48_, _tmp_48_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_48_
	sw	x11, 0(x10)
# was:	sw	_size_37_, 0(_let_w_36_)
	addi	x12, x10, 4
# was:	addi	_addrg_41_, _let_w_36_, 4
	mv	x13, x0
# was:	mv	_i_42_, x0
	addi	x14, x14, 4
# was:	addi	_elem_39_, _arr_38_, 4
l.loop_beg_43_:
	bge	x13, x11, l.loop_end_44_
# was:	bge	_i_42_, _size_37_, l.loop_end_44_
	lw	x15, 0(x14)
# was:	lw	_res_40_, 0(_elem_39_)
	addi	x14, x14, 4
# was:	addi	_elem_39_, _elem_39_, 4
# 	mv	_plus_L_46_,_res_40_
	mv	x16, x15
# was:	mv	_plus_R_47_, _res_40_
	add	x15, x15, x16
# was:	add	_fun_arg_res_45_, _plus_L_46_, _plus_R_47_
# 	mv	_res_40_,_fun_arg_res_45_
	sw	x15, 0(x12)
# was:	sw	_res_40_, 0(_addrg_41_)
	addi	x12, x12, 4
# was:	addi	_addrg_41_, _addrg_41_, 4
	addi	x13, x13, 1
# was:	addi	_i_42_, _i_42_, 1
	j	l.loop_beg_43_
l.loop_end_44_:
# 	mv	_let_x_I4_49_,_let_w_36_
# 	mv	_let_x_50_,_let_w_36_
# 	mv	_arr_52_,_let_w_36_
	lw	x19, 0(x10)
# was:	lw	_size_51_, 0(_arr_52_)
	mv	x18, x3
# was:	mv	_mainres_1_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_61_, _size_51_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_61_, _tmp_61_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_61_
	sw	x19, 0(x18)
# was:	sw	_size_51_, 0(_mainres_1_)
	addi	x20, x18, 4
# was:	addi	_addrg_55_, _mainres_1_, 4
	mv	x21, x0
# was:	mv	_i_56_, x0
	addi	x22, x10, 4
# was:	addi	_elem_53_, _arr_52_, 4
l.loop_beg_57_:
	bge	x21, x19, l.loop_end_58_
# was:	bge	_i_56_, _size_51_, l.loop_end_58_
	lw	x23, 0(x22)
# was:	lw	_res_54_, 0(_elem_53_)
	addi	x22, x22, 4
# was:	addi	_elem_53_, _elem_53_, 4
# 	mv	_tmp_60_,_res_54_
# 	mv	_fun_arg_res_59_,_tmp_60_
	mv	x10, x23
# was:	mv	x10, _fun_arg_res_59_
	jal	p.putint
# was:	jal	p.putint, x10
# 	mv	_res_54_,_fun_arg_res_59_
	sw	x23, 0(x20)
# was:	sw	_res_54_, 0(_addrg_55_)
	addi	x20, x20, 4
# was:	addi	_addrg_55_, _addrg_55_, 4
	addi	x21, x21, 1
# was:	addi	_i_56_, _i_56_, 1
	j	l.loop_beg_57_
l.loop_end_58_:
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