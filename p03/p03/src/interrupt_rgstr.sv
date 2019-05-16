/*********************************************************************************
* Module Name: interrupt_rgstr.sv

* Description: habilita una se;al de control

* Inputs: clk, rst, rx_interrupt, clear,

* Outputs: out

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef INTERRUPT_RGSTR
	`define INTERRUPT_RGSTR

//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;

module interrupt_rgstr
(
	/** Input ports **/
	input clk,
	input rst,
	input rx_interrupt,
	input clear,

	/** Output ports **/
	output logic out
);

always_ff@(posedge clk, negedge rst) begin : rgstr
	if(~rst)
		out <= FALSE; //limpiamos el valor del registro al inicio
	else if(rx_interrupt)
		out <= TRUE;  //levantantamos la bandera
	else if(clear)
		out <= FALSE; //limpiamos la bandera
	else
		out <= out;   //mantenemos el valor de la bandera
end : rgstr

endmodule
`endif