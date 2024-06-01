	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function division
f.division:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	mv	x11, x10
# was:	mv	_param_n_1_, x10
	li	x10, 3
# was:	li	_let_x_3_, 3
# 	mv	_times_L_5_,_param_n_1_
# 	mv	_times_R_6_,_let_x_3_
	mul	x10, x11, x10
# was:	mul	_let_y_4_, _times_L_5_, _times_R_6_
# 	mv	_plus_L_9_,_let_y_4_
	li	x11, 4
# was:	li	_plus_R_10_, 4
	add	x12, x10, x11
# was:	add	_size_8_, _plus_L_9_, _plus_R_10_
	bge	x12, x0, l.safe_11_
# was:	bge	_size_8_, x0, l.safe_11_
	li	x10, 2
# was:	li	x10, 2
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_11_:
	mv	x11, x3
# was:	mv	_let_z_7_, x3
	slli	x13, x12, 2
# was:	slli	_tmp_16_, _size_8_, 2
	addi	x13, x13, 4
# was:	addi	_tmp_16_, _tmp_16_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_16_
	sw	x12, 0(x11)
# was:	sw	_size_8_, 0(_let_z_7_)
	addi	x14, x11, 4
# was:	addi	_addr_12_, _let_z_7_, 4
	mv	x13, x0
# was:	mv	_i_13_, x0
l.loop_beg_14_:
	bge	x13, x12, l.loop_end_15_
# was:	bge	_i_13_, _size_8_, l.loop_end_15_
	sw	x13, 0(x14)
# was:	sw	_i_13_, 0(_addr_12_)
	addi	x14, x14, 4
# was:	addi	_addr_12_, _addr_12_, 4
	addi	x13, x13, 1
# was:	addi	_i_13_, _i_13_, 1
	j	l.loop_beg_14_
l.loop_end_15_:
# 	mv	_arr_ind_17_,_let_y_4_
	addi	x12, x11, 4
# was:	addi	_arr_data_18_, _let_z_7_, 4
	bge	x10, x0, l.nonneg_21_
# was:	bge	_arr_ind_17_, x0, l.nonneg_21_
l.error_20_:
	li	x10, 2
# was:	li	x10, 2
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_21_:
	lw	x11, 0(x11)
# was:	lw	_size_19_, 0(_let_z_7_)
	bge	x10, x11, l.error_20_
# was:	bge	_arr_ind_17_, _size_19_, l.error_20_
	slli	x10, x10, 2
# was:	slli	_arr_ind_17_, _arr_ind_17_, 2
	add	x12, x12, x10
# was:	add	_arr_data_18_, _arr_data_18_, _arr_ind_17_
	lw	x10, 0(x12)
# was:	lw	_divisionres_2_, 0(_arr_data_18_)
# 	mv	x10,_divisionres_2_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_23_,x10
# 	mv	_arg_25_,_let_n_23_
# 	mv	x10,_arg_25_
	jal	f.division
# was:	jal	f.division, x10
# 	mv	_tmp_24_,x10
	mv	x18, x10
# was:	mv	_mainres_22_, _tmp_24_
	mv	x10, x18
# was:	mv	x10, _mainres_22_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _mainres_22_
	addi	x2, x2, 8
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