`timescale 10ns / 100ps
module tb_P01;

//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

/** Input ports **/
logic clk;
logic rst;
logic start;
logic [DW-ONE:ZERO] multiplier;
logic [DW-ONE:ZERO] multiplicand;
	
/** Output ports **/
logic sign;
logic [DW_2-ONE:ZERO] product;

top_module P01(
	.clk(clk),
	.rst(rst),
	.start(start),
	.multiplier(multiplier),
	.multiplicand(multiplicand),
	
	.sign(sign),
	.product(product)
);

initial begin
        clk = 0;
        rst = 0;
	start = 0;
	multiplier = 8'b10000000;
	multiplicand = 8'b10000000;
    #2  rst = 1;	
	start = 1;
    #3	start = 0;
    #20
	multiplier = 8'b10000001;
	multiplicand = 8'b10000001;
	start = 1;
    #21
	start = 0;

    #100

    $stop;
end

always begin
    #1 clk <= ~clk;
end

endmodule

