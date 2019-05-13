//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;

`ifndef LOGIC_AND
	`define LOGIC_AND
module logic_and
(
	/** Input ports **/
	input a,
	input b,
	
	output out
);

assign out = a & b;

endmodule
`endif