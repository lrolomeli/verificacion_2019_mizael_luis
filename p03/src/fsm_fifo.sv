/*********************************************************************************
* Module Name: fsm_fifo.sv

* Description: FSM to FIFO

* Inputs: clk, rst, pop, push, full, empty,

* Outputs: wr_en, rd_en

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  09/04/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef FSM_FIFO_SV
    `define FSM_FIFO_SV

//================================================================================
// Import the Packages
//================================================================================
import fifo_pkg::*;
import global_pkg::*;

module fsm_fifo(
	/** Input ports **/
	input clk,
	input rst,
	input pop,
	input push,
	input full,
	input empty,

	/** Input ports **/
	output logic wr_en,
	output logic rd_en

);

// Fue decidido no implementar esta seccion por diseño
//STATE_FIFO_e state;
//
//always_ff@(posedge clk, negedge rst)
//begin:statemachine
//
//	if(~rst)
//	begin
//		/** Init FSM **/
//		state <= IDLE;
//	end
//
//	else
//	begin
//		case(state)
//			IDLE :
//			begin
//				if(pop && ~empty)
//					state <= POP;
//				else if(push && ~full)
//					state <= PUSH;
//				else
//					state <= IDLE;
//			end
//
//			PUSH :
//			begin
//				state <= IDLE;
//			end
//
//			POP :
//			begin
//				state <= IDLE;
//			end
//
//			default : state <= IDLE;
//		endcase
//	end
//
//end:statemachine
//
//always_comb
//begin
//	case(state)
//		IDLE:
//		begin
//			rd_en = FALSE;
//			wr_en = FALSE;
//		end
//
//		POP :
//		begin
//			rd_en = TRUE;
//			wr_en = FALSE;
//
//		end
//
//		PUSH :
//		begin
//			rd_en = FALSE;
//			wr_en = TRUE;
//		end
//
//		default:
//		begin
//			rd_en = FALSE;
//			wr_en = FALSE;
//		end
//
//	endcase
//end

/* Analisis de es estado de la memoria y su manera de escribir */
always_comb
begin
		if(pop && ~empty)
			rd_en = TRUE;
		else
			rd_en = FALSE;
		if(push && ~full)
			wr_en = TRUE;
		else
			wr_en = FALSE;
end
endmodule
`endif