/*********************************************************************************
* Module Name: mux3_1

* Description: multiplexor 

* Inputs:	m, d, r, sel
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

module mux3_1
#(
	parameter N = 4
)(
	/** Input ports **/
	input [N-1:0] m,
	input [N-1:0] d,
	input [N-1:0] r,
	input [1:0]sel,
	
	/** Output ports **/
	output logic [N-1:0]out

);

always_comb
begin
	case(sel)
		2'b00:out = m;
		2'b01:out = d;
		2'b10:out = r;
		default: out = 0;
	endcase
end


	
endmodule 
