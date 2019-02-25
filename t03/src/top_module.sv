module top_module
(
	input clk,
	input rst,
	input start,
	
	output logic led_1hz,
	output logic led_state
);

wire clkdiv_w;

counter c(

	.fpga_clk(clk),
	.rst(rst),
	.enable(start),
	
	.clk_div(clkdiv_w)

);

state_machine sm(

	.clk(clkdiv_w),
	.rst(rst),
	.start(start),
	
	.led_1hz(led_1hz),
	.led_state(led_state)

);

endmodule
