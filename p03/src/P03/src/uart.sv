import uart_pkg::*;
`ifndef UART
	`define UART
module uart
(
	input clk,
	input rst,
	input rx,
	input transmit,
	input data_t tx_data,
	input clear_interrupt,
	
	output rx_interrupt,
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
	.*
);

endmodule

`endif