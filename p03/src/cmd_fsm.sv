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
import global_pkg::*;
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

CMD_STATUS_e status;


always_ff@(posedge clk, negedge rst)
begin

	if(~rst) begin
		status <= IDLECMD;
	end
	
	else begin

		case(status)
		
			IDLECMD : begin
				if((rx_interrupt) && (uart_data == START_CMD))
					status <= LENGTH;
				else
					status <= IDLECMD;
			end
			
			LENGTH : begin
				if(rx_interrupt)
				status <= COMMAND;
				else 
				status <= LENGTH;
			end
			
			COMMAND : begin
				if(rx_interrupt)
				begin
				case(uart_data)
					CMD1 : status <= WAITCMD1;
					CMD2 : status <= WAITCMD2;
					CMD3 : status <= WAITCMD3;
					CMD4 : status <= WAITCMD4;
					CMD5 : status <= WAITCMD5;
					default : status <= IDLECMD;
				endcase
				end
				else
				status <= COMMAND;
			end
			
			RCMD1 : status <= WAITCMD1;
			
			WAITCMD1 : begin
				if(rx_interrupt)
				begin
					if(uart_data == END_CMD)
						status <= IDLECMD;
					else
						status <= RCMD1;
				end
			
			end
			
			RCMD2 : status <= WAITCMD2;
			
			WAITCMD2 : begin
				if(rx_interrupt)
				begin
					if(uart_data == END_CMD)
						status <= IDLECMD;
					else
						status <= RCMD2;
				end
			
			end
			
			RCMD3 : status <= WAITCMD3;
			
			WAITCMD3 : begin
				if(rx_interrupt)
				begin
					if(uart_data == END_CMD)
						status <= IDLECMD;
					else
						status <= RCMD3;
				end
			
			end
			
			RCMD4 : status <= WAITCMD4;
			
			WAITCMD4 : begin
				if(rx_interrupt)
				begin
					if(uart_data == END_CMD)
						status <= IDLECMD;
					else
						status <= RCMD4;
				end
			
			end
			
			RCMD5 : status <= WAITCMD5;
			
			WAITCMD5 : begin
				if(rx_interrupt)
				begin
					if(uart_data == END_CMD)
						status <= IDLECMD;
					else
						status <= RCMD5;
				end
			
			end
			
			default : status <= IDLECMD;
		
		endcase
	
	end
		
end


always_comb begin
	
	case(status)
		IDLECMD : begin
		push_A = FALSE;
		push_B = FALSE;
		enable_n = FALSE;
		clear = FALSE;
		end
		
		RCMD1 : begin
		push_A = FALSE;
		push_B = FALSE;
		enable_n = TRUE;
		clear = FALSE;

		end
		
		RCMD2 : begin
		push_A = FALSE;
		push_B = FALSE;
		enable_n = FALSE;
		clear = FALSE;

		end

		RCMD4 : begin
		//habilitar push
		push_A = TRUE;
		push_B = FALSE;
		enable_n = FALSE;
		clear = FALSE;

		end
		
		RCMD5 : begin
		push_A = FALSE;
		push_B = TRUE;
		enable_n = FALSE;
		clear = FALSE;

		end
		
		default: begin
		push_A = FALSE;
		push_B = FALSE;
		enable_n = FALSE;
		clear = FALSE;

		end
			
	endcase
			
end


endmodule
`endif