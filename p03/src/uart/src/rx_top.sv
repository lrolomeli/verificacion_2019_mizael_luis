import uart_pkg::*;

module rx_top
(
	input clk,
	input rst,
	input rx,
	
	output parity_err,
	output data_t rx_data
);

timer_t count_w;
wire ovf_w;
wire sel_w;
wire enb_count_w;
wire enb_sipo_fsm;
wire enb_sipo;
wire enb_parity_fsm;
wire parity_w;
wire enb_parity;
wire parity;

rx_fsm rx_fsm_inst
(
	.*,
	.rx(rx),
	.ovf(ovf_w),
	
	.time_sel(sel_w),
	.enb_count(enb_count_w),
	.enb_sipo(enb_sipo_fsm),
	.enb_parity(enb_parity_fsm)
);

time_mux time_mux_inst
(
	.in_1(COUNT),
	.in_0(HALFCOUNT),
	.sel(sel_w),
	
	.out(count_w)
);


counter counter_inst
(
	/** Input ports **/
	.*,
	.enable(enb_count_w),
	.count(count_w),
	
	.ovf(ovf_w)
);

logic_and logic_and_sipo
(
	.a(ovf_w),
	.b(enb_sipo_fsm),
	
	.out(enb_sipo)
);

logic_and logic_and_parity
(
	.a(ovf_w),
	.b(enb_parity_fsm),
	
	.out(enb_parity)
);

sipo sipo_inst
(
	.*,
	.enb(enb_sipo),
	.inp(rx),
	.out(rx_data),
	.parity(parity_w)
);

logic_xor logic_xor_inst
(
	.a(parity_w),
	.b(rx),
	
	.out(parity)
);

register rgstr_parity
(
	.*,
	.enb(enb_parity),
	.in(parity),
	
	.out(parity_err)
);


endmodule
