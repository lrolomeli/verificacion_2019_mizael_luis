/*********************************************************************************
* Module Name: rx_fsm.sv

* Description: fsm de la uart rx   

* Inputs: 

* Outputs: 

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  15/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef RX_FSM
	`define RX_FSM
	
//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;
import global_pkg::*;

module rx_fsm
(
	/** Input ports **/
	input clk,
	input rst,
	input rx,
	input ovf,
	
	output logic rx_interrupt,
	output logic time_sel,
	output logic enb_count,
	output logic enb_sipo,
	output logic enb_parity
);


UART_STATE_e state;

always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
	begin
		state <= IDLE;
	end
	
	else
	begin
		case(state)
		
			IDLE : begin
				if(~rx)
					state <= START;
				else
					state <= IDLE;
			end
			
			START : begin
				if(ovf)
					state <= BIT1;
				else
					state <= START;
			end
			
			BIT1 : begin
				if(ovf)
					state <= BIT2;
				else
					state <= BIT1;
			end
			
			BIT2 : begin
				if(ovf)
					state <= BIT3;
				else
					state <= BIT2;
			end
			
			BIT3 : begin
				if(ovf)
					state <= BIT4;
				else
					state <= BIT3;
			end
			
			BIT4 : begin
				if(ovf)
					state <= BIT5;
				else
					state <= BIT4;
			end
			
			BIT5 : begin
				if(ovf)
					state <= BIT6;
				else
					state <= BIT5;
			end
			
			BIT6 : begin
				if(ovf)
					state <= BIT7;
				else
					state <= BIT6;
			end
			
			BIT7 : begin
				if(ovf)
					state <= BIT8;
				else
					state <= BIT7;
			end
			
			BIT8 : begin
				if(ovf)
					state <= PARITY;
				else
					state <= BIT8;
			end
			
			PARITY : begin
				if(ovf)
					state <= STOP;
				else
					state <= PARITY;
			end
			
			STOP : begin
				if(ovf)
					state <= IDLE;
				else
					state <= STOP;
			end
			
			default : state <= IDLE;
		
		endcase
	
	end
		
end


always_comb
begin
	case(state)
		IDLE :
		begin
			time_sel = FALSE;
			enb_count = FALSE;
			enb_sipo = FALSE;
			enb_parity = FALSE;
			rx_interrupt = FALSE;
		end
		
		START :
		begin
			time_sel = FALSE;
			enb_count = TRUE;
			enb_sipo = FALSE;
			enb_parity = FALSE;
			rx_interrupt = FALSE;
		end
		
		BIT1 :	
		begin
			time_sel = TRUE;
			enb_count = TRUE;
			enb_sipo = TRUE;
			enb_parity = FALSE;
			rx_interrupt = FALSE;
		end
		
		BIT2 :	
		begin
			time_sel = TRUE;
			enb_count = TRUE;
			enb_sipo = TRUE;
			enb_parity = FALSE;
			rx_interrupt = FALSE;
		end
		
		BIT3 :	
		begin
			time_sel = TRUE;
			enb_count = TRUE;
			enb_sipo = TRUE;
			enb_parity = FALSE;
			rx_interrupt = FALSE;
		end
		
		BIT4 :	
		begin
			time_sel = TRUE;
			enb_count = TRUE;
			enb_sipo = TRUE;
			enb_parity = FALSE;
			rx_interrupt = FALSE;
		end
		
		BIT5 :	
		begin
			time_sel = TRUE;
			enb_count = TRUE;
			enb_sipo = TRUE;
			enb_parity = FALSE;
			rx_interrupt = FALSE;
		end
		
		BIT6 :	
		begin
			time_sel = TRUE;
			enb_count = TRUE;
			enb_sipo = TRUE;
			enb_parity = FALSE;
			rx_interrupt = FALSE;
		end
		
		BIT7 :	
		begin
			time_sel = TRUE;
			enb_count = TRUE;
			enb_sipo = TRUE;
			enb_parity = FALSE;
			rx_interrupt = FALSE;
		end
		
		BIT8 :	
		begin
			time_sel = TRUE;
			enb_count = TRUE;
			enb_sipo = TRUE;
			enb_parity = FALSE;
			rx_interrupt = FALSE;
		end
		
		PARITY :	
		begin
			time_sel = TRUE;
			enb_count = TRUE;
			enb_sipo = FALSE;
			enb_parity = TRUE;
			rx_interrupt = FALSE;
		end
		
		STOP :	
		begin
			time_sel = TRUE;
			enb_count = TRUE;
			enb_sipo = FALSE;
			enb_parity = FALSE;
			rx_interrupt = TRUE;
		end
		
		default: 
		begin
			time_sel = FALSE;
			enb_count = FALSE;
			enb_sipo = FALSE;
			enb_parity = FALSE;
			rx_interrupt = FALSE;
		end
	
	endcase
end



endmodule
`endif