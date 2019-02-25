module top_module
(
	// Input Ports
	input clk,
	input rst,
	input start,
	
	// Output Ports
	output logic led_1hz,
	output logic led_state
);

wire clkdiv_w;

counter c(
   
	// Connection of sub-module counter and top-module  
 	// Connection input ports 
	.fpga_clk(clk),
	.rst(rst),
	.enable(start),
	
	// Connection output ports
	.clk_div(clkdiv_w)

);
state_machine sm(

	// Connection of sub-module statrts connece machine and top-module
	// connection input ports
	.clk(clkdiv_w),
	.rst(rst),
	.start(start),
	
	// Connections output ports
	.led_1hz(led_1hz),
	.led_state(led_state)

);

endmodule
