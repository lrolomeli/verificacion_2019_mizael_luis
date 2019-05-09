import uart_pkg::*;

module tx_top
(
	input clk,
	input rst,
	input start,
	input data_t tx_data,
	
	output tx
	
);

logic clk_w;
logic enb_w;
logic [1:0] sel_w;
logic load_w;
logic data_out_w;
logic parity_w;
logic transmit;

`ifdef MODELSIM
assign transmit = start;
`endif

clkdiv clkdiv_inst
(
	.*,
	
	.clk_div(clk_w)
);

`ifndef MODELSIM
debounce debounce_inst
(
	.*,
	.clk(clk_w),
	.start(start),

	/** Output ports **/
	.db_out(transmit)
);
`endif

tx_fsm tx_fsm_inst
(
	.clk(clk_w),
	.rst(rst),
	.transmit(transmit),
	
	.sel(sel_w),
	.load(load_w),
	.enb(enb_w)

);

piso_lsb piso_inst
(
	.clk(clk_w),
	.rst(rst),
	.enb(enb_w),
	.load(load_w),
	.inp(tx_data),
	.out(data_out_w),
	.parity(parity_w)
	
);

tx_mux tx_mux_inst
(
	.sel(sel_w),
	.data(data_out_w),
	.parity(parity_w),
	
	.tx_out(tx)
);




endmodule
