/*********************************************************************************
* Module Name: Load.sv

* Description: Load data to diferents registers  

* Inputs: clk, rst, l_s, [N-1:0] in

* Outputs: [N-1:0] reg_in,

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

module mix_regs
#(
	parameter N = 4
)(
	input [N-1:0] Q,
//	input [1:0] op,
	output logic [2*N:0] mix_reg
);


assign mix_reg = {4'b0000, Q, 1'b0};
//always_comb
//begin
//	case(op)
//		2'b00 : mix_reg = {4'b0000, Q, 1'b0};	//MULTIPLICATION
//		2'b01 : mix_reg = {5'b00000, Q};			//DIVISION
//		2'b10 : mix_reg = {5'b00000, Q};			//SQUARE ROOT
//		default : mix_reg = '0;
//	endcase
//end

endmodule
