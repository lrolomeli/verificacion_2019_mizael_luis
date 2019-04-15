module top_mdr
#(
	parameter N = 5,
	parameter C = $clog2(2*N)
)(
	input clk,
	input rst,
	input load,
	input [1:0] op,
	input start,
	input [N-1:0] data,
	
	output [N-1:0]result,
	output [N-1:0]remainder
);


logic [1:0] op_w;
logic load_x_w;
logic load_y_w;
logic loaded_x_w;
logic loaded_y_w;
logic loaded_res_w;
logic msb_aq_w;
logic operating_w;
logic go_w;
logic done_w;
logic stop_w;

logic [N-1:0] regQ_w;
logic [N-1:0] regM_w;
logic [2*N:0] aq_w;
logic [N-1:0] A_sh_w;
logic flag_r_w;
logic [C:0] count_w;
logic [C:0] count_sh_w;
logic [N-1:0] M_sh_w; 
logic [N-1:0] am_or_w;
logic [N-1:0] qor1_w;
logic [N-1:0] qor3_w;
logic [N-1:0] q1_sh_w;
logic [N-1:0] q_sh_w;
logic [N-1:0] subs1_w;
logic [N-1:0] subs2_w;
logic [N-1:0] q_mux1_w;
logic [N-1:0] q_mux2_w;
logic [N-1:0] add1_w;
logic [N-1:0] add2_w;
logic [N-1:0] a_subs_w;
logic [N-1:0] a_add_w;
logic [N:0] q_exit_w;

logic [(2*N)-1:0] aq_ls_w;
logic [2*N:0] aq_mux_w;
logic [2*N:0] aq_out_w;
logic [2*N:0] aq_reg_w;

logic sel_w;


assign op_w = op;

demux demux_inst
(
	.load(load),
	.sel(sel_w),
	
	.load_y(load_y_w),
	.load_x(load_x_w)
);

register rQ
(
	.clk(clk),
	.rst(rst),
	.load(load_y_w),
	.in(data),
	
	.reg_in(regQ_w),
	.loaded(loaded_y_w)
);

register rM
(
	.clk(clk),
	.rst(rst),
	.load(load_x_w),
	.in(data),
	
	.reg_in(regM_w),
	.loaded(loaded_x_w)
);

mix_regs mixAQ
(
	.Q(regQ_w),
	.op(op_w[1]),
	
	.mix_reg(aq_w)
);

mux2_1 
#(
	.N((2*N)+1)
)
load_mux
(
	.a(aq_w),
	.b(aq_reg_w),
	.selector(loaded_res_w),
	
	.out(aq_mux_w)
);

left_shift
#(
	.N(N),
	.shift(2)
)
R_shift
(
	.in(aq_mux_w[2*N:N+1]),
	.out(A_sh_w)

);

counter
#(
	.N(N),
	.C(C)
)
count
(
	.clk(clk),
	.rst(rst),
	.start(start),
	
	/** Output ports **/
	.ov_counter(done_w),
	.flag_r(flag_r_w),
	.count(count_w),
	.able(operating_w)

);

left_shift
#(
	.N(C+1),
	.shift(1)
)
Q_shift
(
	.in(count_w),
	.out(count_sh_w)

);


rightvshift
#(
	.N(N),
	.C(C)
)
D_shift
(
	.in(regM_w),
	.shift(count_sh_w),
	.out(M_sh_w)

);



or_m
#(
	.N(N)
)
or_inst
(
	.a(A_sh_w),
	.b({{N-2{1'b0}},M_sh_w[1:0]}),
	
	.out(am_or_w)

);

comb_qshift2
#(
	.N(N)
)
q_shift2
(
	.Q(aq_mux_w[N:1]),
	
	.qor1(qor1_w),
	.qor3(qor3_w)

);


comb_qshift1
#(
	.N(N)
)
q_shift1
(
	.Q(aq_mux_w[N:1]),
	.q(q_sh_w),
	.q1(q1_sh_w)

);

left_shift
#(
	.N(2*N),
	.shift(1)
)
ls
(
	.in(aq_mux_w[2*N:1]),
	
	.out(aq_ls_w)
);


mux3_1
#(
	.N(N)
)
mux_subs1_inst
(
	.r(am_or_w),
	.d(aq_ls_w[(2*N)-1:N]),
	.m(aq_mux_w[2*N:N+1]),
	.sel(op_w),
	
	.out(subs1_w)
);

