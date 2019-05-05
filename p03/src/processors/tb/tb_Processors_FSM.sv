timeunit 1ps; //It specifies the time unit that all the delay will take in the simulation.
timeprecision 1ps;// It specifies the resolution in the simulation.

import global_pkg::*;
module tb_Processors_FSM;

	logic clk;
	logic rst;
	logic start;
	logic A;
	logic B;
	
	logic pop;
	logic push;

top_processors p03
(
	.clk(clk),
	.rst(rst),
	.start(start),
	.A(A),
	.B(B),
	
	.push(push)
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
	
    	$stop;
end

endmodule

