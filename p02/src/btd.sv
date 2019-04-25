/*********************************************************************************
* Module Name: btd

* Description: 

* Inputs:	in_bits,

* Outputs:	out

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

module btd
(	/** Input ports **/
	input wsizeN in_bits,
	
	/** Input ports **/
	output buses out
);


buses [N-1:0] shifted_bits; 
buses [N:0] outs;

assign outs[0] = '0;

genvar i;

generate
	for(i=0; i<N; i=i+1'b1)
	begin : gen
		shifting sh
		(
			.bin(in_bits[(N-1'b1)-i]),
			.ins(outs[i]),
			.shifted_out(shifted_bits[i])
		);
		
		separator spr
		(
			.shifted_in(shifted_bits[i]),
			.dec_out(outs[i+1'b1])
		);
	end : gen

endgenerate

assign out = shifted_bits[N-1];

endmodule
