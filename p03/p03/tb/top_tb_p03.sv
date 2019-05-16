timeunit 1ps; //It specifies the time unit that all the delay will take in the simulation.
timeprecision 1ps;// It specifies the resolution in the simulation.

import fifo_pkg::*;
import uart_pkg::*;
import processor_pkg::*;
import global_pkg::*;
module top_tb_p03;

	logic clk;
	logic rst;
	logic rx_interrupt;
	data_t data;
	
	logic tx;
	logic ready;
	logic full_A;
	logic empty_A;
	

top_p03_tb DUV
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
	# 0 rx_interrupt = 1'b0;
	# 4 rx_interrupt = 1'b0;
	
	# 6 rx_interrupt = 1'b1;	
	# 8 data = 8'h FE;
	# 10 rx_interrupt = 1'b0;
	
	# 26 rx_interrupt = 1'b1;
	# 28 data = 8'h 03;
	# 30 rx_interrupt = 1'b0;
	
	# 46 rx_interrupt = 1'b1;
	# 48 data = 8'h 01;
	# 50 rx_interrupt = 1'b0;
	
	# 66 rx_interrupt = 1'b1;
	# 68 data = 8'h 04;
	# 70 rx_interrupt = 1'b0;
	
	# 106 rx_interrupt = 1'b1;	
	# 108 data = 8'h EF;
	# 110 rx_interrupt = 1'b0;
	
	
	
	
	# 24 data = 8'h 03;
	# 24 data = 8'h 03;
	
	# 6 rx_interrupt = 1'b1;
	# 7 rx_interrupt = 1'b0;	

	# 7 data = 8'h EF;
	# 9 rx_interrupt = 1'b1;
	# 10 rx_interrupt = 1'b0;
end




endmodule

