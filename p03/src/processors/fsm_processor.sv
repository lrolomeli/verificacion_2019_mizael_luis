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

module fsm_processor
(
	/** Input ports **/
	input clk,
	input rst,
	input start,
	input pop_done,
	
	output logic pop,
	output logic push,
	processors_if.ctrl p
	
);

STATE_e state;

counter_t count_N;	//rows
counter_t count_N_N;	//columns
logic overflow_n;
logic ov_n_n;
logic add;

always_ff@(posedge clk, negedge rst)
begin:statemachine

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
					state <= POP;
				else
					state <= IDLE;
			end
			
			POP :
			begin
				if(pop_done)
					state <= OP;
				else
					state <= POP;
			end
			
			OP :
			begin 
				if(p.done)
					state <= OVERFLOW;
				else
					state <= OP;
			end
			
			OVERFLOW :
			begin 
				if(overflow_n)
					state <= RESULT;
				else
					state <= POP;
			end
			

			
			RESULT :
			begin 
				if(ov_n_n)
					state <= IDLE;
				else
					state <= POP;
			end
			
			default: state <= IDLE;

		endcase
	end
		
end:statemachine


always_comb
begin
		case(state)
			IDLE :
			begin
				add = 1'b0;
				pop = 1'b0;
				p.enable = 1'b0;
				p.retro = 1'b0;
				push = 1'b0;
			end
			
			POP :
			begin
				add = 1'b0;
				p.enable = 1'b0;
				p.retro = 1'b0;
				push = 1'b0;
				
				pop = 1'b1;
			end
		
			OP :
			begin 
				add = 1'b0;
				pop = 1'b0;
				push = 1'b0;
				
				p.enable = 1'b1;
				if(count_N)
				begin
					p.retro = 1'b1;
				end
				else 
				begin 
					p.retro = 1'b0;
				end 
			end
			
			OVERFLOW :
			begin
				pop = 1'b0;
				p.enable = 1'b0;
				p.retro = 1'b0;
				push = 1'b0;
				
				add = 1'b1;
			end
			
			RESULT :
			begin
				add = 1'b0;
				pop = 1'b0;
				p.enable = 1'b0;
				p.retro = 1'b0;
				
				push = 1'b1;
			end
			
			default:
			begin
				add = 1'b0;
				pop = 1'b0;
				p.enable = 1'b0;
				p.retro = 1'b0;
				push = 1'b0;
			end
			
		endcase
end

always_ff@(posedge clk, negedge rst)
begin:counters
	if(~rst)
	begin
		count_N<='0;
		count_N_N<='0;
		ov_n_n <= 1'b0;
		overflow_n <= 1'b0;
	end
	
	else
	begin
	
		if(add)
		begin
			count_N++;
		end
		
		if(count_N == N)
		begin
			count_N <= '0;
			overflow_n <= 1'b1;
			count_N_N++;
		end
		
		if(count_N_N == N)
		begin
			count_N_N <= '0;
			ov_n_n <= 1'b1;
		end
		
	end
	
end:counters

endmodule
