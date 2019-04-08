module top_md
#(
	parameter N = 4
)(
	input clk,
	input rst,
	input load,
	input op,
	input clear,
	input [N-1:0] Q,
	input [N-1:0] M,
	
	output [2*N:0]product
);



logic clear_w;
logic op_w;

assign op_w = op;
assign clear_w = clear;

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


register rQ
(
	.clk(clk),
	.rst(rst),
	.clear(clear_w),
	.in(Q),
	
	.reg_in(regQ_w)
);

register rM
(
	.clk(clk),
	.rst(rst),
	.clear(clear_w),
	.in(M),
	
	.reg_in(regM_w)
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
	.a(aq_reg_w),
	.b(aq_w),
	.selector(load),
	
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
	.clear(clear_w),
	.in(aq_out_w),
	
	.reg_in(aq_reg_w)
);

assign product = aq_reg_w;


endmodule 