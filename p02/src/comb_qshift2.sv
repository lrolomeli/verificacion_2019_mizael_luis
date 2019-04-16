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
#(
	parameter N = 4
)(
	/** Inputs Ports **/
	input [N-1:0] Q,
	
	/** Inputs Ports **/
	output [N-1:0] qor1,
	output [N-1:0] qor3

);

	assign qor1 = (Q << 2'b10) | 2'b01;
	assign qor3 = (Q << 2'b10) | 2'b11;

endmodule
