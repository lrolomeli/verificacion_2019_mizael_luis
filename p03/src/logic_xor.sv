//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;

`ifndef LOGIC_XOR
	`define LOGIC_XOR
module logic_xor
(
	/** Input ports **/
	input a,
	input b,
	
	output out
);

assign out = a ^ b;

endmodule
`endif