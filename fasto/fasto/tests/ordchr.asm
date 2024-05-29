	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -24
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_2_,x10
# 	mv	_let_s1_3_,_let_n_2_
# 	mv	_let_n_I1_4_,_let_n_2_
	mv	x11, x10
# was:	mv	_size_10_, _let_n_2_
	bge	x11, x0, l.safe_11_
# was:	bge	_size_10_, x0, l.safe_11_
	li	x10, 3
# was:	li	x10, 3
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_11_:
	mv	x10, x3
# was:	mv	_arr_7_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_16_, _size_10_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_16_, _tmp_16_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_16_
	sw	x11, 0(x10)
# was:	sw	_size_10_, 0(_arr_7_)
	addi	x12, x10, 4
# was:	addi	_addr_12_, _arr_7_, 4
	mv	x13, x0
# was:	mv	_i_13_, x0
l.loop_beg_14_:
	bge	x13, x11, l.loop_end_15_
# was:	bge	_i_13_, _size_10_, l.loop_end_15_
	sw	x13, 0(x12)
# was:	sw	_i_13_, 0(_addr_12_)
	addi	x12, x12, 4
# was:	addi	_addr_12_, _addr_12_, 4
	addi	x13, x13, 1
# was:	addi	_i_13_, _i_13_, 1
	j	l.loop_beg_14_
l.loop_end_15_:
	lw	x19, 0(x10)
# was:	lw	_size_6_, 0(_arr_7_)
	mv	x20, x3
# was:	mv	_let_n_5_, x3
	addi	x11, x19, 3
# was:	addi	_tmp_22_, _size_6_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_22_, _tmp_22_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_22_, _tmp_22_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_22_
	sw	x19, 0(x20)
# was:	sw	_size_6_, 0(_let_n_5_)
	addi	x18, x20, 4
# was:	addi	_addrg_17_, _let_n_5_, 4
	mv	x21, x0
# was:	mv	_i_18_, x0
	addi	x22, x10, 4
# was:	addi	_elem_8_, _arr_7_, 4
l.loop_beg_19_:
	bge	x21, x19, l.loop_end_20_
# was:	bge	_i_18_, _size_6_, l.loop_end_20_
	lw	x10, 0(x22)
# was:	lw	_res_9_, 0(_elem_8_)
	addi	x22, x22, 4
# was:	addi	_elem_8_, _elem_8_, 4
	jal	p.getchar
# was:	jal	p.getchar, 
# 	mv	_fun_arg_res_21_,x10
# 	mv	_res_9_,_fun_arg_res_21_
	sb	x10, 0(x18)
# was:	sb	_res_9_, 0(_addrg_17_)
	addi	x18, x18, 1
# was:	addi	_addrg_17_, _addrg_17_, 1
	addi	x21, x21, 1
# was:	addi	_i_18_, _i_18_, 1
	j	l.loop_beg_19_
l.loop_end_20_:
	mv	x10, x20
# was:	mv	_arr_33_, _let_n_5_
	lw	x21, 0(x10)
# was:	lw	_size_32_, 0(_arr_33_)
	mv	x18, x3
# was:	mv	_arr_29_, x3
	slli	x11, x21, 2
# was:	slli	_tmp_41_, _size_32_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_41_, _tmp_41_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_41_
	sw	x21, 0(x18)
# was:	sw	_size_32_, 0(_arr_29_)
	addi	x20, x18, 4
# was:	addi	_addrg_36_, _arr_29_, 4
	mv	x19, x0
# was:	mv	_i_37_, x0
	addi	x22, x10, 4
# was:	addi	_elem_34_, _arr_33_, 4
l.loop_beg_38_:
	bge	x19, x21, l.loop_end_39_
# was:	bge	_i_37_, _size_32_, l.loop_end_39_
	lbu	x10, 0(x22)
# was:	lbu	_res_35_, 0(_elem_34_)
	addi	x22, x22, 1
# was:	addi	_elem_34_, _elem_34_, 1
# 	mv	x10,_res_35_
	jal	f.ord
