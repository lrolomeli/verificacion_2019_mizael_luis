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
import global_pkg::*;
`ifndef POINTERS
    `define POINTERS

module pointers
(
	/** Input ports **/
	input clk,
	input rst,
	input push,
	input pop,
	input nibble_t N,
	
	output counter_t count_push,	
	output counter_t count_pop,
	output logic ready
//	output logic empty,
//	output logic full
);


always_ff@(posedge clk, negedge rst)
begin: counter
	if(~rst) begin
		count_pop <= '0;
		count_push <= '0;
	end
	
	else begin
		if(pop)
			count_pop <= (count_pop==N) ? '0 : count_pop + 1'b1;

		if(push)
			count_push <= (count_push==N) ? '0 : count_push + 1'b1;

	end
end:counter

always_comb begin
	if(count_push==N)
		ready = 1'b1;
	else
		ready = 1'b0;

end

endmodule

`endif