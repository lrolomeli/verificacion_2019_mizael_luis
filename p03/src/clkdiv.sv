/*********************************************************************************
* Module Name: clkdiv.sv


* Description: FSM to description hardwere

* Inputs:	clk, rst,

* Outputs:	clk_div

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef CLKDIV
	`define CLKDIV
//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;
import global_pkg::*;


module clkdiv
(
	// Input Ports
	input clk,
	input rst,

	//Output Ports
	output logic clk_div
);

timer_t time_count; //contador

always_ff@(posedge clk, negedge rst)
begin: Counter

	if (~rst)
	begin
		//valor del contador despues del reset
		time_count <= FALSE;
		clk_div <= FALSE;
	end

	else
	begin
		if (time_count == HALFCOUNT)
		begin
			time_count <= FALSE; //reiniciamos el contador
			clk_div <= ~clk_div; //negamos la señal
		end

		else
		begin
			time_count++; //continua la cuenta
			clk_div <= clk_div; //mantenemos el valor
		end
	end


end: Counter

endmodule

`endif