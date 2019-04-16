/*********************************************************************************
* Module Name: comparer

* Description:  

* Inputs:	in

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

module comparer
(
 /** Input ports **/
 input [DEC_4-1:0] in,
 
 /** Output ports **/
 output logic [DEC_4-1:0] out
 
);

assign out = (in > DEC_4) ? in + 2'd3 : in;


endmodule
