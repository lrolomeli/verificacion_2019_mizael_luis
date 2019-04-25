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
(
	/** Input ports **/
	input wsizeN a,
	input wsizeN b,
	input wsizeN c,
	input wsizeN d,
	input selector,
	
	/** Output ports **/
	output wsizeN out1,
	output wsizeN out2

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
