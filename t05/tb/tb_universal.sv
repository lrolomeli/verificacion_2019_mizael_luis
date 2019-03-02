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
	selector = 0;
	inp = 0;
    #2  rst = 1;
	enable = 1;
	l_s = 1;
	inp = 13;
    #5	l_s = 0;
    #11 l_s = 1;
    #12 selector = 1;
	l_s = 0;
	inp = 13;
    #20	l_s = 0;
    #26 l_s = 1;
    #27 selector = 2;
	l_s = 0;
	inp = 13;
    #30	l_s = 0;
    #36 l_s = 1;
    #37 selector = 3;
	l_s = 0;
	inp = 13;
    #40	l_s = 0;
    #46 l_s = 1;
    #47 selector = 4;
	l_s = 0;
	inp = 13;
    #50	l_s = 0;
    #56 l_s = 1;
    #57 selector = 5;
	l_s = 0;
	inp = 13;
    #60	l_s = 0;
    #66 l_s = 1;
    #67 selector = 6;
	l_s = 0;
	inp = 13;
    #70	l_s = 0;
    #76 l_s = 1;
    #77 selector = 7;
	l_s = 0;
	inp = 13;
    #80	l_s = 0;
    #86 l_s = 1;
    #87 selector = 8;
	l_s = 0;
	inp = 13;
    #90	l_s = 0;
    #96 l_s = 1;
    #97 selector = 9;
	l_s = 0;
	inp = 13;
	
    #150000
    $stop;
end

always begin
    #1 clk <= ~clk;
end

endmodule

