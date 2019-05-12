/*********************************************************************************
* Description: Global Package

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  01/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

module top_processors
(
	input clk,
	input rst,
	input start,
	input A,
	input B,
	
	output push

);

logic pop_done_w;
logic pop_w;

processors_if proc1_itf();

processor processor1_inst
(
	.*,
	.processor(proc1_itf)
);

provider provider1_inst
(
	.*,
	.pop(pop_w),
	.pop_done(pop_done_w),
	.client(proc1_itf)
);


fsm_processor fsm_p_inst
(
	.*,
	.pop(pop_w),
	.pop_done(pop_done_w),
	.p(proc1_itf)
);


endmodule
