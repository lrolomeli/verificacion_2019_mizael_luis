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
	input init_FSM,
	input done,
	
	/** Input ports **/
	output logic l_s,
	output logic complete
	
);


	always_ff@(posedge clk, negedge rst)
	begin

		if(~rst)
		begin
			/** Init FSM **/
			l_s <= BIT_ZERO;
			state <= IDLE;
			complete <= BIT_ZERO;
		end
		
		else
		begin
			case(state)
				IDLE :
				begin
					if(init_FSM)
					/** Init idle state **/
					begin
						//Vamos a estar en este estado mientras la
						//senal de start sea igual a cero
						state <= LOAD;
						l_s <= BIT_ONE;
					end
				end
				
				LOAD :
				/** Init load state **/
				begin
					//Cargamos los datos a los registros con datos
					//cmabiamos a estado multiplicar
					l_s <= BIT_ZERO;
					state <= MULTIPLYING;
				end
				
				MULTIPLYING :
				/** Init load state **/
				begin 
					//Si ya termino de multiplicar debe
					//enviar una senal de done
					if(done)
					begin
						state <= IDLE;
						//Tienes que indicarle al control unit que mantenga el resultado
						complete <= BIT_ONE;
						//y en caso de volver a recibir un start hay que limpiar antes el resultado
					end

				end
				
				
				default: 
				begin 
					l_s <= BIT_ZERO;
					state <= IDLE;
					complete <= BIT_ZERO;
				end
			
			endcase
		
		end
			
	end

endmodule
