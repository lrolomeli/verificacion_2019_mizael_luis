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
import Pkg_Global::*;

module complemento_a2_in(

	input [DW-ONE:ZERO] in,
	
	output logic [DW-ONE:ZERO] out
	

);

always_comb
begin
	//Si el bit mas significativo de la entrada es 1
	if(in[DW-ONE])
	begin
		//aplica complemento a2
		out = ~(in) + BIT_ONE;
	end
	else
	begin
		out = in;
	end
	
end


endmodule
