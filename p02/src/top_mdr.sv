//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module top_mdr
(
	input clk,
	input rst,
	input load,
	input twobits op,
	input start,
	input wsizeN data,
	
	`ifdef MODELSIM
	output wsizeN result,
	output wsizeN remainder,
	`endif
	output load_x,
	output load_y,
	output ready,
	output error,
	output segment [TAM-1:0] seg
	
);


twobits op_w;
logic load_w;
logic start_w;
logic load_x_w;
logic load_y_w;
logic loaded_x_w;
logic loaded_y_w;
logic loaded_res_w;
logic msb_aq_w;
logic operating_w;
logic go_w;
logic done_w;
logic flag_r_w;

wcountsize count_w;
wcountsize count_sh_w;

wsizeN regQ_w;
wsizeN regM_w;
wsizeN A_sh_w;
wsizeN M_sh_w; 
wsizeN am_or_w;
wsizeN qor1_w;
wsizeN qor3_w;
wsizeN q1_sh_w;
wsizeN q_sh_w;
wsizeN subs1_w;
wsizeN subs2_w;
wsizeN q_mux1_w;
wsizeN q_mux2_w;
wsizeN add1_w;
wsizeN add2_w;
wsizeN a_subs_w;
wsizeN a_add_w;

wqsize q_exit_w;

wsize2N aq_ls_w;
wsize2N in_segments_w;
waqsize aq_mux_w;
waqsize aq_out_w;
waqsize aq_reg_w;
waqsize aq_w;

buses out;

assign op_w = op;


`ifdef MODELSIM
assign load_w = load;
assign start_w = start;
`endif

`ifndef MODELSIM

debounce dbload_inst
(
	/** Input ports **/
	.clk(clk),
	.rst(rst), 
	.start(load),

	/** Output ports **/
	.db_out(load_w)													
);


debounce dbstart_inst
(
	/** Input ports **/
	.clk(clk),
	.rst(rst), 
	.start(start),

	/** Output ports **/
	.db_out(start_w)													
);

`endif 


demux demux_inst
(
	.clk(clk),
	.rst(rst),
	.load(load_w),
	
	.load_y(load_y_w),
	.load_x(load_x_w)
);

register 
#(
	.N(N)
)
rQ
(
	.clk(clk),
	.rst(rst),
	.load(load_x_w),
	.in(data),
	
	.reg_in(regQ_w),
	.loaded(loaded_x_w)
);

register
#(
	.N(N)
)
rM
(
	.clk(clk),
	.rst(rst),
	.load(load_y_w),
	.in(data),
	
	.reg_in(regM_w),
	.loaded(loaded_y_w)
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
	.start(start_w),
	
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


rightvshift D_shift
(
	.in(regM_w),
	.shift(count_sh_w),
	.out(M_sh_w)

);



or_m or_inst
(
	.a(A_sh_w),
	.b({{N-2{1'b0}},M_sh_w[1:0]}),
	
	.out(am_or_w)

);

comb_qshift2 q_shift2
(
	.Q(aq_mux_w[N:1]),
	
	.qor1(qor1_w),
	.qor3(qor3_w)

);


comb_qshift1 q_shift1
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


mux3_1 mux_subs1_inst
(
	.r(am_or_w),
	.d(aq_ls_w[(2*N)-1:N]),
	.m(aq_mux_w[2*N:N+1]),
	.sel(op_w),
	
	.out(subs1_w)
);

mux3_1 mux_subs2_inst
(
	.r(qor1_w),
	.d(regM_w),
	.m(regM_w),
	.sel(op_w),
	
	.out(subs2_w)
);


mux4_2 mux4_2_inst
(
	.a(q1_sh_w),
	.b(aq_reg_w[2*N:N+1]),//retroalimentacion de A
	.c(qor3_w),
	.d(subs1_w),
	.selector(done_w), //Si es la ultima corrida prende a 1
	
	.out1(q_mux1_w),
	.out2(q_mux2_w)

);


subtractor subs
(
	.a(subs1_w),
	.m(subs2_w),
	
	.s(a_subs_w)
);


q_exit q_exit_inst
(
	.QD({aq_ls_w[N-1:0], 1'b0}),
	.QM(aq_mux_w[N:0]),
	.QR1({q1_sh_w, 1'b0}),//Q leftshift 1 or 1
	.QR0({q_sh_w, 1'b0}),//Q leftshift 1
	.op(op_w),
	.msb_aq(msb_aq_w),
	
	
	.out(q_exit_w)

);


mux3_1 mux_add1_inst
(
	.m(subs1_w),
	.d(a_subs_w),
	.r(q_mux1_w),
	.sel(op_w),
	
	.out(add1_w)
);


mux3_1 mux_add2_inst
(
	.r(q_mux2_w),
	.d(regM_w),
	.m(regM_w),
	.sel(op_w),
	
	.out(add2_w)
);

adder add
(
	.a(add1_w),
	.m(add2_w),
	
	.s(a_add_w)
);

control_operation co_inst
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
	.start(start_w),
	.done(done_w)

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
	.done(done_w),
	.load(operating_w),	//Esta senal debe permanecer N ciclos arriba y cuando se desborde overflow
								//la senal que viene desde control unit baja y por lo tanto el registro se queda con el ultimo
								//valor registrado.
	.in(aq_out_w),
	.reg_in(aq_reg_w),
	.loaded(loaded_res_w)
);



`ifndef MODELSIM

mux_result result_inst
(
	.in(aq_reg_w[2*N:1]),
	.sel(op_w),
	
	.out(in_segments_w)
);


btd btd1 //algoritmo double dabble bin to dec
(
	.in_bits(in_segments_w),

	.out(out)
);


genvar i;
generate
	for(i=0; i<TAM; i=i+1'b1)
	begin : gen
		segments segment
		(
			  //inputs
			  .w(out[(i*4)+3]),
			  .x(out[(i*4)+2]),
			  .y(out[(i*4)+1]),
			  .z(out[(i*4)+0]),

			  //outputs
			  .a(seg[i][6]),
			  .b(seg[i][5]),
			  .c(seg[i][4]),
			  .d(seg[i][3]),
			  .e(seg[i][2]),
			  .f(seg[i][1]),
			  .g(seg[i][0])

		);
	end : gen
endgenerate

`endif

`ifdef MODELSIM
assign remainder = aq_reg_w[2*N:N+1];
assign result = aq_reg_w[N:1];
`endif

assign load_x = loaded_x_w;
assign load_y = loaded_y_w;
assign ready = done_w;

endmodule 
