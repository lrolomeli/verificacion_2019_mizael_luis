`timescale 10ns / 100ps
module tb_top_module;

logic clk;
logic rst;
logic start;
logic led_1hz;
logic led_state;

initial begin
        clk = 0;
        rst = 0;
	start = 0;
    #2  rst = 1;
	start = 1;
    #120000000 
    $stop;
end

always begin
    #1 clk <= ~clk;
end

endmodule

