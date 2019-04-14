/*********************************************************************************
* Module Name: left_shift

* Description: left_shift

* Inputs: in

* Outputs: out

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

module left_shift
#(
	parameter N = 4,
	parameter shift
)(
	/** Input ports **/
	input [N-1:0] in,
	
	/** Input ports **/
	output [N-1:0] out

);


	/** shift **/
	assign out = in << shift;


endmodule
