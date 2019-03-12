/*********************************************************************************
* Module Name: control_unit.sv

* Description: Control Unit

* Inputs: clk, rst, start, l_s, done

* Outputs: init_FSM, enable

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

module control_unit 
(

	/** Input ports **/
	input clk,
	input rst,
	input [ONE:ZERO] current_state,
	
	/** Output ports **/
	output logic l_s,
	output logic permit

);

	always_ff@(posedge clk, negedge rst)
	begin 

		if(~rst)
		begin
			/** Clean outputs **/
			permit <= BIT_ZERO;
			l_s <= BIT_ZERO;
		end
		
		else
		begin 
			case(current_state)
				IDLE:
				begin
					permit <= BIT_ZERO;
				end
				
				LOAD:
				begin
					l_s <= BIT_ONE;
				end
				
				MULTIPLYING:
				begin
					l_s <= BIT_ZERO;
					permit <= BIT_ONE;
				end
				
				default:
				begin
					l_s <= BIT_ZERO;
					permit <= BIT_ZERO;
				end
			
			endcase
		end 
		
	end 

endmodule
