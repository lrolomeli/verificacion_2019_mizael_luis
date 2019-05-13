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
import processor_pkg::*;
import fifo_pkg::data_t;
module top_processors
(
	input data_t uart,
	input pop_uart,
	input clk,
	input rst,
	input start,
	input uart_push,
	input [2:0] N,
	
	output full_A,
	output empty_A,
	output full_B,
	output empty_B,
	output full_out,
	output empty_out,
	
	output data_t result_uart_w
);

logic pop_done_w;
logic pop_w;
logic uart_push_w;
logic push_result_w;
logic pop_uart_out_w;

assign pop_uart_out_w = pop_uart;
assign uart_push_w = uart_push;

processors_if proc1_itf();


fifo_matrix matrix(
	.*,
	.full(full_A),
	.empty(empty_A),
	.pop(pop_w),
	.push(uart_push_w),
	.data_in(uart),

	.data_out(proc1_itf.data.A)
);


fifo_matrix vector(
	.*,
	.full(full_B),
	.empty(empty_B),
	.pop(pop_w),
	.push(uart_push_w),
	.data_in(uart),

	.data_out(proc1_itf.data.B)
);


fifo_vector fifo_result
(
	.*,
	.full(full_out),
	.empty(empty_out),
	.pop(pop_uart_out_w),
	.push(push_result_w),
	.data_in(proc1_itf.data.out),

	.data_out(result_uart_w)
);

processor processor1_inst
(
	.*,
	.p(proc1_itf)
);


fsm_processor fsm_p_inst
(
	.*,
	.pop(pop_w),
	.push(push_result_w),
	.p(proc1_itf)
);



endmodule
