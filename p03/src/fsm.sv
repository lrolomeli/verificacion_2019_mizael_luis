/*********************************************************************************
* Module Name: FSM.sv

* Description: FSM to description hardwere   

* Inputs: 

* Outputs: 

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
import global_pkg::*;

module fsm
(
	/** Input ports **/
	input start,
	input load,
	input clk,
	input rst,
	input p1_done,//processor 1
	input p2_done,//processor 2
	input p3_done,//processor 3
	input p4_done,//processor 4
	
	
	output logic pop,
	
	output logic retro_p1,//processor 1
	output logic retro_p2,//processor 2
	output logic retro_p3,//processor 3
	output logic retro_p4,//processor 4
	
	output logic enable_p1,//processor 1
	output logic enable_p2,//processor 2
	output logic enable_p3,//processor 3
	output logic enable_p4,//processor 4
	
	output logic ov_counter,
	output uint2_t sel,
	
	output logic done
	
		
//	processors_if.client client1,
//	processors_if.client client2,
//	processors_if.client client3,
//	processors_if.client client4
	
);

STATE_e state;

logic flag_start;

counter_t count_row;//rows
counter_t count_col;//columns

always_ff@(posedge clk, negedge rst)
begin:statemachine

	if(~rst)
	begin
		/** Init FSM **/
		state <= IDLE;
		flag_start<='0;
	end
	
	else
	begin
		case(state)
			IDLE :
			begin
				
				if(start)
				/** Init idle state **/
				begin
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
				if(load)
				begin
					state <= MULTIPLYING;
					flag_start <= 1'b1;
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
					flag_start <= 1'b0;
				end

			end		
			
			default: 
			begin 
				state <= IDLE;
			end
		
		endcase
	
	end
		
end:statemachine

always_comb
begin
		case(state)
			IDLE :
			begin
				pop = '0;
				retro_p1 = '0;
				retro_p2 = '0;
				retro_p3 = '0;
				retro_p4 = '0;
				enable_p1 = '0;
				enable_p2 = '0;
				enable_p3 = '0;
				enable_p4 = '0;
				sel = '0;
			end
			
			LOAD :
			begin
				pop = '0;
				retro_p1 = '0;
				retro_p2 = '0;
				retro_p3 = '0;
				retro_p4 = '0;
				enable_p1 = '0;
				enable_p2 = '0;
				enable_p3 = '0;
				enable_p4 = '0;
				sel = '0;
			end
		
			MULTIPLYING :
			begin 
				pop = '0;
				retro_p1 = '0;
				retro_p2 = '0;
				retro_p3 = '0;
				retro_p4 = '0;
				enable_p1 = '0;
				enable_p2 = '0;
				enable_p3 = '0;
				enable_p4 = '0;
				sel = '0;
				
				if(p4_done||flag_start)
				begin
						
					enable_p1 = 1'b1;//HABILITAMOS EL SIGUIENTE
					
					if(flag_start)
					begin
						//POP DATOS
						pop = 1'b1;
						retro_p1 = 1'b0;//LA SIGUIENTE OPERACION DEBE EMPEZAR A SUMAR CON CERO
					end
					
					if(p4_done)//LOS 4 PROCESADORES TERMINARON
					begin
						if(ov_counter)//ESTE PROCESADOR TIENE EL RESULTADO
						begin
							sel = '0;//EL RESULTADO ESTA EN LA POSICION CERO DEL SELECTOR
							retro_p1 = 1'b0;//LA SIGUIENTE OPERACION DEBE EMPEZAR A SUMAR CON CERO
						end
						else
						begin
							retro_p1 = 1'b1;//LA SUMA CON EL DATO PASADO DEBE CONTINUAR
						end
						pop = 1'b1;//NECESITAMOS CARGAR NUEVOS VALORES
					end
					
				end
				
				
				if(p1_done)
				begin
					enable_p2 = 1'b1;
					
					if(ov_counter)
					begin
						sel = 2'b01;//EL RESULTADO ESTA EN LA POSICION 1 DEL SELECTOR
						retro_p2 = 1'b0;//LA SIGUIENTE OPERACION DEBE EMPEZAR A SUMAR CON CERO
					end
					else
					begin
						retro_p2 = 1'b1;//LA SUMA CON EL DATO PASADO DEBE CONTINUAR
					end
				end


				
				if(p2_done)
				begin
					enable_p3 = 1'b1;//DESHABILITAMOS EL ANTERIOR

					if(ov_counter)
					begin
						sel = 2'b10;//EL RESULTADO ESTA EN LA POSICION 2 DEL SELECTOR
						retro_p3 = 1'b0;//LA SIGUIENTE OPERACION DEBE EMPEZAR A SUMAR CON CERO
					end
					else
					begin
						retro_p3 = 1'b1;//LA SUMA CON EL DATO PASADO DEBE CONTINUAR
					end
				end

				
				if(p3_done)
				begin
					enable_p4 = 1'b1;
					
					if(ov_counter)
					begin
						sel = 2'b11;//EL RESULTADO ESTA EN LA POSICION 3 DEL SELECTOR
						retro_p4 = 1'b0;//LA SIGUIENTE OPERACION DEBE EMPEZAR A SUMAR CON CERO
					end
					else
					begin
						retro_p4 = 1'b1;//LA SUMA CON EL DATO PASADO DEBE CONTINUAR
					end
				end
			
			end		
			
			default: 
			begin
				pop = '0;
				retro_p1 = '0;
				retro_p2 = '0;
				retro_p3 = '0;
				retro_p4 = '0;
				enable_p1 = '0;
				enable_p2 = '0;
				enable_p3 = '0;
				enable_p4 = '0;
				sel = '0;
			end
			
		endcase
end

always_ff@(posedge clk, negedge rst)
begin:counters
	if(~rst)
	begin
		count_col<='0;
		count_row<='0;
		done <= 1'b0;
		ov_counter <= 1'b0;
	end
	
	else
	begin
	
		if(p1_done||p2_done||p3_done||p4_done)
		begin
			count_col<=count_col+1'b1;
		end
		
		if(count_col==N)
		begin
			ov_counter <= 1'b1;
			count_row <= count_row+1'b1;
		end
		
		if(count_row == N)
			done <= 1'b1;
	end
	
end:counters

endmodule
