/*********************************************************************************
* Module Name: statemachine

* Description: state machine

* Inputs:		clk, rst, start, load, loaded_x, loaded_y, done,

* Outputs:		sel, go, stop

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  13/04/2019

* Project Name: P02

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module statemachine
(
	/** Input ports **/
	input clk,
	input rst,
	input start,
	input load,
	input loaded_x,
	input loaded_y,
	input done,
	
	/** Output ports **/
	output logic sel,
	output logic go,
	output logic stop
);



always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
	begin
		state <= IDLE;
	end
	
	else
	begin	//** Idle state**//
			case(state)
				IDLE :
				begin
					if(start)
						state <= PROCESSING;
					else
						state <= IDLE;
				end
				
				//** Processing state: in this state the operation select is started**//
				PROCESSING :
				begin
					if(done)
						state <= IDLE;
					else
						state <= PROCESSING;
				end		
				
				//** Default state **//
				default: state <= IDLE;
				
			endcase
	
	end

end


assign sel  = loaded_x;
assign stop = done;
assign go = start;

endmodule
