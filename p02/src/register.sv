/*********************************************************************************
* Module Name: register

* Description: this module load input values 

* Inputs: clk, rst, load, in,

* Outputs: 	reg_in, loaded

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/04/2019

* Project Name: P01

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module register
#(
	parameter N = 4
)(
	/** Input ports **/
	input clk,
	input rst,
	input load,
	input done,
	input [N-1:0] in,
	
	/** Output ports **/
	output logic [N-1:0] reg_in,
	output logic loaded
);



always_ff@(posedge clk, negedge rst)
begin: register

	if(~rst)
	begin
		/** Clean registers **/
		reg_in <= '0;
		loaded <= '0; 
	end
	
	else
	begin

		if(load)
		begin
			reg_in <= in;
			loaded <= 1'b1; 
		end
		else if(done)
		begin
			reg_in <= reg_in;
			loaded <= 1'b0;
		end
		else
		begin
			reg_in <= reg_in;
		end

	end

end: register

endmodule
