`timescale 10ns / 100ps
import Pkg_Global::*;
module tb_p02;

	logic clk;
	logic rst;
	logic load;
	logic [1:0] op;
	logic start;
	logic [N-1:0] data;
	
	logic [N-1:0] result;
	logic [N-1:0] remainder;

top_mdr p02
(
	.clk(clk),
	.rst(rst),
	.load(load),
	.op(op),
	.start(start),
	.data(data),
	
	.result(result),
	.remainder(remainder)
);

initial begin
    clk = 0;
    rst = 0;
	op = 2;
	load = 0;
	start = 2;
	data = 4'b0111;
	
    #2  rst = 1;
	load = 1;
    #2	load = 0;
    #5	data = 4'b0011;
    #1	load = 1;
    #2	load = 0;
    #10	start = 1;
    #2 start = 0;
    
    #10	op = 1;	
	#2 start = 1;
    #2 start = 0;
    
    #10	op = 0;	
	#2 start = 1;
    #2 start = 0;
    
    #12	
    #21
    	

    $stop;
end

always begin
    #1 clk <= ~clk;
end

endmodule

