/*********************************************************************************
* Module Name: FSM.sv

* Description: FSM to description hardwere   

* Inputs: clk, rst, start, enable,

* Outputs: l_s, done

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

module FSM
(
	/** Input ports **/
	input clk,
	input rst,
	input start,
	input l_s,
	input done,
	
	output logic idle,
	output logic load,
	output logic ready
	
);

STATE state;

	always_ff@(posedge clk, negedge rst)
	begin

		if(~rst)
		begin
			/** Init FSM **/
			state <= IDLE;
		end
		
		else
		begin
			case(state)
				IDLE :
				begin
					
					if(start)
					/** Init idle state **/
					begin
						//Vamos a estar en este estado mientras la
						//senal de start sea igual a cero
						state <= LOAD;
					end
					else
					begin
						state <= IDLE;
					end

				end
				
				LOAD :
				/** Init load state **/
				begin
					//datos cargados
					if(l_s)
					begin
						state <= MULTIPLYING;
					end
					else
					begin
						state <= LOAD;
					end
				end
				
				MULTIPLYING :
				/** Init load state **/
				begin 
					//Si ya termino de multiplicar debe
					//enviar una senal de done
					if(done)
					begin
						state <= IDLE;
					end
					else
					begin
						state <= MULTIPLYING;
					end

				end		
				
				default: 
				begin 
					state <= IDLE;

				end
			
			endcase
		
		end
			
	end
	
	
	
	always_comb
	begin
		idle <= BIT_ZERO;
		load <= BIT_ZERO;
		ready <= BIT_ZERO;
		
		case(state)
			IDLE :
			begin
				idle <= BIT_ONE;
				load <= BIT_ZERO;
				ready <= BIT_ZERO;
			end
			
			LOAD :
			/** Init load state **/
			begin
				idle <= BIT_ZERO;
				load <= BIT_ONE;
				ready <= BIT_ZERO;
			end
			
			MULTIPLYING :
			begin
				idle <= BIT_ZERO;
				load <= BIT_ZERO;
				ready <= BIT_ONE;
			end		
			
			default: 
			begin 
				idle <= BIT_ZERO;
				load <= BIT_ZERO;
				ready <= BIT_ONE;
			end
		
		endcase
		
			
	end

endmodule
