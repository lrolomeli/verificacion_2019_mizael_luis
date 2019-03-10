module top_module
#(
	parameter DW_2 = 16,
	parameter DW = 8
)
(
	input clk,
	input rst,
	input start,
	input [DW-1:0] multiplier,
	input [DW-1:0] multiplicand,
	
	output sign,
	output logic [DW_2-1:0] product
);

logic start_w;
logic init_FSM_w;
logic done_w;
logic l_s_w;
logic complete_w;
logic permit_w;
logic charged_w;

logic [DW-1:0] rgstr1_w;
logic [DW_2-1:0] rgstr2_w;
logic [DW_2-1:0] shift_reg_w;
logic [DW_2-1:0] product_w;

debouncer db(

	.clk(clk),
	.rst(rst),
	.start(start),
	
	.db_out(start_w)	

);

control_unit cu(

	.clk(clk),
	.rst(rst),
	.start(start_w),
	.complete(complete_w),

	.permit(permit_w),
	.init_FSM(init_FSM_w)

);

FSM sm(
	
	.clk(clk),
	.rst(rst),
	.init_FSM(init_FSM_w),
	.done(done_w),

	.l_s(l_s_w),
	.complete(complete_w)
	
);

load ld(

	.clk(clk),
	.rst(rst),
	.l_s(l_s_w),
	.multiplier(multiplier),
	.multiplicand(multiplicand),
	
	.charged(charged_w),
	.rgstr1(rgstr1_w),
	.rgstr2(rgstr2_w)
	
);

sweep_sequential_adder sa(

	.clk(clk),
	.rst(rst),
	.l_s(charged_w),
	.init_FSM(init_FSM_w),
	.rgstr1(rgstr1_w),
	.rgstr2(shift_reg_w),
	.permit(permit_w),
	
	.done(done_w),
	.product(product_w)

);

left_shift ls(

	.clk(clk),
	.rst(rst),
	.l_s(charged_w),
	.permit(permit_w),
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
