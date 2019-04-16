/*********************************************************************************
* Module Name: mux4_2

* Description: multiplexor 

* Inputs:	a, b, c, d, selector,

* Outputs:	out1, out2

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

module mux4_2
#(
	parameter N = 4
)(
	/** Input ports **/
	input [N-1:0] a,
	input [N-1:0] b,
	input [N-1:0] c,
	input [N-1:0] d,
	input selector,
	
	/** Output ports **/
	output logic [N-1:0]out1,
	output logic [N-1:0]out2

);

always_comb
begin
	if(selector)
	begin
		out1 = a;/** the first out **/
		out2 = b;/** the second out **/
	end
	
	else
	begin
		out1= c;
		out2= d;
	end

end


	
endmodule 
