module multiplication
#(
	parameter N = 4
)(
	input clk,
	input rst,
	input l_s,
	input [N:0] q,
	input [N-1:0] m,
	
	output [(2*N)-1:0]product
);


wire [1:0] mux_adder_f_w;
wire [N-1:0] a_w;
wire [N-1:0] m_w;
wire [N-1:0] m_a2_w;
wire [N-1:0] a_out_w;
wire [N:0] q_out_w;
wire [2*N:0] shift_out_w;
wire [N:0] q_w;


conditionals c1(
	.q(q_out_w),
	.mux_adder_f(mux_adder_f_w)

);

a2_complement a2_m(

	.in(m),
	.out(m_a2_w)
);
	
mux3_1 mux_m3(

	.m_a2(m_a2_w),
	.m(m),
	.mux_adder_f(mux_adder_f_w),
	
	.mux_out(m_w)
);


adder adder1
(

	.a(a_w),
	.m(m_w),

	.s(a_out_w)
);

mux2_1 mux_m2
(

	.a(q),
	.b(q_w),
	.selector(l_s),
	
	.out(q_out_w)

);

signed_shift shift
(

	.in({a_out_w, q_out_w}),
	.out(shift_out_w)

);

product product1(

	.clk(clk),
	.rst(rst),
	.a_q(shift_out_w),
	
	.a_out(a_w),
	.q_out(q_w),
	.product(product)

);

endmodule 