/*********************************************************************************
* Module Name: tx_fsm.sv

* Description: FSM to description hardwere   

* Inputs: clk, rst, start, enable,

* Outputs: l_s, done

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  15/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef TX_FSM
	`define TX_FSM
	
//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;
import global_pkg::*;

module tx_fsm
(
	/** Input ports **/
	input clk,
	input rst,
	input transmit,
	
	output logic working,
	output logic [1:0] sel,
	output logic load,
	output logic enb
);


UART_STATE_e state;

always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
		state <= IDLE;
	
	else
	begin
		case(state)
			IDLE : begin
				if(transmit)
					state <= START;
				else
					state <= IDLE;
			end	
			START 	: state <= BIT1;
			BIT1 		: state <= BIT2;
			BIT2 		: state <= BIT3;
			BIT3 		: state <= BIT4;
			BIT4 		: state <= BIT5;
			BIT5 		: state <= BIT6;
			BIT6 		: state <= BIT7;
			BIT7 		: state <= BIT8;
			BIT8 		: state <= PARITY;
			PARITY 	: state <= STOP;
			STOP 		: state <= IDLE;
			default 	: state <= IDLE;
		endcase
	end
		
end


always_comb
begin
	case(state)
		IDLE :
		begin
			sel = 2'b00;
			load = FALSE;
			enb = FALSE;
			working = FALSE;
		end
		
		START :
		begin
			sel = 2'b01;
			load = TRUE;
			enb = TRUE;
			working = TRUE;
		end
		
		BIT1 :	
		begin
			sel = 2'b10;
			load = FALSE;
			enb = TRUE;
			working = TRUE;
		end
		
		BIT2 :	
		begin
			sel = 2'b10;
			load = FALSE;
			enb = TRUE;
			working = TRUE;
		end
		
		BIT3 :	
		begin
			sel = 2'b10;
			load = FALSE;
			enb = TRUE;
			working = TRUE;
		end
		
		BIT4 :	
		begin
			sel = 2'b10;
			load = FALSE;
			enb = TRUE;
			working = TRUE;
		end
		
		BIT5 :	
		begin
			sel = 2'b10;
			load = FALSE;
			enb = TRUE;
			working = TRUE;
		end
		
		BIT6 :	
		begin
			sel = 2'b10;
			load = FALSE;
			enb = TRUE;
			working = TRUE;
		end
		
		BIT7 :	
		begin
			sel = 2'b10;
			load = FALSE;
			enb = TRUE;
			working = TRUE;
		end
		
		BIT8 :	
		begin
			sel = 2'b10;
			load = FALSE;
			enb = TRUE;
			working = TRUE;
		end
		
		PARITY :	
		begin
			sel = 2'b11;
			load = FALSE;
			enb = FALSE;
			working = TRUE;
		end
		
		STOP :	
		begin
			sel = 2'b00;
			load = FALSE;
			enb = FALSE;
			working = FALSE;
		end
		
		default: 
		begin
			sel = 2'b00;
			load = FALSE;
			enb = FALSE;
			working = FALSE;
		end
	
	endcase
end



endmodule
`endif