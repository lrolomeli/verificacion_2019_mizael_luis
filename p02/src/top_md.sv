module top_md
#(
	parameter N = 4
)(
	input clk,
	input rst,
	input load,
	input op,
	input start,
	input [N-1:0] data,
	
	output [N-1:0]result,
	output [N-1:0]remainder
);


logic op_w;

logic load_x_w;
logic load_y_w;
logic loaded_x_w;
logic loaded_y_w;
logic loaded_res_w;

logic operating_w;
logic go_w;
logic done_w;
logic stop_w;

logic [N-1:0] regQ_w;
logic [N-1:0] regM_w;
logic [2*N:0] aq_w;

logic [2*N:0] aq_op_w;
logic [(2*N)-1:0] aq_ls_w;

logic [N-1:0] a_w;
logic [N-1:0] a_p_w;
logic [N-1:0] a_subs_w;
logic [N-1:0] a_add_w;

logic [N:0] q_w;
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
	.load(load_x_w),
	.in(data),
	
	.reg_in(regQ_w),
	.loaded(loaded_x_w)
);

register rM
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
	.mix_reg(aq_w)
);

mux2_1 
#(
	.N((2*N)+1)
)
in_mux
(
	.a(aq_w),
	.b(aq_reg_w),
	.selector(loaded_res_w),
	
	.out(aq_op_w)
);

left_shift
#(
	.N(2*N),
	.shift(1)
)
ls
(
	.in(aq_op_w[2*N:1]),
	
	.out(aq_ls_w)
);


mux2_1 
#(
	.N(N)
)
subs_mux
(
	.a(aq_op_w[2*N:N+1]),	//if N = 4 then AQ[8:5] since Q goes from [4:0]
	.b(aq_ls_w[(2*N)-1:N]),
	.selector(op_w),
	
	.out(a_w)
);

subtractor
#(
	.N(N)
)
subs
(
	.a(a_w),
	.m(regM_w),
	
	.s(a_subs_w)
);

mux2_1 
#(
	.N(N)
)
adder_mux
(
	.a(a_w),
	.b(a_subs_w),
	.selector(op_w),
	
	.out(a_p_w)
);

adder
#(
	.N(N)
)
add
(
	.a(a_p_w),
	.m(regM_w),
	
	.s(a_add_w)
);

mux2_1 
#(
	.N(N+1)
)
q_mux
(
	.a(aq_op_w[N:0]),
	.b(aq_ls_w[N:0]),
	.selector(op_w),
	
	.out(q_w)
);

conditions co1
(
	.a_plus_m(a_add_w),
	.a_minus_m(a_subs_w),
	.a(a_w),
	.q(q_w),
	.op(op_w),
	.a_sign(a_subs_w[N-1]),
	.Q0(q_w[0]),
	.Q1(q_w[1]),
	
	.aq_out(aq_out_w)
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

counter count
(
	.clk(clk),
	.rst(rst),
	.load(go_w),
	
	.ov_counter(done_w),
	.able(operating_w)
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
	.go(go_w),
	.stop(stop_w)

);

assign result = aq_reg_w[2*N:N+1];
assign remainder = aq_reg_w[N:1];




endmodule 