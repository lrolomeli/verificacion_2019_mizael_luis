/*********************************************************************************
* Module Name: comb_qshift2

* Description:  

* Inputs:	Q

* Outputs:	q1, q

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

module comb_qshift1
(
	/** Input ports **/
	input wsizeN Q,
	
	/** Output ports **/
	output wsizeN q,
	output wsizeN q1

);

	assign q = Q << 1'b1;
	assign q1 = (Q << 1'b1) | 1'b1;

endmodule
