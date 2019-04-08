`timescale 10ns / 100ps
module tb_p02;
parameter N = 4;

	logic clk;
	logic rst;
	logic load;
	logic op;
	logic clear;
	logic [N-1:0] Q;
	logic [N-1:0] M;
	
	logic [2*N:0]product;

top_md p02
(
	.clk(clk),
	.rst(rst),
	.load(load),
	.op(op),
	.clear(clear),
	.Q(Q),
	.M(M),
	
	.product(product)
);

initial begin
        clk = 0;
        rst = 0;
	load = 1;
	clear = 0;
	op = 1;
	Q = 4'b0111;
	M = 4'b0011;
    #2  rst = 1;
    #5	load = 0;
    #10
    #11 rst = 0;
    	load = 1;
    	op = 0;
    #12 rst = 1;
    #15	load = 0;
    #20
    	

    $stop;
end

always begin
    #1 clk <= ~clk;
end

endmodule

