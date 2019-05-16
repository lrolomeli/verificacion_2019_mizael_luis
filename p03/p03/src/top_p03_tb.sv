import global_pkg::*;

module top_p03_tb
(
	input clk,
	input rst,
	input rx_interrupt,
	input data_t data,
	
	output tx,
	output ready,
	output full_A,
	output empty_A
	
);

`ifdef MODELSIM
`endif

data_t result_w;
nibble_t N_w;
logic enable_n_w;
logic push_A_w;
logic push_B_w;
logic transmit_w;
wire clear_interrupt_w;
data_t data_w;
logic clear_w;



assign data_w = data;


cmd_fsm cmd_fsm_inst
(
	.*,
	.enable_n(enable_n_w),
	.push_A(push_A_w),
	.push_B(push_B_w),
	.uart_data(data_w),
	.rx_interrupt(rx_interrupt),
	.clear(clear_w),
	
	.clear_interrupt(clear_interrupt_w)
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
