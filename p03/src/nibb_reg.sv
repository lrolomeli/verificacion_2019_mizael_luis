/*********************************************************************************
* Module Name: nibb_reg.sv

* Description: The module is a register, he save a nibble data

* Inputs: clk, rst, enb, in

* Outputs: out

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  13/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;
import global_pkg::*;

`ifndef NIBB_REG
	`define NIBB_REG
module nibb_reg
(
	/** Input ports **/
	input clk,
	input rst,
	input enb,
	input nibble_t in,

	/** output ports **/
	output nibble_t out
);

always_ff@(posedge clk, negedge rst) begin : rgstr
	if(~rst)
		/* se limpia el registro*/
		out <= FALSE;
	else if(enb)
		/* El registro es igual a la salida */
		out <= in;
end : rgstr

endmodule
`endif