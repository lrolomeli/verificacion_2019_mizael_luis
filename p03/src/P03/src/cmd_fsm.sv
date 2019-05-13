/*********************************************************************************
* Module Name: cmd_fsm.sv

* Description: FSM to description hardwere   

* Inputs: clk, rst

* Outputs: 

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  12/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;
`ifndef CMD_FSM
	`define CMD_FSM
module cmd_fsm
(
	/** Input ports **/
	input clk,
	input rst,
	input data_t uart_data,
	input rx_interrupt,
	
	output logic clear_interrupt,
	output logic push_A,
	output logic push_B,
	output logic enable_n,
	output logic clear
	
);

CMD_STATE_e state;
CMD_STATUS_e status;

always_ff@(posedge clk, negedge rst)
begin

	if(~rst) begin
		state <= WAIT4BYTE;
		status <= IDLECMD;
	end
	
	else begin
		case(state)
			
			WAIT4BYTE : begin
				if(rx_interrupt)
					state <= CHECKSTATUS;
				else
					state <= WAIT4BYTE;
			end
			
			CHECKSTATUS : begin : STATE_CHECK_STATUS
				
				case(status)
				
					IDLECMD : begin
						if(uart_data == START_CMD)
							status <= LENGTH;
						else
							status <= IDLECMD;
						state <= WAIT4BYTE;
					end
					
					LENGTH : begin
						status <= COMMAND;
						state <= WAIT4BYTE;
					end
					
					COMMAND : begin
						case(uart_data)
							CMD1 : status <= RCMD1;
							CMD2 : status <= RCMD2;
							CMD3 : status <= RCMD3;
							CMD4 : status <= RCMD4;
							CMD5 : status <= RCMD5;
							default : status <= IDLECMD;
						endcase
						state <= WAIT4BYTE;
					end
					
					RCMD1 : begin
						if(uart_data == END_CMD)
							status <= IDLECMD;
						else
							status <= RCMD1;
						state <= WAIT4BYTE;
					end
					
					RCMD2 : begin
						if(uart_data == END_CMD)
							status <= IDLECMD;
						else
							status <= RCMD2;
						state <= WAIT4BYTE;
					end
					
					RCMD3 : begin
						if(uart_data == END_CMD)
							status <= IDLECMD;
						else
							status <= RCMD3;
						state <= WAIT4BYTE;
					end
					
					RCMD4 : begin
						if(uart_data == END_CMD)
							status <= IDLECMD;
						else
							status <= RCMD4;
						state <= WAIT4BYTE;
					end
					
					RCMD5 : begin
						if(uart_data == END_CMD)
							status <= IDLECMD;
						else
							status <= RCMD5;
						state <= WAIT4BYTE;
					end
					
					default : begin
						status <= IDLECMD;
						state <= WAIT4BYTE;
					end
				
				endcase
				
			end : STATE_CHECK_STATUS
				
			default : state <= WAIT4BYTE;

		endcase
	
	end
		
end


always_comb begin

	case(state)
		WAIT4BYTE : begin
			clear_interrupt = 1'b0;
			push_A = 1'b0;
			push_B = 1'b0;
			enable_n = 1'b0;
			clear = 1'b0;
		end
		
		CHECKSTATUS : begin
			clear_interrupt = 1'b1;
		end
		
		default : begin
			clear_interrupt = 1'b0;
			push_A = 1'b0;
			push_B = 1'b0;
			enable_n = 1'b0;
			clear = 1'b0;
		end
		
	endcase

	case(status)
		IDLECMD : begin
		push_A = 1'b0;
		push_B = 1'b0;
		enable_n = 1'b0;
		clear = 1'b0;
		end
		
		LENGTH : begin
		push_A = 1'b0;
		push_B = 1'b0;
		enable_n = 1'b0;
		clear = 1'b0;
		end
		
		COMMAND : begin
		push_A = 1'b0;
		push_B = 1'b0;
		enable_n = 1'b0;
		clear = 1'b0;
		end
		
		RCMD1 : begin
		push_A = 1'b0;
		push_B = 1'b0;
		enable_n = 1'b1;
		clear = 1'b0;
		end
		
		RCMD2 : begin
		push_A = 1'b0;
		push_B = 1'b0;
		enable_n = 1'b0;
		clear = 1'b0;
		end
		
		RCMD3 : begin
		push_A = 1'b0;
		push_B = 1'b0;
		enable_n = 1'b0;
		clear = 1'b1;
		end
		
		RCMD4 : begin
		//habilitar push
		push_A = 1'b1;
		push_B = 1'b0;
		enable_n = 1'b0;
		clear = 1'b0;
		end
		
		RCMD5 : begin
		push_A = 1'b0;
		push_B = 1'b1;
		enable_n = 1'b0;
		clear = 1'b0;
		end
		
		default: begin
		push_A = 1'b0;
		push_B = 1'b0;
		enable_n = 1'b0;
		clear = 1'b0;
		end
	
	endcase
end



endmodule
`endif