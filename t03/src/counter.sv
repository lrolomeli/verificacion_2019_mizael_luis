/*********************************************************************************
* Module Name:  
*	counter.sv
* Description:
*	Connections of all modules used on the design.
*	signal.
* Inputs:
*	-fpga clock signal
*	-reset
* Outputs:
*	-divided clock signal
* Version:
*	1.0
* Company: 
*	ITESO
* Engineers: 
*	Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez
* Create Date:  
*	04/02/2019
* Project Name: 
*	clock_divider
* Target Devices: 
*	FPGA ALTERA DE2-115
* Tool versions: 
*	Quartus Prime
*********************************************************************************/

module counter
#
(
	// Parameter Declarations
	parameter FPGA_RATE = 26'd50000000,
	parameter RATE = 7'd100, //HERTZ
	parameter COUNT = FPGA_RATE / (2 * RATE),
	parameter BITS = $clog2(COUNT)

)(
	// Input Ports
	input fpga_clk,
	input rst,
	
	//Output Ports
	output logic clk_div

);

logic [BITS:0] time_count;

always_ff@(posedge fpga_clk, negedge rst)
begin: Counter

	if (~rst)
	begin
		time_count <= '0;
		clk_div <= '0;
	end
	
   else if (time_count == COUNT)
	begin
		time_count <= '0;
		clk_div = ~clk_div;
	end
	
	else
	begin
		time_count <= time_count + 1'b1;
		clk_div = clk_div;
	end
	
end: Counter

endmodule