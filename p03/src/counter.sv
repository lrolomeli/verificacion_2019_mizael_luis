/*********************************************************************************
* Module Name: counter.sv

* Description: Es un contador

* Inputs: clk, rst, enable, count,

* Outputs: ovf

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef COUNTER
	`define COUNTER

//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;
import global_pkg::*;

module counter
(
	/** Input ports **/
	input clk,
	input rst,
	input enable,
	input timer_t count,

	/** Output ports **/
	output logic ovf
);

timer_t count_r; //variable para contar

always_ff@(posedge clk, negedge rst)begin: counter
	if(!rst)
		count_r <= FALSE;
	else if (enable)
	begin
		if(ovf)
			count_r <= FALSE; //reiniciamos el contador
		else
			count_r++; //continuamos el conteo
	end
	else
		count_r <= FALSE; //reiniciamos el contador
end:counter

always_comb begin: comparator
	if(count_r == count-1)
		ovf = TRUE; //encendemos la bandera de overflow
   else
	ovf = FALSE; //apagamos la bandera de overflow
end


endmodule
`endif