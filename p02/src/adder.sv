/*********************************************************************************
* Module Name: adder

* Description: adder operation

* Inputs: a, m

* Outputs: s

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

module adder
#(
	parameter N = 4
)(
	/** Input ports **/
	input [N-1:0] a,
	input [N-1:0] m,
	
	/** Output ports **/
	output [N-1:0] s
);

	/** math operation **/
	assign s = a + m;

		
endmodule
