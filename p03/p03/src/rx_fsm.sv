/*********************************************************************************
* Module Name: FSM.sv

* Description: FSM to description hardwere   

* Inputs: clk, rst, start, enable,

* Outputs: l_s, done

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
import uart_pkg::*;
`ifndef RX_FSM
	`define RX_FSM
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
			time_sel = 1'b0;
			enb_count = 1'b0;
			enb_sipo = 1'b0;
			enb_parity = 1'b0;
			rx_interrupt = 1'b0;
		end
		
		START :
		begin
			time_sel = 1'b0;
			enb_count = 1'b1;
			enb_sipo = 1'b0;
			enb_parity = 1'b0;
			rx_interrupt = 1'b0;
		end
		
		BIT1 :	
		begin
			time_sel = 1'b1;
			enb_count = 1'b1;
			enb_sipo = 1'b1;
			enb_parity = 1'b0;
			rx_interrupt = 1'b0;
		end
		
		BIT2 :	
		begin
			time_sel = 1'b1;
			enb_count = 1'b1;
			enb_sipo = 1'b1;
			enb_parity = 1'b0;
			rx_interrupt = 1'b0;
		end
		
		BIT3 :	
		begin
			time_sel = 1'b1;
			enb_count = 1'b1;
			enb_sipo = 1'b1;
			enb_parity = 1'b0;
			rx_interrupt = 1'b0;
		end
		
		BIT4 :	
		begin
			time_sel = 1'b1;
			enb_count = 1'b1;
			enb_sipo = 1'b1;
			enb_parity = 1'b0;
			rx_interrupt = 1'b0;
		end
		
		BIT5 :	
		begin
			time_sel = 1'b1;
			enb_count = 1'b1;
			enb_sipo = 1'b1;
			enb_parity = 1'b0;
			rx_interrupt = 1'b0;
		end
		
		BIT6 :	
		begin
			time_sel = 1'b1;
			enb_count = 1'b1;
			enb_sipo = 1'b1;
			enb_parity = 1'b0;
			rx_interrupt = 1'b0;
		end
		
		BIT7 :	
		begin
			time_sel = 1'b1;
			enb_count = 1'b1;
			enb_sipo = 1'b1;
			enb_parity = 1'b0;
			rx_interrupt = 1'b0;
		end
		
		BIT8 :	
		begin
			time_sel = 1'b1;
			enb_count = 1'b1;
			enb_sipo = 1'b1;
			enb_parity = 1'b0;
			rx_interrupt = 1'b0;
		end
		
		PARITY :	
		begin
			time_sel = 1'b1;
			enb_count = 1'b1;
			enb_sipo = 1'b0;
			enb_parity = 1'b1;
			rx_interrupt = 1'b0;
		end
		
		STOP :	
		begin
			time_sel = 1'b1;
			enb_count = 1'b1;
			enb_sipo = 1'b0;
			enb_parity = 1'b0;
			rx_interrupt = 1'b1;
		end
		
		default: 
		begin
			time_sel = 1'b0;
			enb_count = 1'b0;
			enb_sipo = 1'b0;
			enb_parity = 1'b0;
			rx_interrupt = 1'b0;
		end
	
	endcase
end



endmodule
`endif