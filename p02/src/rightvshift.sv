/*********************************************************************************
* Module Name: rightvshift

* Description: rightvshift 

* Inputs:	in, shift

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

module rightvshift
#(
	parameter N = 4,
	parameter C = $clog2(2*N)
)(
	/** Input ports **/
	input [N-1:0] in,
	input [C:0] shift,
	
	/** Output ports **/
	output [N-1:0] out

);

	/** shift rigth  **/
	assign out = in >> shift;


endmodule
