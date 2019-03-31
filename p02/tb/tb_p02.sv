`timescale 10ns / 100ps
module tb_p02;
parameter N = 4;

	logic clk;
	logic rst;
	logic l_s;
	logic [N:0] q;
	logic [N-1:0] m;
	
	logic [(2*N)-1:0]product;

multiplication p02
(
	.clk(clk),
	.rst(rst),
	.l_s(l_s),
	.q(q),
	.m(m),
	
	.product(product)
);

initial begin
        clk = 0;
        rst = 0;
	l_s = 1;
	q = 5'b11110;
	m = 4'b1011;
    #2  rst = 1;
    #5	l_s = 0;
    $stop;
end

always begin
    #1 clk <= ~clk;
end

endmodule

