/*********************************************************************************
* Module Name: mux2_1

* Description: multiplexor 

* Inputs:	a, b, selector,

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

module mux2_1
#(
	parameter N = 4
)(
	/** Input ports **/
	input [N-1:0] a,
	input [N-1:0] b,
	input selector,
	
	/** Output ports **/
	output logic [N-1:0]out

);
	/** Out to module **/
	assign out = (selector) ? b : a;

	
endmodule 