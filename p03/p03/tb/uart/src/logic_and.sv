//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;


module logic_and
(
	/** Input ports **/
	input a,
	input b,
	
	output out
);

assign out = a & b;

endmodule
