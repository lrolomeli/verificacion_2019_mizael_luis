/*********************************************************************************
* Module Name: couter

* Description: this module is a counter

* Inputs:	clk, rst, load,

* Outputs:	ov_counter, able

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  09/04/2019

* Project Name: P01

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module counter
#(
	parameter N = 4,
	parameter C = $clog2(2*N)
)(
	/** Input ports **/
	input clk,
	input rst,
	input load,
	
	/** Output ports **/
	output logic ov_counter,
	output logic able
);

logic [C:0] count;


always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
	begin
		/** Clean registers **/
		count <= '0;
		ov_counter <= '0;
		able <= '0;
	end
	
	else
	begin
		if(load)
		begin
			/** load teh values to register **/
			count <= '0;
			ov_counter <= '0;
			able <= 1'b1;
		end
		
		else if(able)
		begin
			if(count==N-1)
			begin
				/** the count is over **/
				ov_counter <= 1'b1;
				able <= '0;
			end
			else
			begin
				/** the count increase **/
				count <= count + 1'b1;
			end
		end
		
	end

end

endmodule
