/*********************************************************************************
* Module Name: or_m

* Description: mask or between inputs 

* Inputs:	a, b

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

module or_m
#(
	parameter N = 4
)
(
	/** Input ports **/
	input [N-1:0] a,
	input [N-1:0] b,
	
	/** Output ports **/
	output [N-1:0] out

);
	
	/** mask between inputs **/
	assign out = a | b;

endmodule
