/*********************************************************************************
* Module Name: separator

* Description: 

* Inputs:	shifted_in

* Outputs:	dec_out

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
import Pkg_Global::*;

module separator
(
	input [LENGTH-1:0] shifted_in,
	output [LENGTH-1:0] dec_out

);

	//lo que sea que entre aqui debes mandarlo a comparer
	// y se debe mandar en multiplos de 4
	// si la entrada es de 8 bits por ejemplo
	//entonces debes mandar 3 multiplos de 4
	
	genvar i;
	
	generate
	for(i=0; i<TAM; i=i+1'b1)
	begin : gen
		comparer cmp
		(
			.in(shifted_in[((i+1'b1)*DEC_4)-1'b1:i*DEC_4]),
			.out(dec_out[((i+1'b1)*DEC_4)-1'b1:i*DEC_4])
		);
		
	end : gen
	
	endgenerate
	


endmodule
