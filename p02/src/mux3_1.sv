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
(
	/** Input ports **/
	input wsizeN m,
	input wsizeN d,
	input wsizeN r,
	input twobits sel,
	
	/** Output ports **/
	output wsizeN out

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
