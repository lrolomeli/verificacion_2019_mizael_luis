/*********************************************************************************
* Module Name: top_cmd.sv

* Description:   

* Inputs: 

* Outputs: 

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef TOP_P03_TB
	`define TOP_P03_TB
	
//================================================================================
// Import the Packages
//================================================================================

import global_pkg::*;

module top_p03_tb
(
	input clk,
	input rst,
	input rx_interrupt,
	input data_t data,
	input working,
	
	output tx,
	output ready,
	output full_A,
	output empty_A,
	output clear_interrupt
	
);

data_t result_w;
nibble_t N_w;
logic enable_n_w;
logic push_A_w;
logic push_B_w;
logic transmit_w;
logic clear_w;

cmd_fsm cmd_fsm_inst(
	.*,
	.uart_data(data),
	
	.push_A(push_A_w),
	.push_B(push_B_w),
	.enable_n(enable_n_w),
	.clear(clear_w)
	
);	
	


nibb_reg size_register
(
	.*,//clk,rst
	.enb(enable_n_w),
	.in(data[NIBBLE-1:0]),
	.out(N_w)
);


top_processors top_processors_inst
(
	.uart(data),
	.*,
	.push_A(push_A_w),
	.push_B(push_B_w),
	.clear(clear_w),
	.N(N_w),
	.working(working),
	
	.transmit(transmit_w),
	.full_A(full_A),
	.empty_A(empty_A),
	.ready(ready),
	.result_uart_w(result_w)
);



endmodule
`endif