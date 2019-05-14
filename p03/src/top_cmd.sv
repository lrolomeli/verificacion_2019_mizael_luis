import uart_pkg::*;
import global_pkg::*;
module top_cmd
(
	input clk,
	input rst,
	input rx,
	input transmit,
	input data_t tx_data,
	
	output data_t rcvd_data,
	output parity_err,
	output tx,
	
	output push_A,
	output push_B,
	output enable_n,
	output clear
);


data_t data_w;
wire rx_interrupt_w;
wire clear_interrupt_w;

assign rcvd_data = data_w;

uart uart_inst
(
	.*,
	.clear_interrupt(clear_interrupt_w),
	
	.rx_interrupt(rx_interrupt_w),
	.rx_data(data_w)

);

cmd_fsm cmd_fsm_inst
(
	.*,
	.uart_data(data_w),
	.rx_interrupt(rx_interrupt_w),
	.clear(clear),
	
	.clear_interrupt(clear_interrupt_w)
);



endmodule
