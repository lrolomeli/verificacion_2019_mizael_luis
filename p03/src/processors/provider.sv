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

module provider
(
	/** Input ports **/
	input clk,
	input rst,
	input A,
	input B,
	input pop,
	processors_if.data client
	
);



always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
	begin
		client.A <= '0;
		client.B <= '0;
	end
	else
	begin
		if(pop)
		begin
			client.A <= A;
			client.B <= B;
		end
		else
		begin
			client.A <= client.A;
			client.B <= client.B;
		end
	end
	
end

endmodule
