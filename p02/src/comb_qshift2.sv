/*********************************************************************************
* Module Name: comb_qshift2

* Description:  

* Inputs:	Q

* Outputs:	qor1, qor3

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

module comb_qshift2
(
	/** Inputs Ports **/
	input wsizeN Q,
	
	/** Inputs Ports **/
	output wsizeN qor1,
	output wsizeN qor3

);

	assign qor1 = (Q << 2'b10) | 2'b01;
	assign qor3 = (Q << 2'b10) | 2'b11;

endmodule
