/*********************************************************************************
* Module Name: debouncer.sv

* Description: Remove error when push a button  

* Inputs: clk, rst, start 

* Outputs: db_out
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
import Pkg_Global::*;

module debounce
#(
	parameter FPGA_CLK = 50000000,
	parameter MILLIS = 20,
	parameter COUNT = (FPGA_CLK / MILLIS),
	parameter BITS = $clog2(COUNT)
)
(
	/** Input ports **/
	input clk,
	input	rst, 
	input start,

	/** Output ports **/
	output logic db_out													
);

logic [BITS:0]	counter;
logic DFF1;
logic DFF2;
	
always_ff@(posedge clk, negedge rst)
begin: debounce

	if(~rst) /** Clean registers **/
	begin
		DFF1 <= '0;
		DFF2 <= '0;
		counter <= '0;
		db_out <= '0;
	end
	
	else
	begin

		DFF1 <= start;		/** Input to ff1 **/
		DFF2 <= DFF1;		/** Of ff1 to ff2 **/
		
		if((DFF1 ^ DFF2) || start)	/** If ff1 and ff2 are differents, result is 1 **/
		begin
			counter <= '0;	/** clean counter **/
		end
		
		else	/** ff1 and ff2 are equals, ckeck to couenter finished **/
		begin
		
			if(counter == COUNT)
			begin
				/** check the couter have same value count and clean count **/
				db_out <= 1'b1;	//si termina de contar asigna la salida como la entrada
				counter <= '0;
			end
			
			else
			begin
				/** counter count to max value **/
				db_out <= '0;
				counter <= counter + 1'b1;
			end
			
		end

	end

end: debounce

endmodule
