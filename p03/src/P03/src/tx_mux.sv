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
import uart_pkg::*;
`ifndef TX_MUX
	`define TX_MUX

module tx_mux
(
	/** Input ports **/
	input [1:0] sel,
	input data,
	input	parity,
	
	output logic tx_out
);

always_comb begin : mux_tx
	
	case(sel)
	
	2'b00 : tx_out = 1'b1;
	2'b01 : tx_out = 1'b0;
	2'b10 : tx_out = data;
	2'b11 : tx_out = parity;
	
	endcase
	
end : mux_tx

endmodule
`endif