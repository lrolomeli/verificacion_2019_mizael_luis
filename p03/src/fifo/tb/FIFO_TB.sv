
timeunit 1ps; //It specifies the time unit that all the delay will take in the simulation.
timeprecision 1ps;// It specifies the resolution in the simulation.

module FIFO_TB;

	// Parameter Declarations
parameter Word_Length = 8;
parameter Depth_Of_FIFO = 8;

// Input Ports
bit clk;
bit rst;
bit pop;
bit push;
bit [Word_Length-1:0] data;

// Output Ports
bit full;
bit empty;
bit [Word_Length-1:0] rd_data;



/********************* Device Under Verification **************/
top DUV
(
	// Input Ports
	.clk(clk),
	.rst(rst),
	.pop(pop),
	.push(push),
	.data(data),

	// Output Ports
	.full(full),
	.empty(empty),
	.rd_data(rd_data)
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
	# 80 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b0;
end 
/*----------------------------------------------------------------------------------------*/
initial begin 
	# 0  push = 0;
	# 10  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 0;
	# 4  push = 1'b1;
	# 4  push = 0;
	# 4  push = 1'b1;
	# 4  push = 0;
	# 4  push = 1'b1;
	# 4  push = 0;
	# 4  push = 1'b1;
	# 4  push = 0;
end
/*----------------------------------------------------------------------------------------*/ 
initial begin
	# 0  data = 1'b0;
	# 8  data = 8;
	# 4  data = 7;
	# 4  data = 6;
	# 4  data = 5;
	# 4  data = 0;
	# 4  data = 4;
	# 4  data = 0;
	# 4  data = 3;
	# 4  data = 0;
	# 4  data = 2;
	# 4  data = 0;
	# 4  data = 1;
end


/*--------------------------------------------------------------------*/



endmodule
 
 
/*************************************************************/
/*************************************************************/

 
