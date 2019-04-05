module top_module_div
#(
	parameter N = 4
)(
	input clk,
	input rst,
	input l_s,
	input [N-1:0] q,
	input [N-1:0] m,
	
	output logic [(2*N-1):0] product
);

wire [(2*N-1):0] aq_reg_w;
wire [(N-1):0] m_reg_w;
wire [(N-1):0] m_out_w;
wire [(2*N-1):0] aq_new_reg_w;
wire [(2*N-1):0] aq_shift_w;
wire [N-1:0] aq_sub_w;
wire [N-1:0] aq_adder_w;
wire [2*N-1:0] product_w;
wire [2*N-1:0] lsb_q;


reg_q reg_q1
(
    .clk(clk),
	 .rst(rst),
    .q(q),

    .aq_reg(aq_reg_w)
);

reg_m reg_m1
(
    .clk(clk),
    .rst(rst),
    .m(m),

    .m_reg(m_reg_w)
);

mux2_1 mux2_1_1
(
	.a(product_w),
	.b(aq_reg_w),
	.selector(l_s),
	
	.out(aq_new_reg_w)

);

shift_div shift_div1
(
	.in(aq_new_reg_w),
	.out(aq_shift_w)

);

substrac substrac1
(
	.a(aq_shift_w[7:4]),
	.b(m_reg_w),

	.r(aq_sub_w)
);

out_condicions out_condicions1
(
	.a({aq_sub_w,aq_shift_w[3:0]}),
	.selector(aq_sub_w[3]),
	
	.out(lsb_q)

);



mux2_1_4bits mux2_1_4bits_1
(
	.a(m_reg_w),
	.b(4'b0000),
	.selector(aq_sub_w[3]),
	
	.out(m_out_w)

);


adder adder1
(
	.a(lsb_q[7:4]),
	.b(m_out_w),

	.r(aq_adder_w)
);

product product1
(

	.clk(clk),
	.rst(rst),
	.a_q({aq_adder_w,lsb_q[3:0]}),
	
	.product(product_w)

);

assign product = product_w;

endmodule 