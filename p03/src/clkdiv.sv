/*********************************************************************************
* Module Name:  
*	counter.sv
* Description:
*	Connections of all modules used on the design.
*	signal.
* Inputs:
*	-fpga clock signal
*	-reset
* Outputs:
*	-divided clock signal
* Version:
*	1.0
* Company: 
*	ITESO
* Engineers: 
*	Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez
* Create Date:  
*	04/02/2019
* Project Name: 
*	clock_divider
* Target Devices: 
*	FPGA ALTERA DE2-115
* Tool versions: 
*	Quartus Prime
*********************************************************************************/
import uart_pkg::*;

`ifndef CLKDIV
	`define CLKDIV

module clkdiv
(
	// Input Ports
	input clk,
	input rst,
	
	//Output Ports
	output logic clk_div
);

timer_t time_count;

always_ff@(posedge clk, negedge rst)
begin: Counter

	if (~rst)
	begin
		time_count <= '0;
		clk_div <= '0;
	end
	
	else
	begin
		if (time_count == HALFCOUNT)
		begin
			time_count <= '0;
			clk_div <= ~clk_div;
		end
		
		else
		begin
			time_count++;
			clk_div <= clk_div;
		end
	end

	
end: Counter

endmodule

`endif