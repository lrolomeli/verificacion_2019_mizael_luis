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
import Pkg_Debouncer::*;

module debouncer
(
	/** Input ports **/
	input clk,
	input	rst, 
	input start,

	/** Output ports **/
	output logic db_out													
);
	
	always_ff@(posedge clk, negedge rst)
	begin: debouncer
	
		if(~rst) /** Clean registers **/
		begin
			DFF1 <= BIT_ZERO;
			DFF2 <= BIT_ZERO;
			counter <= BIT_ZERO;
			db_out <= BIT_ZERO;
		end
		
		else
		begin

			DFF1 <= start;		/** Input to ff1 **/
			DFF2 <= DFF1;		/** Of ff1 to ff2 **/
			
			if((DFF1 ^ DFF2) || start)	/** If ff1 and ff2 are differents, result is 1 **/
			begin
				counter <= BIT_ZERO;	/** clean counter **/
			end
			
			else	/** ff1 and ff2 are equals, ckeck to couenter finished **/
			begin
			
				if(counter == COUNT)
				begin
					/** check the couter have same value count and clean count **/
					db_out <= BIT_ONE;	//si termina de contar asigna la salida como la entrada
					counter <= BIT_ZERO;
				end
				
				else
				begin
					/** counter count to max value **/
					db_out <= BIT_ZERO;
					counter <= counter + BIT_ONE;
				end
				
			end

		end

	end: debouncer

endmodule


