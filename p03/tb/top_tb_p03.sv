timeunit 1ps; //It specifies the time unit that all the delay will take in the simulation.
timeprecision 1ps;// It specifies the resolution in the simulation.

import fifo_pkg::*;
module tb_Processors_FSM;

	logic clk;
	logic rst;
	logic rx_interrupt;
	data_t data;
	
	logic tx;
	logic ready;
	logic full_A;
	logic empty_A;
	

top_processors p03
(
	.clk(clk),
	.rst(rst),
	.rx_interrupt(rx_interrupt),
	.data(data),
	
	.tx(tx),
	.ready(ready),
	.full_A(full_A),
	.empty_A(empty_A)
	
);

/**************************************************************************/
	
/******************** Stimulus *************************/
initial // Clock generator
  begin
    clk = 1'b0;
    forever #2 clk = !clk;
  end
/*----------------------------------------------------------------------------------------*/

initial begin /*Reset*/
	# 0 rst = 1'b0;
	#1 rst = 1'b1;
end
/*----------------------------------------------------------------------------------------*/


initial begin
	# 0 start = 1'b0;
	# 4 start = 1'b0;
	# 200 start = 1'b1;
	# 4 start = 1'b0;
	
end

initial begin

	# 0 push_A = '0;
		push_B = '0;
	# 9 push_A = 1'b1;
		push_B = 1'b1;
	# 20  push_A = 1'b1;
	push_B = 1'b1;
	# 20  push_A = 1'b1;
	push_B = 1'b1;
	# 20  push_A = 1'b1;
	push_B = 1'b1;
	# 20  push_A = 1'b1;
	push_B = 1'b1;
	# 20  push_A = 1'b1;
	push_B = 1'b1;
	# 20  push_A = 1'b1;
	push_B = 1'b1;
	# 20  push_A = 1'b1;
	push_B = 1'b1;
	# 20  push_A = 1'b1;
	push_B = 1'b1;
	# 4 push_A = '0;
	push_B = '0;
	
	
end

initial begin
	# 0 uart = '0;
	# 8 uart = 1;
	# 20 uart = 2;
	# 20 uart = 3;	
	# 20 uart = 4;
	# 20 uart = 5;
	# 20 uart = 6;
	# 20 uart = 7;
	# 4 uart = 8;

end

initial begin
	# 0 pop_uart = 1'b0;

end

initial begin
	# 0 N = 3'd5;
end

endmodule

