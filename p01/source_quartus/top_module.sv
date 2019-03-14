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
	output [6:0] units,
	output [6:0] tens,
	output [6:0] hundreds,
	output logic [DW_2-ONE:ZERO] product
);

logic start_w;
logic done_w;
logic l_s_w;
logic permit_w;
logic charged_w;
logic clk_w;

logic [ONE:ZERO] current_state_w;

logic [DW-ONE:ZERO] multiplier_w;
logic [DW-ONE:ZERO] multiplicand_w;
logic [DW-ONE:ZERO] rgstr1_w;

logic [DW_2-ONE:ZERO] rgstr2_w;
logic [DW_2-ONE:ZERO] shift_reg_w;
logic [DW_2-ONE:ZERO] product_w;
logic [DW_2-ONE:ZERO] result_w;

wire [3:0] units_w;
wire [3:0] tens_w;
wire [3:0] hundreds_w;

pll_50M_10k pll_clk(
	.inclk0(clk),
	
	.c0(clk_w)
);

/** Create module debounce **/
debouncer db(

	.clk(clk_w),
	.rst(rst),
	.start(start),
	
	.db_out(start_w)	

);

/** Create module Control Unit **/
control_unit cu(

	.clk(clk_w),
	.rst(rst),
	.current_state(current_state_w),
	
	.l_s(l_s_w),
	.permit(permit_w)
	
);

/** Create module FSM **/
FSM sm(

	.clk(clk_w),
	.rst(rst),
	.start(start_w),
	.l_s(l_s_w),
	.done(done_w),

	.current_state(current_state_w)
	
	
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
	
	.clk(clk_w),
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

	.clk(clk_w),
	.rst(rst),
	.l_s(charged_w),
	.rgstr1(rgstr1_w),
	.rgstr2(shift_reg_w),
	.permit(permit_w),
	
	.done(done_w),
	.product(product_w)

);

/** Create module left shift **/
left_shift ls(

	.clk(clk_w),
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
	.permit(permit_w),
	.rst(rst),
	.clk(clk_w),
	
	.sign(sign),
	.result(product),
	.result_dec(result_w)

);


bin2dec b2d
(
	.bin(result_w),
	
	.bcd({hundreds_w,tens_w,units_w})
);

segments units_segment
(
     //inputs 
     .w(units_w[3]),
     .x(units_w[2]),
     .y(units_w[1]),
     .z(units_w[0]),
	  
	  //outputs 
     .a(units[0]),
     .b(units[1]),
     .c(units[2]),
     .d(units[3]),
     .e(units[4]),
     .f(units[5]),
     .g(units[6])
	 
);

segments tens_segment
(
	  //inputs 
     .w(tens_w[3]),
     .x(tens_w[2]),
     .y(tens_w[1]),
     .z(tens_w[0]),
	  
	  //outputs 
     .a(tens[0]),
     .b(tens[1]),
     .c(tens[2]),
     .d(tens[3]),
     .e(tens[4]),
     .f(tens[5]),
     .g(tens[6])
	 
);
	
segments hundreds_segment
(
     //inputs 
     .w(hundreds_w[3]),
     .x(hundreds_w[2]),  
     .y(hundreds_w[1]),
     .z(hundreds_w[0]),
	  
	  //outputs 
     .a(hundreds[0]),
     .b(hundreds[1]),
     .c(hundreds[2]),
     .d(hundreds[3]), 
     .e(hundreds[4]),
     .f(hundreds[5]),
     .g(hundreds[6])
	 
);	


endmodule
