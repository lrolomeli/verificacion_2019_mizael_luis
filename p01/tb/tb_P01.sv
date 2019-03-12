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
	start = 1;
	multiplier = 8'b01111111;
	multiplicand = 8'b11111111;
    #2  rst = 1;
	start = 0;
    #MAX_COUNT
	start = 1;
	multiplier = 8'b01111111;
	multiplicand = 8'b11111100;
    #MAX_COUNT
	start = 0;	
    #MAX_COUNT
	start = 1;
    #MAX_COUNT
    $stop;
end

always begin
    #1 clk <= ~clk;
end

endmodule

