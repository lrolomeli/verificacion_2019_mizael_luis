/*********************************************************************************
* Module Name: mix_regs

* Description: the module register the values to multiplication and division operation  

* Inputs: Q

* Outputs: mix_reg

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/04/2019

* Project Name: P02

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
	/** Input ports **/
	input [N-1:0] Q,
//	input [1:0] op,
	
	/** Output ports **/
	output logic [2*N:0] mix_reg
);

/** out to module **/
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
