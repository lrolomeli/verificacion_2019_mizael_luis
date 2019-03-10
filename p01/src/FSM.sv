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
input clk,
input rst,
input start,
input enable,

output logic l_s,
output logic done
);

	always_ff@(posedge clk, negedge rst)
	begin: always_MS

		if(~rst)
		begin
			l_s <= ZERO;
			enable_out <= ZERO;
			state <= ZERO;
		end
		
		else
		begin
			case(state)
			IDLE :
			begin
				//Vamos a estar en este estado mientras la
				//senal de start sea igual a cero
				if(start)
				begin
					l_s < = ONE;
					state <= LOAD;
				end
				l_s < = ZERO;
				state <= state;
				
			end
			
			LOAD :
			begin 
				if(enable)
				begin
					state <= MULTIPLYING;
				end
				state <= state;

			end
			
			MULTIPLYING :
			begin 
				//Si ya termino de multiplicar debe
				//enviar una senal de done
				
				/**Multiplicando*/
				/**Ya acabe = done*/
				done <= ONE;
			end
			
			
			default: 
			begin 
				l_s <= ZERO;
				state <= ZERO;
				done <= ZERO;
			end
			
	end: always_MS

endmodule