# was:	jal	f.ord, x10
# 	mv	_tmp_40_,x10
# 	mv	_res_35_,_tmp_40_
	sw	x10, 0(x20)
# was:	sw	_res_35_, 0(_addrg_36_)
	addi	x20, x20, 4
# was:	addi	_addrg_36_, _addrg_36_, 4
	addi	x19, x19, 1
# was:	addi	_i_37_, _i_37_, 1
	j	l.loop_beg_38_
l.loop_end_39_:
	lw	x11, 0(x18)
# was:	lw	_size_28_, 0(_arr_29_)
	mv	x10, x3
# was:	mv	_arr_25_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_49_, _size_28_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_49_, _tmp_49_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_49_
	sw	x11, 0(x10)
# was:	sw	_size_28_, 0(_arr_25_)
	addi	x13, x10, 4
# was:	addi	_addrg_42_, _arr_25_, 4
	mv	x12, x0
# was:	mv	_i_43_, x0
	addi	x14, x18, 4
# was:	addi	_elem_30_, _arr_29_, 4
l.loop_beg_44_:
	bge	x12, x11, l.loop_end_45_
# was:	bge	_i_43_, _size_28_, l.loop_end_45_
	lw	x15, 0(x14)
# was:	lw	_res_31_, 0(_elem_30_)
	addi	x14, x14, 4
# was:	addi	_elem_30_, _elem_30_, 4
	mv	x16, x15
# was:	mv	_plus_L_47_, _res_31_
	li	x15, 1
# was:	li	_plus_R_48_, 1
	add	x15, x16, x15
# was:	add	_fun_arg_res_46_, _plus_L_47_, _plus_R_48_
# 	mv	_res_31_,_fun_arg_res_46_
	sw	x15, 0(x13)
# was:	sw	_res_31_, 0(_addrg_42_)
	addi	x13, x13, 4
# was:	addi	_addrg_42_, _addrg_42_, 4
	addi	x12, x12, 1
# was:	addi	_i_43_, _i_43_, 1
	j	l.loop_beg_44_
l.loop_end_45_:
	lw	x18, 0(x10)
# was:	lw	_size_24_, 0(_arr_25_)
	mv	x19, x3
# was:	mv	_let_s2_23_, x3
	addi	x11, x18, 3
# was:	addi	_tmp_55_, _size_24_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_55_, _tmp_55_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_55_, _tmp_55_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_55_
	sw	x18, 0(x19)
# was:	sw	_size_24_, 0(_let_s2_23_)
	addi	x20, x19, 4
# was:	addi	_addrg_50_, _let_s2_23_, 4
	mv	x21, x0
# was:	mv	_i_51_, x0
	addi	x22, x10, 4
# was:	addi	_elem_26_, _arr_25_, 4
l.loop_beg_52_:
	bge	x21, x18, l.loop_end_53_
# was:	bge	_i_51_, _size_24_, l.loop_end_53_
	lw	x10, 0(x22)
# was:	lw	_res_27_, 0(_elem_26_)
	addi	x22, x22, 4
# was:	addi	_elem_26_, _elem_26_, 4
# 	mv	x10,_res_27_
	jal	f.chr
# was:	jal	f.chr, x10
# 	mv	_tmp_54_,x10
# 	mv	_res_27_,_tmp_54_
	sb	x10, 0(x20)
# was:	sb	_res_27_, 0(_addrg_50_)
	addi	x20, x20, 1
# was:	addi	_addrg_50_, _addrg_50_, 1
	addi	x21, x21, 1
# was:	addi	_i_51_, _i_51_, 1
	j	l.loop_beg_52_
l.loop_end_53_:
	mv	x10, x19
# was:	mv	_tmp_56_, _let_s2_23_
	mv	x18, x10
# was:	mv	_mainres_1_, _tmp_56_
# 	mv	x10,_tmp_56_
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	x10, _mainres_1_
	addi	x2, x2, 24
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