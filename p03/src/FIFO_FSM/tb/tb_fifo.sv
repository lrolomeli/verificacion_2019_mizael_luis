
timeunit 1ps; //It specifies the time unit that all the delay will take in the simulation.
timeprecision 1ps;// It specifies the resolution in the simulation.

import fifo_pkg::*;

module tb_fifo;

	// Parameter Declarations
parameter Word_Length = 8;
parameter Depth_Of_FIFO = 8;

// Input Ports
bit clk;
bit rst;
bit pop;
bit push;
data_t data_in;

// Output Ports
bit full;
bit empty;
data_t data_out;



/********************* Device Under Verification **************/
fifo DUV
(
	// Input Ports
	.clk(clk),
	.rst(rst),
	.pop(pop),
	.push(push),
	.data_in(data_in),

	// Output Ports
	.full(full),
	.empty(empty),
	.data_out(data_out)
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
	#3 rst = 1'b1;
end
/*----------------------------------------------------------------------------------------*/
initial begin 
	# 0 pop  = 1'b0;
	# 80 pop  = 1'b1;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
end 
/*----------------------------------------------------------------------------------------*/
initial begin 
	# 0  push = 0;
	# 10  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	
end
/*----------------------------------------------------------------------------------------*/ 
initial begin
	# 0  data_in = 1'b0;
	# 8  data_in = 8;
	# 4  data_in = 7;
	# 4  data_in = 6;
	# 4  data_in = 5;
	# 4  data_in = 0;
	# 4  data_in = 4;
	# 4  data_in = 0;
	# 4  data_in = 3;
	# 4  data_in = 0;
	# 4  data_in = 2;
	# 4  data_in = 0;
	# 4  data_in = 1;
end


/*--------------------------------------------------------------------*/



endmodule
 
 
/*************************************************************/
/*************************************************************/

 
