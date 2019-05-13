/*********************************************************************************
* Module Name: FSM.sv

* Description: FSM to description hardwere   

* Inputs: 

* Outputs: 

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  09/04/2019

* Project Name: P01

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

//================================================================================
// Import the Packages
//================================================================================
import fifo_pkg::*;
module fifo_matrix
(
	/** Input ports **/
	input clk,
	input rst,
	input pop,
	input push,
	input data_t data_in,
	
	output full,
	output empty,
	output data_t data_out
	
);

wire full_w;
wire empty_w;
M_address_t count_push_w;
M_address_t count_pop_w;
wire wr_en_w;
wire rd_en_w;
data_t data;


register register
(
	/** Input ports **/
	.clk(clk),	/* reloj 1*/
	.rst(rst),
	.datain(data_in),
	
	.dataout(data)
);

fsm_fifo fsm_fifo_inst
(
	/** Input ports **/
	.clk(clk),
	.rst(rst),
	.pop(pop),
	.push(push),
	.full(full_w),
	.empty(empty_w),
	
	.wr_en(wr_en_w),
	.rd_en(rd_en_w)
);


ram_matrix ramM(
	/** Input ports **/
	.clk(clk),	/* reloj 1*/
	.rd_en(rd_en_w),	/* bandera de read */	
	.wr_en(wr_en_w),	/* bandera de write */
	.count_push(count_push_w),	/* direccion de escritura */
	.count_pop(count_pop_w),	/* direccion de lectura */
	.data_in(data),		/* dato de entrada */
	//	input clk2, Para el uso de dos reloges 
	
	.data_out(data_out) /* dato de salida */
	
);


pointers_M pointers_M_inst
(
	/** Input ports **/
	.clk(clk),
	.rst(rst),
	.push(wr_en_w),
	.pop(rd_en_w),
	
	.count_push(count_push_w[COUNT_N_N-1:0]),	
	.count_pop(count_pop_w[COUNT_N_N-1:0]),
	.full(full_w),
	.empty(empty_w)
);

assign full = full_w;
assign empty = empty_w;

endmodule