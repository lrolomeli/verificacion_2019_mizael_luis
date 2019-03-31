/*********************************************************************************
* Module Name: complemento_a2.sv

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

module a2_complement
#(
	parameter N = 4
)(

	input [N-1:0] in,
	
	output [N-1:0] out
	

);


assign out = ~(in) + 1'b1;


endmodule
