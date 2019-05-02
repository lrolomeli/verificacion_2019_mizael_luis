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
import global_pkg::*;

module processor
(
	/** Input ports **/
	input clk,
	input rst,	
	processors_if.proc processor
	
);

data_t result;
data_t product;


assign product = processor.A*processor.B;
assign result = (processor.retro) ? (product + processor.prev) : product;

always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
	begin
		processor.done <= '0;
		processor.out <= '0;
	end
	
	else if(processor.enable)
	begin
		processor.out <= result;
		processor.done <= 1'b1;
	end
	else
	begin 
		processor.out <= '0;
		processor.done <= 1'b0;
	end

end

endmodule
