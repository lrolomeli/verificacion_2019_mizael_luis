module top
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
	output logic [DW_2-1:0] product
);

logic start_W;

debouncer db(

	.clk(clk),
	.rst(rst),
	.start(start),
	
	.db_out(start_w)	

);

MS ms(

	.clk(clk),
	.rst(rst),
	.start(start_w),
	.l_s(l_s),
	.multiplier(multiplier),
	.multiplicand(multiplicand),
	
	.done(done),
	.product(product)

);

endmodule
