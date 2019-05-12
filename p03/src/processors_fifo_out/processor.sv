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
logic flag;

assign product = processor.A*processor.B;
assign result = (processor.retro) ? (product + processor.out) : product;

always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
	begin
		processor.done <= '0;
		processor.out <= '0;
		flag <= 1'b1;
	end
	
	else if(processor.enable && flag)
	begin
		processor.out <= result;
		processor.done <= 1'b1;
		flag <= '0;
	end
	else
	begin 
		processor.out <= processor.out;
		processor.done <= 1'b0;
		flag <= 1'b1;
	end

end

endmodule
