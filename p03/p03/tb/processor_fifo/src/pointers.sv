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

`ifndef POINTERS
    `define POINTERS

module pointers
(
	/** Input ports **/
	input clk,
	input rst,
	input push,
	input pop,
	
	output counter_t count_push,	
	output counter_t count_pop,
	output logic empty,
	output logic full
);


always_ff@(posedge clk, negedge rst)
begin: counter
	if(~rst) begin
		count_pop <= '0;
		count_push <= '0;
	end
	
	else begin
		if(pop)
			count_pop++;
		if(push)
			count_push++;
	end
end:counter


always_comb
begin: FULL_EMPTY 
	if(count_push == count_pop)
		empty = TRUE;
	else
		empty = FALSE;
	
	if(((count_push[COUNT_N-1:0] == count_pop[COUNT_N-1:0]) ) && (count_push[COUNT_N] != count_pop[COUNT_N]))
		full = TRUE;
	else
		full = FALSE;			
end: FULL_EMPTY	


endmodule

`endif