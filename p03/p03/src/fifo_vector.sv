/*********************************************************************************
* Module Name: fifo_vector.sv

* Description: fifo que sirve para analizar los datos de entrada y salida del vector

* Inputs: clk, rst, pop, push, data_in, N,

* Outputs: data_out, ready

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef FIFO_VECTOR
	`define FIFO_VECTOR

//================================================================================
// Import the Packages
//================================================================================
import fifo_pkg::*;
import global_pkg::*;

module fifo_vector
(
	/** Input ports **/
	input clk,
	input rst,
	input pop,
	input push,
	input data_t data_in,
	input nibble_t N,

	/** Output ports **/
//	output full,
//	output empty,
	output data_t data_out,
	output ready

);

//cables para las conecciones
wire full_w;
wire empty_w;
address_t count_push_w;
address_t count_pop_w;
wire wr_en_w;
wire rd_en_w;
//data_t data;

/* registro que servia para atrasar el dato
//register register
//(
//	//Input ports
//	.clk(clk),
//	.rst(rst),
//	.datain(data_in),
//
//	.dataout(data)
//);
*/

/* por su funcionalidad no usa fsm
//fsm_fifo fsm_fifo_inst
//(
//
//	.clk(clk),
//	.rst(rst),
//	.pop(pop),
//	.push(push),
//	.full(full_w),
//	.empty(empty_w),
//
//	.wr_en(wr_en_w),
//	.rd_en(rd_en_w)
//);
*/

ram_vector ramV(
	/** Input ports **/
	.clk(clk),	/* reloj 1*/
	.rd_en(pop),	/* bandera de read */
	.wr_en(push),	/* bandera de write */
	.count_push(count_push_w),	/* direccion de escritura */
	.count_pop(count_pop_w),	/* direccion de lectura */
	.data_in(data_in),		/* dato de entrada */
	//	input clk2, Para el uso de dos reloges

	.data_out(data_out) /* dato de salida */

);


pointers pointers_inst
(
	/** Input ports **/
	.clk(clk),
	.rst(rst),
	.push(push),
	.pop(pop),
	.N(N),

	.count_push(count_push_w[COUNT_N-1:0]),
	.count_pop(count_pop_w[COUNT_N-1:0]),
	.ready(ready)
//	.full(full_w),
//	.empty(empty_w)
);

//assign full = full_w;
//assign empty = empty_w;

endmodule
`endif