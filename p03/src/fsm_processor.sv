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
	
	output logic p_retro,
	output logic p_enable,
	output logic pop_result,
	output logic transmit,
	output logic pop,
	output logic push
	
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
				enb = 1'b0;
				clrcnt = 1'b1;
				clrchain = 1'b1;
				push = 1'b0;
				pop = 1'b0;
				p_enable = 1'b0;
				p_retro = 1'b0;
				pop_result = 1'b0;
				transmit = 1'b0;
			end
			
			LOAD :
			begin
				enb = 1'b1;
				clrcnt = 1'b0;
				clrchain = 1'b0;
				push = 1'b0;
				pop = 1'b1;
				p_enable = 1'b0;
				p_retro = 1'b0;
				pop_result = 1'b0;
				transmit = 1'b0;
			end
		
			OP :
			begin 
				enb = 1'b0;
				clrcnt = 1'b0;
				clrchain = 1'b0;
				push = 1'b0;
				pop = 1'b0;
				p_enable = 1'b1;
				p_retro = 1'b0;
				pop_result = 1'b0;
				transmit = 1'b0;
			end
			
			RESULT :
			begin
				enb = 1'b0;
				clrcnt = 1'b1;
				clrchain = 1'b0;
				push = 1'b1;
				pop = 1'b0;
				p_enable = 1'b0;
				p_retro = 1'b1;
				pop_result = 1'b0;
				transmit = 1'b0;
				
			end
			
			POP_RES :
			begin
				enb = 1'b1;
				clrcnt = 1'b0;
				clrchain = 1'b1;
				push = 1'b0;
				pop = 1'b0;
				p_enable = 1'b0;
				p_retro = 1'b0;
				pop_result = 1'b1;
				transmit = 1'b0;
			end
			
			TRANSMIT :
			begin
				enb = 1'b0;
				clrcnt = 1'b0;
				clrchain = 1'b1;
				push = 1'b0;
				pop = 1'b0;
				p_enable = 1'b0;
				p_retro = 1'b0;
				pop_result = 1'b0;
				transmit = 1'b1;
			end
			
			
			default:
			begin
				enb = 1'b0;
				clrcnt = 1'b0;
				clrchain = 1'b0;
				push = 1'b0;
				pop = 1'b0;
				p_enable = 1'b0;
				p_retro = 1'b0;
				pop_result = 1'b0;
				transmit = 1'b0;
			end
			
		endcase
end

always_ff@(posedge clk, negedge rst) begin : counterN

	if(~rst)
		cnt <= '0;
		
	else if(enb)
		cnt++;
		
	else if(clrcnt)
		cnt <= '0;

end : counterN

always_comb
begin

if(cnt==N)
	ovf = 1'b1;
else
	ovf = 1'b0;

	
end


always_ff@(posedge clk, negedge rst) begin : chaincounterN

	if(~rst)
		chain_cnt <= '0;
		
	else if(enb & ovf)
		chain_cnt++;
		
	else if(clrchain)
		chain_cnt <= '0;
	

end : chaincounterN

always_comb
begin

if(chain_cnt == N)
	chain_ovf = 1'b1;
else
	chain_ovf = 1'b0;
	
end


endmodule
