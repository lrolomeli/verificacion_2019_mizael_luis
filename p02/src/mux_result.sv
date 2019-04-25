/*********************************************************************************
* Module Name: mux_result

* Description: multiplexor 

* Inputs:	in, sel

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

module mux_result
(
	/** Input ports **/
	input wsize2N in,
	input twobits sel,
	
	/** Output ports **/
	output wsize2N out

);

always_comb
begin
	case(sel)
		2'b00:out = in;
		2'b01:out = {{N{1'b0}},in[N-1:0]};
		2'b10:out = {{N{1'b0}},in[N-1:0]};
		default: out = 0;
	endcase
end


	
endmodule 
