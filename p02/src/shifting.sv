/*********************************************************************************
* Module Name: shifting

* Description: shifting 

* Inputs:	bin, ins

* Outputs:	shifted_out

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

module shifting
(
	/** Input ports **/
	input bin,
	input buses ins,
	
	/** Output ports **/
	output buses shifted_out

);

assign shifted_out = {ins[LENGTH-2:0], bin};


endmodule
