//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;

`ifndef REGISTER
	`define REGISTER
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