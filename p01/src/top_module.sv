module top_module
#(
	parameter DW_2 = 16,
	parameter DW = 8
)
(
	input clk,
	input rst,
	input start,
	input l_s,
	input [DW-1:0] multiplier,
	input [DW-1:0] multiplicand,
	
	output logic done,
	output sign,
	output logic [DW_2-1:0] product
);

logic start_W;
logic done_w;
logic [DW-1:0] rgstr1_W;
logic [DW_2-1:0] rgstr2_W;
logic [DW_2-1:0] shift_reg_w;
logic [DW_2-1:0] product_w;

debouncer db(

	.clk(clk),
	.rst(rst),
	.start(start),
	
	.db_out(start_w)	

);

load ld(

	.clk(clk),
	.rst(rst),
	.l_s(l_s/*start_w*/),
	.multiplier(multiplier),
	.multiplicand(multiplicand),
	
	.rgstr1(rgstr1_w),
	.rgstr2(rgstr2_w)
	
);

sweep_sequential_adder sa(

	.clk(clk),
	.rst(rst),
	.l_s(l_s),
	.rgstr1(rgstr1_w),
	.rgstr2(shift_reg_w),
	
	.done(0),
	.product(product_w)

);

left_shift ls(

	.clk(clk),
	.rst(rst),
	.l_s(l_s),
	.rgstr2(rgstr2_w),
	
	.shift_out(shift_reg_w)

);

a2 a(

	.multiplier_msb(multiplier[DW-1]),
	.multiplicand_msb(multiplicand[DW-1]),
	.product(product_w),
	
	.sign(sign),
	.result(product)

);

endmodule
