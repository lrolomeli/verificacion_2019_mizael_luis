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
import uart_pkg::*;
`ifndef COUNTER
	`define COUNTER
module counter
(
	/** Input ports **/
	input clk,
	input rst,
	input enable,
	input timer_t count,
	
	output logic ovf
);

timer_t count_r;

always_ff@(posedge clk, negedge rst)begin: counter
	if(!rst)
		count_r <= '0;
	else if (enable)
	begin
		if(ovf)
			count_r <= '0;
		else
			count_r++;
	end
	else
		count_r <= '0;
end:counter

always_comb begin: comparator
	if(count_r == count-1'b1)
		ovf = 1'b1;    
   else
      ovf = 1'b0;
end


endmodule
`endif