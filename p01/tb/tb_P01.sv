`timescale 10ns / 100ps
module tb_P01;

//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;
import Pkg_Debouncer::*;

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
	multiplier = 4'b0111;
	multiplicand = 4'b1111;
    #2  rst = 1;
	start = 0;
    #MAX_COUNT
	multiplier = 4'b0111;
	multiplicand = 4'b1100;
    #MAX_COUNT
	multiplier = 4'b1010;
	multiplicand = 4'b0101;	
	start = 0;
	multiplier = 4'b0111;
	multiplicand = 4'b1100;
    #MAX_COUNT
	multiplier = 4'b1010;
	multiplicand = 4'b0101;
	start = 0;	
    #MAX_COUNT
	multiplier = 4'b1111;
	multiplicand = 4'b1100;
	start = 0;
    #MAX_COUNT
    $stop;
end

always begin
    #1 clk <= ~clk;
end

endmodule

