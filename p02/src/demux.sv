/*********************************************************************************
* Module Name: demux

* Description: demus

* Inputs:	load, sel

* Outputs: load_x, load_y

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/04/2019

* Project Name: P02

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module demux
(
	/** Input ports **/
	input clk,
	input rst,
	input load,

	/** Output ports **/
	output load_y,
	output load_x

);

logic sel;

always_ff@(posedge clk, negedge rst)
begin
	if(~rst)
	begin
		sel <= '0;
	end
	else
	begin
		if(load)
			sel <= ~sel;
		else
			sel <= sel;
	end
	
end

/** the values tu register are load **/
assign load_y = (sel) ? load : '0;
assign load_x = (sel) ? '0 : load; 


endmodule
