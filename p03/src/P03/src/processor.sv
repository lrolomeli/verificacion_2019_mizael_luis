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


module processor
(
	/** Input ports **/
	input clk,
	input rst,	
	processors_if.proc p
	
);

data_t result;
data_t product;

assign product = p.A*p.B;
assign result = (p.retro) ? (product + p.out) : product;

always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
	begin
		p.done <= '0;
		p.out <= '0;
	end
	
	else if(p.enable)
	begin
		p.out <= result;
		p.done <= 1'b1;
	end
	else
	begin 
		p.out <= p.out;
		p.done <= 1'b0;
	end

end

endmodule
