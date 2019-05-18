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
`ifndef TOP_CMD
	`define TOP_CMD
	
//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;
import global_pkg::*;

module top_cmd
(
	input clk,
	input rst,
	input rx,
	input transmit,
	input data_t tx_data,
	
	output data_t rcvd_data,
	output parity_err,
	output tx,
	
	output push_A,
	output push_B,
	output enable_n,
	output clear
);


data_t data_w;
wire rx_interrupt_w;
wire clear_interrupt_w;

assign rcvd_data = data_w;

uart uart_inst
(
	.*,
	.clear_interrupt(clear_interrupt_w),
	
	.rx_interrupt(rx_interrupt_w),
	.rx_data(data_w)

);

cmd_fsm cmd_fsm_inst
(
	.*,
	.uart_data(data_w),
	.rx_interrupt(rx_interrupt_w),
	.clear(clear),
	
	.clear_interrupt(clear_interrupt_w)
);



endmodule
`endif