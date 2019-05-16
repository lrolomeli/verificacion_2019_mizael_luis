/*********************************************************************************
* Module Name: fsm_processor.sv

* Description: FSM to description hardwere

* Inputs: clk, rst, start, N,

* Outputs: pop_result, logic transmit, logic pop, logic push, processors_if.ctrl p

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/05/2019

* Project Name: P03

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

	/** Output ports **/
	output logic pop_result,
	output logic transmit,
	output logic pop,
	output logic push,
	processors_if.ctrl p

);

// VARIABLES UTILIZADAS PARA EL MODULO
//estados
STATE_e state;

//contadores
Ncounter_t count_N;		//rows
Ncounter_t count_N_N;	//columns
Ncounter_t count_res;

//baderas para contadores en cascada
logic add;
logic add_cnt;

// Maquina de estados
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

//Banderas de control
always_comb
begin
		case(state)
			NP :
			begin
				add = FALSE;
				pop = FALSE;
				p.enable = FALSE;
				p.retro = FALSE;
				push = FALSE;
				pop_result = FALSE;
				add_cnt = FALSE;
				transmit = FALSE;
			end

			LOAD :
			begin
				add = FALSE;
				p.enable = FALSE;
				p.retro = FALSE;
				push = FALSE;
				pop = TRUE;
				pop_result = FALSE;
				add_cnt = FALSE;
				transmit = FALSE;
			end

			OP :
			begin
				add = TRUE;
				pop = FALSE;
				push = FALSE;
				p.enable = TRUE;
				pop_result = FALSE;
				add_cnt = FALSE;
				transmit = FALSE;
				if(count_N)
				begin
					p.retro = TRUE;
				end
				else
				begin
					p.retro = FALSE;
				end
			end

			RESULT :
			begin
				add = FALSE;
				pop = FALSE;
				p.enable = FALSE;
				p.retro = FALSE;
				pop_result = TRUE;
				add_cnt = TRUE;
				transmit = FALSE;
				push = TRUE;
			end

			POP_RES :
			begin
				add = FALSE;
				pop = FALSE;
				p.enable = FALSE;
				p.retro = FALSE;
				pop_result = TRUE;
				add_cnt = TRUE;
				transmit = FALSE;
				push = TRUE;
			end

			TRANSMIT :
			begin
				add = FALSE;
				pop = FALSE;
				p.enable = FALSE;
				p.retro = FALSE;
				push = TRUE;
				pop_result = FALSE;
				add_cnt = FALSE;
				transmit = TRUE;
			end


			default:
			begin
				add = FALSE;
				pop = FALSE;
				p.enable = FALSE;
				p.retro = FALSE;
				push = FALSE;
				pop_result = FALSE;
				add_cnt = FALSE;
				transmit = FALSE;
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
