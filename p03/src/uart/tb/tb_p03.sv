`timescale 10ns / 100ps
parameter N = 8;
module tb_p03;

	logic clk;
	logic rst;
	logic [N-1:0] tx_data;
	logic transmit;
	logic serial;
	
	logic [N-1:0] rx_data;

uart p03
(
	// Port declarations
	.rst(rst),				//senal de reset
	.clk(clk),
	.tx_data(tx_data),
	.transmit(transmit),
	.serial_rx(serial),
	
	.rx_data(rx_data),
	.serial_tx(serial)
);

initial begin
    clk = 0;
    rst = 0;
    tx_data = 8'b01010101;
    transmit = 0;
#4	rst = 1'b1;
    transmit = 1'b1;
#2	transmit = 0;	

    $stop;
end

always begin
    #1 clk <= ~clk;
end

endmodule