mux3_1
#(
	.N(N)
)
mux_subs2_inst
(
	.r(qor1_w),
	.d(regM_w),
	.m(regM_w),
	.sel(op_w),
	
	.out(subs2_w)
);


mux4_2
#(
	.N(N)
)
mux4_2_inst
(
	.a(q1_sh_w),
	.b(aq_reg_w[2*N:N+1]),//retroalimentacion de A
	.c(qor3_w),
	.d(subs1_w),
	.selector(done_w), //Si es la ultima corrida prende a 1
	
	.out1(q_mux1_w),
	.out2(q_mux2_w)

);


subtractor
#(
	.N(N)
)
subs
(
	.a(subs1_w),
	.m(subs2_w),
	
	.s(a_subs_w)
);


q_exit
#(
	.N(N)
)
q_exit_inst
(
	.QD({aq_ls_w[N-1:0], 1'b0}),
	.QM(aq_mux_w[N:0]),
	.QR1({q1_sh_w, 1'b0}),//Q leftshift 1 or 1
	.QR0({q_sh_w, 1'b0}),//Q leftshift 1
	.op(op_w),
	.msb_aq(msb_aq_w),
	
	
	.out(q_exit_w)

);


mux3_1
#(
	.N(N)
)
mux_add1_inst
(
	.m(subs1_w),
	.d(a_subs_w),
	.r(q_mux1_w),
	.sel(op_w),
	
	.out(add1_w)
);


mux3_1
#(
	.N(N)
)
mux_add2_inst
(
	.r(q_mux2_w),
	.d(regM_w),
	.m(regM_w),
	.sel(op_w),
	
	.out(add2_w)
);

adder
#(
	.N(N)
)
add
(
	.a(add1_w),
	.m(add2_w),
	
	.s(a_add_w)
);

control_operation
#(
	.N(N)
)
co_inst
(
	.a_plus_m(a_add_w),
	.a_minus_m(a_subs_w),
	.a(subs1_w),
	.q(q_exit_w),
	.aq_reg(aq_reg_w),
	.msb_AM(subs1_w[N-1]),//msb de RD o AM que es el dato de entrada shifteado
	.ov_count(done_w),
	.msb_reg_A(aq_reg_w[2*N]),
	.op(op_w),
	
	.msb_aq(msb_aq_w),//bit que va al multiplexor de Q
	.aq_out(aq_out_w)
);



statemachine fsm
(
	.clk(clk),
	.rst(rst),
	.start(start),
	.load(load),
	.loaded_x(loaded_x_w),
	.loaded_y(loaded_y_w),
	.done(done_w),
	
	.sel(sel_w),
	.stop(stop_w)

);



/*
* Last Register
* Output Register
* Containing Result
* of the combinational
* route
*/

register
#(
	.N((2*N)+1)
)
aq_rgstr
(
	.clk(clk),
	.rst(rst),
	.load(operating_w),	//Esta senal debe permanecer N ciclos arriba y cuando se desborde overflow
				//la senal que viene desde control unit baja y por lo tanto el registro se queda con el ultimo
				//valor registrado.
	.in(aq_out_w),
	
	.reg_in(aq_reg_w),
	.loaded(loaded_res_w)
);



//assign remainder = (flag_r_w) ? aq_reg_w[2*N:N+1] : '0;
//assign result = (done_w) ? aq_reg_w[N:1] : '0;
assign remainder = aq_reg_w[2*N:N+1];
assign result = aq_reg_w[N:1];



endmodule 
