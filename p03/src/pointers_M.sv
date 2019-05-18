/*********************************************************************************
* Module Name: pointers_M.sv

* Description: este modulo sirve tener las direcciones de la fifo de la matruz, y de la misma manera ver si esta llena o vacia 

* Inputs: clk, rst, push, pop, N,

* Outputs: count_push, count_pop, empty, full, ready

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  15/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef POINTERS_M
    `define POINTERS_M

//================================================================================
// Import the Packages
//================================================================================
import fifo_pkg::*;
import global_pkg::*;


module pointers_M
(
	/** Input ports **/
	input clk,
	input rst,
	input push,
	input pop,
	input nibble_t N,
	
	output M_counter_t count_push,	
	output M_counter_t count_pop,
	output logic empty,
	output logic full,
	output logic ready
);

logic [5:0] count_N;

assign count_N = N*N;

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
	//comparacion de indices para ver si esta vacia 
	if(count_push == count_pop)
		empty = TRUE;
	else
		empty = FALSE;
	
	//comparacion de indices para ver si esta llena 
	if(((count_push[COUNT_N_N-1:0] == count_pop[COUNT_N_N-1:0]) ) && (count_push[COUNT_N_N] != count_pop[COUNT_N_N]))
		full = TRUE;
	else
		full = FALSE;
	
	//comparacion de indices para ver si ya se pueden realizar operaciones
	if(count_push)
		ready = (count_push == count_N) ? 1'b1 : 1'b0;
	else
		ready = 1'b0;

end: FULL_EMPTY	


endmodule

`endif