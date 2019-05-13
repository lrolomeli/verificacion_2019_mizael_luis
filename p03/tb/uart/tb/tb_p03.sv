`timescale 10ns / 100ps

module tb_p03;
import uart_pkg::*;
	logic clk;
	logic rst;
	data_t tx_data;
	logic transmit;
	logic serial;
	
	data_t rx_data;
	logic parity_err;
	
top uart
(
	// Port declarations
	.rst(rst),				//senal de reset
	.clk(clk),
	.tx_data(tx_data),
	.transmit(transmit),
	.rx(serial),
	
	.rx_data(rx_data),
	.tx(serial),
	.parity_err(parity_err)
);

initial begin
    clk = 0;
    rst = 0;
    tx_data = 8'b01010101;
    transmit = 0;
#4	rst = 1'b1;
    transmit = 1'b1;
    
#868 transmit = 0;	
#100000
    $stop;
end

always begin
    #1 clk <= ~clk;
end

endmodule

