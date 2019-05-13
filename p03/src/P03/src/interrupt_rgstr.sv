//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;

`ifndef INTERRUPT_RGSTR
	`define INTERRUPT_RGSTR
module interrupt_rgstr
(
	/** Input ports **/
	input clk,
	input rst,
	input rx_interrupt,
	input clear,
	
	output logic out
);

always_ff@(posedge clk, negedge rst) begin : rgstr
	if(~rst)
		out <= '0;
	else if(rx_interrupt)
		out <= 1'b1;
	else if(clear)
		out <= '0;
	else
		out <= out;
end : rgstr

endmodule
`endif