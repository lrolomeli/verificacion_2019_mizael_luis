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
(
	/** Input ports **/
	input wsizeN in,
	input wcountsize shift,
	
	/** Output ports **/
	output wsizeN out

);

	/** shift rigth  **/
	assign out = in >> shift;


endmodule
