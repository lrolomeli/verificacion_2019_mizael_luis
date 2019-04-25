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
(
	/** Input ports **/
	input wsizeN a,
	input wsizeN m,
	
	/** Output ports **/
	output wsizeN s
);

	/** math operation **/
	assign s = a + m;

		
endmodule
