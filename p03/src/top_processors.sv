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
import fifo_pkg::*;
import global_pkg::*;
module top_processors
(
	input data_t uart,
	input clk,
	input rst,
	input push_A,
	input push_B,
	input nibble_t N,
	input clear,
	
	output full_A,
	output empty_A,
	output ready,
	output transmit,
	output data_t result_uart_w
);

data_t A_w;
data_t B_w;
data_t out_w;

logic pop_done_w;
logic pop_w;
logic uart_push_w;
logic push_result_w;
logic pop_result_w;

logic start_w;
logic matrix_ready;
logic vector_ready;

logic p_enable_w;
logic p_retro_w;


fifo_matrix matrix(
	.*,
	.N(N),
	.full(full_A),
	.empty(empty_A),
	.pop(pop_w),
	.push(push_A),
	.data_in(uart),
	.ready(matrix_ready),

	.data_out(A_w)
);


fifo_vector vector(
	.*,
	.pop(pop_w),
	.push(push_B),
	.data_in(uart),
	.N(N),
	.ready(vector_ready),

	.data_out(B_w)
);

logic_and logic_and_inst
(
	/** Input ports **/
	.*,
	.a(vector_ready),
	.b(matrix_ready),
	
	.out(start_w)
);


fifo_vector fifo_result
(
	.*,
	.pop(pop_result_w),
	.push(push_result_w),
	.data_in(out_w),
	.N(N),
	.ready(ready),
	
	.data_out(result_uart_w)
);

processor processor1_inst
(
	.*,
	.A(A_w),
	.B(B_w),
	.enable(p_enable_w),
	.retro(p_retro_w),
	
	.out(out_w)
);


fsm_processor fsm_p_inst
(
	.*,
	.start(start_w),
	.N(N),
	.p_retro(p_retro_w),
	.p_enable(p_enable_w),
	
	.pop(pop_w),
	.push(push_result_w),
	.pop_result(pop_result_w),
	.transmit(transmit)
);



endmodule
