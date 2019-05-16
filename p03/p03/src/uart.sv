/*********************************************************************************
* Module Name: UART.sv

* Description: MODULO DE UART TX Y RX.  

* Inputs: clk, rst, rx, transmit, data_t tx_data, clear_interrupt,

* Outputs: rx_interrupt, parity_err, rx_data, tx

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef UART
	`define UART 
	
//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;
import global_pkg::*;

module uart
(	
	/* Input ports */
	input clk,
	input rst,
	input rx,
	input transmit,
	input data_t tx_data,
	input clear_interrupt,
	
	/* Output ports */
	output rx_interrupt,
	output parity_err,
	output data_t rx_data,
	output tx
	
);

//creacion de modulos tx y rx para uart 
rx_top rx_top_inst
(
	.*
);

tx_top tx_top_inst
(
	.*
);

endmodule

`endif