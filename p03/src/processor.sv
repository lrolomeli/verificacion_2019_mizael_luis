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
import processor_pkg::*;
import global_pkg::*;

module processor
(
	/** Input ports **/
	input clk,
	input rst,
	input data_t A,
	input data_t B,
	input enable,
	input retro,
	
	output data_t out
	
);

data_t product;

assign product = A * B;

always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
	begin
		out <= '0;
	end
	
	else if(enable)
	begin
		out <= product + out;
	end
	else if(retro)
	begin
		out <= '0;
	end
	else
	begin 
		out <= out;
	end

end

endmodule
