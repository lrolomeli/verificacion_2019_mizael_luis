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
	parameter RATE = 1'd1, //HERTZ
	parameter COUNT = FPGA_RATE / (2 * RATE),
	parameter BITS = $clog2(COUNT)

)(
	// Input Ports
	input fpga_clk,
	input rst,
	input enable,
	
	//Output Ports
	output logic clk_div

);

logic [BITS:0] time_count;

always_ff@(posedge fpga_clk, negedge rst)
begin: Counter
	//Start to job 
	if (~rst)
	begin
		time_count <= '0;
		clk_div <= '0;
	end
	
	else
	begin
	
		if(enable)
		begin
			
			/** The toggle was applicate to signal “Clock divider” **/
			if(time_count == 0)
			begin
				clk_div = ~clk_div;
				time_count <= time_count + 1'b1;
			end
			
			/** The count was restarted because "time count" have the same 
			value that counter**/  
			else if (time_count == COUNT)
			begin
				time_count <= '0;				
			end
			
			/** The signal “clock divider” conserve her value and the count 
			of time added one unit **/	
			else
			begin
				time_count <= time_count + 1'b1;
				clk_div = clk_div;
			end
			
		end
		
	end

	
end: Counter

endmodule