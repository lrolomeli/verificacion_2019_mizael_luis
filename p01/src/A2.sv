/*********************************************************************************
* Module Name: a2.sv

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

module a2
(
	/** Input ports **/
	input multiplier_msb,
	input multiplicand_msb,
	input [DW_2-ONE : ZERO]product,
	
	/** Input ports **/
	output logic sign,
	output logic [DW_2-ONE:ZERO] result
);

	always_comb 
	begin
		/** Use an XOR logic gate to check the sign  **/
		if (multiplier_msb ^ multiplicand_msb)
		begin
			/** Put on A2 complement **/
			result = ~(product [DW_2-TWO:ZERO]) - ONE;
			sign = multiplier_msb ^ multiplicand_msb;
		end
		else 
		begin
			/** Normal result **/
			result = product [DW_2-TWO:ZERO];
			sign = multiplier_msb ^ multiplicand_msb;
		end
			
	end

endmodule
