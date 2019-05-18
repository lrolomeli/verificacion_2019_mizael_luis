import global_pkg::*;

module top_p03
(
	input clk,
	input rst,
	input rx,
	
	output parity_err,
	output tx,
	output ready,
	output full_A,
	output empty_A
	
);

`ifdef MODELSIM
`endif

data_t data_w;
data_t result_w;
nibble_t N_w;
logic enable_n_w;
logic push_A_w;
logic push_B_w;
logic transmit_w;
logic clear_w;
logic clear_interrupt_w;

top_cmd top_cmd_inst (
	.*,
	.transmit(transmit_w),
	.tx_data(result_w),

	.rcvd_data(data_w),
	.push_A(push_A_w),
	.push_B(push_B_w),
	.enable_n(enable_n_w),
	.clear(clear_w)
	
);	
	


nibb_reg size_register
(
	.*,//clk,rst
	.enb(enable_n_w),
	.in(data_w[NIBBLE-1:0]),
	.out(N_w)
);


top_processors top_processors_inst
(
	.uart(data_w),
	.*,
	.push_A(push_A_w),
	.push_B(push_B_w),
	.clear(clear_w),
	.N(N_w),
	
	.transmit(transmit_w),
	.full_A(full_A),
	.empty_A(empty_A),
	.ready(ready),
	.result_uart_w(result_w)
);



endmodule
