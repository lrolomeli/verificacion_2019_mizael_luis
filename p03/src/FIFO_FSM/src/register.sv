/*********************************************************************************
* Module Name: FSM.sv

* Description: FSM to FIFO  

* Inputs: 

* Outputs: 

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  09/04/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

//================================================================================
// Import the Packages
//================================================================================
`ifndef REG_DATA
    `define REG_DATA

import fifo_pkg::*;
	 
module register(
	/** Input ports **/
	input clk,	/* reloj 1*/
	input rst,
	input data_t datain,
	
	output data_t dataout
);

always_ff@(posedge clk, negedge rst)
begin: counter
	if(~rst)
		dataout <= '0;
	else 
		dataout <= datain;
	
end

endmodule 
`endif	