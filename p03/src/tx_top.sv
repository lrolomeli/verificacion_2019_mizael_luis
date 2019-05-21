/*********************************************************************************
* Module Name: tx_top.sv

* Description: MODULO DE UART TX.  

* Inputs: clk, rst, transmit, tx_data,

* Outputs: tx

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef TX_TOP
	`define TX_TOP
	
//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;
import global_pkg::*;

module tx_top
(
	/* input ports */
	input clk,
	input rst,
	input transmit,
	input data_t tx_data,
	
	/* output ports */
	output tx,
	output working
	
);

//variables para el sistema
logic clk_w;
logic enb_w;
logic [1:0] sel_w;
logic load_w;
logic data_out_w;
logic parity_w;


//instancia de modulos para tx top
clkdiv clkdiv_inst
(
	.*,
	
	.clk_div(clk_w)
);

tx_fsm tx_fsm_inst
(
	.clk(clk_w),
	.rst(rst),
	.transmit(transmit),
	
	.sel(sel_w),
	.load(load_w),
	.enb(enb_w),
	.working(working)

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
`endif