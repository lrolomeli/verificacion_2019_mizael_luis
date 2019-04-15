`timescale 10ns / 100ps
module tb_p02;
parameter N = 4;

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
	op = 1;
	
	start = 0;
	data = 4'b0010;
	
    #2  rst = 1;
	load = 1;
    #2	load = 0;
    #5	data = 4'b0100;
    #1	load = 1;
    #2	load = 0;
    #10	start = 1;
    #2 start = 0;
    
    #12	op = 0;
    #2	start = 1;
    #2 start = 0;
    
	#12	op = 2;
    #2	start = 1;
    #2 start = 0;
    
    #12	
    #21
    	

    $stop;
end

always begin
    #1 clk <= ~clk;
end

endmodule

