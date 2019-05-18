/*********************************************************************************
* Module Name: pointers.sv

* Description: Este modulo sirve para tener las direcciones en las fifos  

* Inputs: 

* Outputs: 

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  15/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef POINTERS
    `define POINTERS

//================================================================================
// Import the Packages
//================================================================================
import fifo_pkg::*;
import global_pkg::*;


module pointers
(
	/** Input ports **/
	input clk,
	input rst,
	input push,
	input pop,
	input nibble_t N,
	input clr,
	
	/** Input ports **/
	output counter_t count_push,	
	output counter_t count_pop,
	output logic ready

);


always_ff@(posedge clk, negedge rst)
begin: counter
	if(~rst) begin
		count_pop <= FALSE;
		count_push <= FALSE;
	end
	
	else begin
	
		if(pop)
			count_pop++;

		if(push)
			count_push++;
			
		if(clr)
			count_pop <= FALSE;

	end
end:counter

always_comb begin
	if(count_push==N)
		ready = TRUE;
	else
		ready = FALSE;

end

endmodule

`endif