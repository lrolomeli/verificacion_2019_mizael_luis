/*********************************************************************************
* Module Name: fsm_processor.sv

* Description: LA MAQUINA DE ESTADOS PARA EL PROCESADOR DE OPERACIONES  

* Inputs: clk, rst, start, nibble_t N,

* Outputs: p_retro, p_enable, pop_result, transmit, pop, push, clr

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  15/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef FSM_PROCESSOR
	`define FSM_PROCESSOR
	
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
	
	output logic p_retro,
	output logic p_enable,
	output logic pop_result,
	output logic transmit,
	output logic pop,
	output logic push,
	output logic clr
	
);

STATE_e state;

Ncounter_t cnt;	//rows
Ncounter_t chain_cnt;	//columns

logic ovf;
logic chain_ovf;
logic enb;
logic clrcnt;
logic clrchain;

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
				if(ovf)
					state <= RESULT;
				else
					state <= LOAD;
			end		

			
			RESULT :
			begin 
				if(chain_ovf)
					state <= TRANSMIT;
				else
					state <= LOAD;
			end
			TRANSMIT : 
			begin
				if(ovf)
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
				enb = FALSE;
				clrcnt = TRUE;
				clrchain = TRUE;
				push = FALSE;
				pop = FALSE;
				p_enable = FALSE;
				p_retro = FALSE;
				pop_result = FALSE;
				transmit = FALSE;
				clr = FALSE;
			end
			
			LOAD :
			begin
				enb = TRUE;
				clrcnt = FALSE;
				clrchain = FALSE;
				push = FALSE;
				pop = TRUE;
				p_enable = FALSE;
				p_retro = FALSE;
				pop_result = FALSE;
				transmit = FALSE;
				clr = FALSE;
			end
		
			OP :
			begin 
				enb = FALSE;
				clrcnt = FALSE;
				clrchain = FALSE;
				push = FALSE;
				pop = FALSE;
				p_enable = TRUE;
				p_retro = FALSE;
				pop_result = FALSE;
				transmit = FALSE;
				clr = FALSE;
			end
			
			RESULT :
			begin
				enb = FALSE;
				clrcnt = TRUE;
				clrchain = FALSE;
				push = TRUE;
				pop = FALSE;
				p_enable = FALSE;
				p_retro = TRUE;
				pop_result = FALSE;
				transmit = FALSE;
				clr = TRUE;
				
			end
			
			POP_RES :
			begin
				enb = TRUE;
				clrcnt = FALSE;
				clrchain = TRUE;
				push = FALSE;
				pop = FALSE;
				p_enable = FALSE;
				p_retro = FALSE;
				pop_result = TRUE;
				transmit = FALSE;
				clr = FALSE;
			end
			
			TRANSMIT :
			begin
				enb = FALSE;
				clrcnt = FALSE;
				clrchain = TRUE;
				push = FALSE;
				pop = FALSE;
				p_enable = FALSE;
				p_retro = FALSE;
				pop_result = FALSE;
				transmit = TRUE;
				clr = FALSE;
			end
			
			
			default:
			begin
				enb = FALSE;
				clrcnt = FALSE;
				clrchain = FALSE;
				push = FALSE;
				pop = FALSE;
				p_enable = FALSE;
				p_retro = FALSE;
				pop_result = FALSE;
				transmit = FALSE;
				clr = FALSE;
			end
			
		endcase
end

always_ff@(posedge clk, negedge rst) begin : counterN

	if(~rst)
		cnt <= FALSE;
		
	else if(enb)
		cnt++;
		
	else if(clrcnt)
		cnt <= FALSE;

end : counterN

always_comb
begin

if(cnt==N)
	ovf = TRUE;
else
	ovf = FALSE;

	
end


always_ff@(posedge clk, negedge rst) begin : chaincounterN

	if(~rst)
		chain_cnt <= FALSE;
		
	else if(enb & ovf)
		chain_cnt++;
		
	else if(clrchain)
		chain_cnt <= FALSE;
	

end : chaincounterN

always_comb
begin

if(chain_cnt == N)
	chain_ovf = TRUE;
else
	chain_ovf = FALSE;
	
end


endmodule
`endif