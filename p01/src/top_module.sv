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
	output logic sign,
	output logic [DW_2-ONE:ZERO] product
);

logic done_w;
logic l_s_w;
logic permit_w;
logic charged_w;
logic idle_w;
logic load_w;
logic ready_w;

logic [ONE:ZERO] current_state_w;

logic [DW-ONE:ZERO] multiplier_w;
logic [DW-ONE:ZERO] multiplicand_w;
logic [DW-ONE:ZERO] rgstr1_w;

logic [DW_2-ONE:ZERO] rgstr2_w;
logic [DW_2-ONE:ZERO] shift_reg_w;
logic [DW_2-ONE:ZERO] product_w;

/** Create module Control Unit **/
control_unit cu(

	.idle(idle_w),
	.load(load_w),
	.ready(ready_w),
	
	.l_s(l_s_w),
	.permit(permit_w)
	
);

/** Create module FSM **/
FSM sm(

	.clk(clk),
	.rst(rst),
	.start(start),
	.l_s(charged_w),
	.done(done_w),

	.idle(idle_w),
	.load(load_w),
	.ready(ready_w)
	
	
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
	.permit(permit_w),
	.rgstr2(rgstr2_w),
	
	.shift_out(shift_reg_w)

);

/** Create module A2 **/
complemento_a2 a(

	.multiplier_msb(multiplier[DW-1]),
	.multiplicand_msb(multiplicand[DW-1]),
	.product(product_w),
	.permit(permit_w),
	.rst(rst),
	.clk(clk),
	
	.sign(sign),
	.result(product)

);	


endmodule
