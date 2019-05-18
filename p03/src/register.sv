/*********************************************************************************
* Module Name: register.sv

* Description: el modulo aplica una compuerta and a dos datos.  

* Inputs: clk, rst, enb, in,

* Outputs: out

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef REGISTER
	`define REGISTER

//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;

module register
(
	/** Input ports **/
	input clk,
	input rst,
	input enb,
	input in,
	
	output logic out
);

always_ff@(posedge clk, negedge rst) begin : rgstr
	if(~rst)
		out <= '0;
	else if(enb)
		out <= in;
end : rgstr

endmodule
`endif