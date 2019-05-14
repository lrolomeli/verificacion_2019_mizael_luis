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
import processor_pkg::*;
import global_pkg::*;

module fsm_processor
(
	/** Input ports **/
	input clk,
	input rst,
	input start,
	input nibble_t N,
	
	output logic pop_result,
	output logic transmit,
	output logic pop,
	output logic push,
	processors_if.ctrl p
	
);

STATE_e state;

Ncounter_t count_N;	//rows
Ncounter_t count_N_N;	//columns
Ncounter_t count_res;

logic add;
logic add_cnt;

always_ff@(posedge clk, negedge rst)
begin:statemachine

	if(~rst)
	begin
		/** Init FSM **/
		state <= NP;	
	end
	
	else
	begin
		case(state)
			NP :
			begin
				if(start)
					state <= LOAD;
				else
					state <= NP;
			end
			
			LOAD :
			begin
				state <= OP;
			end
			
			OP :
			begin 
				if(count_N == N-1)
					state <= RESULT;
				else
					state <= LOAD;
			end		

			
			RESULT :
			begin 
				if(count_N_N == N-1)
					state <= TRANSMIT;
				else
					state <= LOAD;
			end
			TRANSMIT : 
			begin
				if(count_N == N)
					state <= NP;
				else
					state <= POP_RES;
			end
			
			POP_RES : 
				state <= TRANSMIT;
 
	
			default: state <= NP;

		endcase
	end
		
end:statemachine


always_comb
begin
		case(state)
			NP :
			begin
				add = 1'b0;
				pop = 1'b0;
				p.enable = 1'b0;
				p.retro = 1'b0;
				push = 1'b0;
				pop_result = 1'b0;
				add_cnt = 1'b0;
				transmit = 1'b0;
			end
			
			LOAD :
			begin
				add = 1'b0;
				p.enable = 1'b0;
				p.retro = 1'b0;
				push = 1'b0;
				pop = 1'b1;
				pop_result = 1'b0;
				add_cnt = 1'b0;
				transmit = 1'b0;
			end
		
			OP :
			begin 
				add = 1'b1;
				pop = 1'b0;
				push = 1'b0;
				p.enable = 1'b1;
				pop_result = 1'b0;
				add_cnt = 1'b0;
				transmit = 1'b0;
				if(count_N)
				begin
					p.retro = 1'b1;
				end
				else 
				begin 
					p.retro = 1'b0;
				end 
			end
			
			RESULT :
			begin
				add = 1'b0;
				pop = 1'b0;
				p.enable = 1'b0;
				p.retro = 1'b0;
				pop_result = 1'b1;
				add_cnt = 1'b1;
				transmit = 1'b0;
				push = 1'b1;
			end
			
			POP_RES :
			begin
				add = 1'b0;
				pop = 1'b0;
				p.enable = 1'b0;
				p.retro = 1'b0;
				pop_result = 1'b1;
				add_cnt = 1'b1;
				transmit = 1'b0;
				push = 1'b1;
			end
			
			TRANSMIT :
			begin
				add = 1'b0;
				pop = 1'b0;
				p.enable = 1'b0;
				p.retro = 1'b0;
				push = 1'b1;
				pop_result = 1'b0;
				add_cnt = 1'b0;
				transmit = 1'b1;
			end
			
			
			default:
			begin
				add = 1'b0;
				pop = 1'b0;
				p.enable = 1'b0;
				p.retro = 1'b0;
				push = 1'b0;
				pop_result = 1'b0;
				add_cnt = 1'b0;
				transmit = 1'b0;
			end
			
		endcase
end

always_ff@(posedge clk, negedge rst)
begin:counters
	if(~rst)
	begin
		count_N<='0;
		count_N_N<='0;
		count_res<='0;
	end
	
	else
	begin
		if(add)
			count_N++;
			
		if(add_cnt)
			count_res++;
		
		if(count_res == N)
			count_res <= '0;

		if(count_N == N)	begin
			count_N_N++;
			count_N <= '0;
		end
		
		if(count_N_N == N)
			count_N_N <= '0;
			

			
	end
	
end:counters


endmodule
