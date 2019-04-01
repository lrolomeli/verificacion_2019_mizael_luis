module top_module
#(
	parameter N = 4
)(
	input clk,
	input rst,
	input l_s,
	input [N-1:0] q,
	input [N-1:0] m,
	
	output [2*N:0]product
);


wire [N-1:0] m_w;
wire [N-1:0] m_a2_w;
wire [N-1:0] a_out_w;

wire [2*N:0] aq_w;
wire [2*N:0] aq_reg_w;
wire [2*N:0] shift_out_w;

reg_aq aq_rgstr
(
	.q(q),
	
	.aq_reg(aq_reg_w)
);




mux2_1
#(
	.N((2*N)+1'b1)
)
 mux_n2
(
	.clk(clk),
	.rst(rst),
	.a(shift_out_w),
	.b(aq_reg_w),
	.selector(l_s),
	
	.out(aq_w)

);


a2_complement 
#(
	.N(N)
)
a2_m
(
	.in(m),
	.out(m_a2_w)
);
	
mux3_1 mux_m3
(
	.m_a2(m_a2_w),
	.m(m),
	.selector(aq_w[1:0]),
	
	.mux_out(m_w)
);

adder adder1
(
	.a(aq_w[2*N:N+1]),
	.m(m_w),

	.s(a_out_w)
);

signed_shift shift
(
	.in({a_out_w,aq_w[N:0]}),
	.out(shift_out_w)

);


product product1(

	.clk(clk),
	.rst(rst),
	.a_q(shift_out_w),
	
	.product(product)

);

endmodule 