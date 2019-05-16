/*********************************************************************************
* Module Name: tx_mux.sv

* Description: multiplexos de datos  

* Inputs: sel, data, parity,

* Outputs: tx_out

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  09/04/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef TX_MUX
	`define TX_MUX

//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;
import global_pkg::*;

module tx_mux
(
	/** Input ports **/
	input [1:0] sel,
	input data,
	input	parity,
	
	/** Output ports **/
	output logic tx_out
);

always_comb begin : mux_tx
	
	case(sel)
	//dependien del del selector se deja salir una bandera 
	2'b00 : tx_out = TRUE;
	2'b01 : tx_out = FALSE;
	2'b10 : tx_out = data;
	2'b11 : tx_out = parity;
	
	endcase
	
end : mux_tx

endmodule
`endif