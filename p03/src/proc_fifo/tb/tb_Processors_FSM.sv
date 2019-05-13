timeunit 1ps; //It specifies the time unit that all the delay will take in the simulation.
timeprecision 1ps;// It specifies the resolution in the simulation.

import fifo_pkg::*;
module tb_Processors_FSM;

	logic clk;
	logic rst;
	logic start;
	data_t uart;
	logic pop_uart;
	logic uart_push;
	logic [2:0] N;
	
	logic full_A;
	logic empty_A;
	logic full_B;
	logic empty_B;
	logic full_out;
	logic empty_out;
	
	data_t result_uart_w;
	

top_processors p03
(
	.clk(clk),
	.rst(rst),
	.start(start),
	.uart(uart),
	.pop_uart(pop_uart),
	.uart_push(uart_push),
	.N(N),
	
	.full_A(full_A),
	.empty_A(empty_A),
	.full_B(full_B),
	.empty_B(empty_B),
	.full_out(full_out),
	.empty_out(empty_out),
	
	.result_uart_w(result_uart_w)
	
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
	# 40 start = 1'b1;
	# 45 start = 1'b0;
	
end

initial begin

	# 10 uart_push = 1'b1;
	# 4  uart_push = 1'b1;
	# 4  uart_push = 1'b1;
	# 4  uart_push = 1'b1;
	# 4  uart_push = 1'b1;
	# 4  uart_push = 1'b1;
	# 4  uart_push = 1'b1;
	# 4  uart_push = 1'b1;
	# 4  uart_push = 1'b1;
	# 4  uart_push = 1'b1;
	# 4  uart_push = 1'b1;
	# 4  uart_push = 1'b1;
	# 4  uart_push = 1'b1;
	
	
end

initial begin
	# 0 uart = '0;
	# 8 uart = 1;
	# 4 uart = 2;
	# 4 uart = 3;	
	# 4 uart = 4;
	# 4 uart = 5;
	# 4 uart = 6;
	# 4 uart = 7;
	# 4 uart = 8;

end

initial begin
	# 0 pop_uart = 1'b0;

end

initial begin
	# 0 N = 3'd5;
end

endmodule

