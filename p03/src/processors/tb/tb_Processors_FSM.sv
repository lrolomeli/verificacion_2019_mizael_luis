timeunit 1ps; //It specifies the time unit that all the delay will take in the simulation.
timeprecision 1ps;// It specifies the resolution in the simulation.

import global_pkg::*;
module tb_Processors_FSM;

	logic clk;
	logic rst;
	logic start;
	logic load;
	logic A;
	logic B;
	
	logic pop;
	logic ov_counter;
	uint2_t sel;
	logic done;

top_processors p03
(
	.clk(clk),
	.rst(rst),
	.start(start),
	.load(load),
	.A(A),
	.B(B),
	
	.pop(pop),
	.ov_counter(ov_counter),
	.sel(sel),
	.done(done)
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
	# 0 A = 1'b1;
	# 0 B = 1'b1;
	# 0 start = 1'b0;
	# 2 start = 1'b1;
	# 4 start = 1'b0;	
	# 14 load = 1'b0;
	# 15 load = 1'b1;
	# 20 load = 1'b0;

	
	
	# 25 load = 1'b1;
	# 30 load = 1'b0;

	# 35 load = 1'b1;
	# 40 load = 1'b0;

	# 45 load = 1'b1;
	# 50 load = 1'b0;

	# 55 load = 1'b1;
	# 60 load = 1'b0;

	# 65 load = 1'b1;
	# 70 load = 1'b0;
	
	
    	$stop;
end

endmodule

