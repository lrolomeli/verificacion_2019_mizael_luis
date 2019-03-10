/*********************************************************************************
* Module Name: left_shift.sv

* Description: left shift register 

* Inputs: clk, l_s, rst, rgstr2

* Outputs: shift_out

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

module left_shift
(
/** Input ports **/
input clk,
input l_s,
input rst,
input [DW_2-ONE:ZERO] rgstr2,

/** Output ports **/
output logic [DW_2-ONE:ZERO] shift_out
);


	always_ff@(posedge clk, negedge rst)
	begin 

		if(~rst)
		begin
			shift_out <= ZERO;	/** Clean out register **/
		end	
		
		else
		begin 
			if(l_s)
			begin
				shift_out <= rgstr2; /** Load value to register **/
			end
			else
			begin
				shift_out <= {shift_out[DW_2-TWO:ZERO], ZERO};	/** Shift apply **/
			end
			
		end 
		
	end 

endmodule 
