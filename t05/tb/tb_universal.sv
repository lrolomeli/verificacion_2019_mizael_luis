`timescale 10ns / 100ps
module tb_universal;

logic clk;
logic rst;
logic enable;
logic l_s;
logic [2:0] selector;
logic [3:0] inp;
logic [3:0] out;

universal u1(
.clk      (clk      ),
.rst      (rst      ),
.enable   (enable   ),
.inp      (inp      ),
.out      (out      ),
.selector (selector ),
.l_s      (l_s      )
);

initial begin
        clk = 0;
        rst = 0;
	enable = 0;
	l_s = 0;
	selector = 1;
	inp = 0;
    #2  rst = 1;
	enable = 1;
	l_s = 1;
	inp = 13;
    #5	l_s = 0;
    #15 l_s = 1;
    #18 selector = 0;
	l_s = 0;
	inp = 13;
	
    #150000
    $stop;
end

always begin
    #1 clk <= ~clk;
end

endmodule

