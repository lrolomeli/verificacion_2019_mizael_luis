/*********************************************************************************
* Module Name: Top Module.sv

* Description: Put on A2 complement number received 

* Inputs: multiplier_msb, multiplicand_msb, [DW_2-1 : 0]product

* Outputs: sign, [DW_2-1:0] result

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  09/04/2019

* Project Name: P01

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module top_module
(
	input clk,
	input rst,
	input start,
	input l_s,
	input [DW-ONE:ZERO] multiplier,
	input [DW-ONE:ZERO] multiplicand,
	
	output logic done,
	output sign,
	output logic [DW_2-ONE:ZERO] product
);

logic start_w;
logic done_w;

logic l_s_w;

logic [DW-ONE:ZERO] rgstr1_w;
logic [DW_2-ONE:ZERO] rgstr2_w;
logic [DW_2-ONE:ZERO] shift_reg_w;
logic [DW_2-ONE:ZERO] product_w;

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
	.l_s(),
	.done(),

	.init_FSM(),
	.enable()
	

);

FSM sm(
	
	.clk(clk),
	.rst(rst),
	.start(start),
	.enable(ebable),

	.l_s(l_s),
	.done(done)
	
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
	
	.done(done_w),
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
