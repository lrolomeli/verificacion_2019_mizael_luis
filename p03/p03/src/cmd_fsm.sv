/*********************************************************************************
* Module Name: cmd_fsm.sv

* Description: FSM de los comandos recividos por la uart

* Inputs:	clk, rst, data_t uart_data, rx_interrupt,

* Outputs:	clear_interrupt, push_A, push_B, enable_n, clear

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef CMD_FSM
	`define CMD_FSM

//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;
import processor_pkg::*;
import global_pkg::*;

module cmd_fsm
(
	/** Input ports **/
	input clk,
	input rst,
	input data_t uart_data,
	input rx_interrupt,

	/** Output ports **/
	output logic clear_interrupt,
	output logic push_A,
	output logic push_B,
	output logic enable_n,
	output logic clear

);

CMD_STATE_e state; /* Maquina de estados principal */
CMD_STATUS_e status; /* Maquna de estados que analiza el comando */

always_ff@(posedge clk, negedge rst)
begin
	if(~rst) begin
		/* Estados de la fsm despues del reset */
		state <= WAIT4BYTE;
		status <= IDLECMD;
	end

	else begin
		case(state)

			WAIT4BYTE : begin
				if(rx_interrupt)
					state <= CHECKSTATUS;	/* Estado que recibe y checa el FE */
				else
					state <= WAIT4BYTE;		/* Estado de inicio */
			end

			CHECKSTATUS : begin : STATE_CHECK_STATUS /* Entra el estado */

				case(status)

					IDLECMD : begin
						if(uart_data == START_CMD)
							status <= LENGTH;	/* Revisa el largo de la trama */
						else
							status <= IDLECMD; /* Regresa al estado inicial*/
						state <= WAIT4BYTE;
					end

					LENGTH : begin
						status <= COMMAND;	/* Va checa el comando */
						state <= WAIT4BYTE;
					end

					COMMAND : begin			/* Sub-estado */
						case(uart_data)
							/* analisis de cada comando */
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

//comportamiento de las señales de control en cada estado
always_comb begin
	case(state)
		WAIT4BYTE : begin
			clear_interrupt = FALSE;
			push_A = FALSE;
			push_B = FALSE;
			enable_n = FALSE;
			clear = FALSE;
		end

		CHECKSTATUS : begin
			clear_interrupt = TRUE;
		end

		default : begin
			clear_interrupt = FALSE;
			push_A = FALSE;
			push_B = FALSE;
			enable_n = FALSE;
			clear = FALSE;
		end

	endcase

	case(status)
		IDLECMD : begin
		push_A = FALSE;
		push_B = FALSE;
		enable_n = FALSE;
		clear = FALSE;
		end

		LENGTH : begin
		push_A = FALSE;
		push_B = FALSE;
		enable_n = FALSE;
		clear = FALSE;
		end

		COMMAND : begin
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

		RCMD3 : begin
		push_A = FALSE;
		push_B = FALSE;
		enable_n = FALSE;
		clear = TRUE;
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