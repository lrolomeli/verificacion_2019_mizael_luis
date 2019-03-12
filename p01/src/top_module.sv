/*********************************************************************************
* Module Name: top_module.sv

* Description: top module

* Inputs: clk, rst, start, multiplier, multiplicand

* Outputs: sign, product

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
	/** Input ports **/
	input clk,
	input rst,
	input start,
	input [DW-ONE:ZERO] multiplier,
	input [DW-ONE:ZERO] multiplicand,
	
	/** Output ports **/
	output sign,
	output logic [DW_2-ONE:ZERO] product
);

logic start_w;
logic init_FSM_w;
logic done_w;
logic l_s_w;
logic complete_w;
logic permit_w;
logic charged_w;

logic [DW-ONE:ZERO] multiplier_w;
logic [DW-ONE:ZERO] multiplicand_w;

logic [DW-ONE:ZERO] rgstr1_w;
logic [DW_2-ONE:ZERO] rgstr2_w;
logic [DW_2-ONE:ZERO] shift_reg_w;
logic [DW_2-ONE:ZERO] product_w;

/** Create module debounce **/
debouncer db(

	.clk(clk),
	.rst(rst),
	.start(start),
	
	.db_out(start_w)	

);

/** Create module Control Unit **/
control_unit cu(

	.clk(clk),
	.rst(rst),
	.start(start_w),
	.complete(complete_w),

	.permit(permit_w),
	.init_FSM(init_FSM_w)

);

/** Create module FSM **/
FSM sm(

	.clk(clk),
	.rst(rst),
	.init_FSM(init_FSM_w),
	.done(done_w),

	.l_s(l_s_w),
	.complete(complete_w)
	
);

complemento_a2_in multiplier_a2
(
	.in(multiplier),
	.out(multiplier_w)
);

complemento_a2_in multiplicand_a2
(
	.in(multiplicand),
	.out(multiplicand_w)

);


/** Create module load **/
load ld(
	
	.clk(clk),
	.rst(rst),
	.l_s(l_s_w),
	.multiplier(multiplier_w),
	.multiplicand(multiplicand_w),
	
	.charged(charged_w),
	.rgstr1(rgstr1_w),
	.rgstr2(rgstr2_w)
	
);

/** Create module secuencial adder **/
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

/** Create module left shift **/
left_shift ls(

	.clk(clk),
	.rst(rst),
	.l_s(charged_w),
	.permit(permit_w),
	.rgstr2(rgstr2_w),
	
	.shift_out(shift_reg_w)

);

/** Create module A2 **/
complemento_a2 a(

	.multiplier_msb(multiplier[DW-1]),
	.multiplicand_msb(multiplicand[DW-1]),
	.product(product_w),
	
	.sign(sign),
	.result(product)

);

endmodule
