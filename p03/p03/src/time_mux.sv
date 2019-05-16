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
import uart_pkg::*;

`ifndef TIME_MUX
	`define TIME_MUX
	
module time_mux
(
	/** Input ports **/
	input sel,
	input timer_t in_0,
	input timer_t in_1,
	
	output timer_t out
);

assign out = (sel) ? in_1: in_0;

endmodule

`endif