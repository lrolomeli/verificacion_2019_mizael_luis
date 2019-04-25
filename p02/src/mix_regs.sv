/*********************************************************************************
* Module Name: mix_regs

* Description: the module register the values to multiplication and division operation  

* Inputs: Q

* Outputs: mix_reg

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

module mix_regs
(
	/** Input ports **/
	input wsizeN Q,
	input op,
	
	/** Output ports **/
	output waqsize mix_reg
);

/** out to module **/
assign mix_reg = (op) ? '0 : {4'b0000, Q, 1'b0};


endmodule
