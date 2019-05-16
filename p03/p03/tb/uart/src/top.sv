import uart_pkg::*;

module top
(
	input clk,
	input rst,
	input rx,
	input transmit,
	input data_t tx_data,
	
	output parity_err,
	output data_t rx_data,
	output tx
	
);


rx_top rx_top_inst
(
	.*
);

tx_top tx_top_inst
(
	.*,
	.start(transmit)
);

endmodule