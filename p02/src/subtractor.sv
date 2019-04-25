/*********************************************************************************
* Module Name: subtractor

* Description: is a subtractor 

* Inputs: a, m

* Outputs: s

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  13/04/2019

* Project Name: P02

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module subtractor
(
	/** Input ports **/
	input wsizeN a,
	input wsizeN m,

	/** output ports **/
	output wsizeN s
);

	//** math operation **//
	assign s = a - m;

		
endmodule
