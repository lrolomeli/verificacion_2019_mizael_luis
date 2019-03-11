/*********************************************************************************
* Module Name: control_unit.sv

* Description: Control Unit

* Inputs: clk, rst, start, l_s, done

* Outputs: init_FSM, enable

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

module control_unit 
(

	/** Input ports **/
	input clk,
	input rst,
	input start,
	input complete,
	
	/** Output ports **/
	output logic permit,
	output logic init_FSM

);

	always_ff@(posedge clk, negedge rst)
	begin 

		if(~rst)
		begin
			/** Clean outputs **/
			init_FSM <= BIT_ZERO; 
			permit <= BIT_ZERO;
		end
		
		else
		begin 
			if(start)
			begin
				/** Init FSM using start signal **/
				permit <= BIT_ZERO;
				init_FSM <= BIT_ONE;	
			end
			
			if(complete)
			begin
				//Mandar senal al multiplicador de que se mantenga el resultado
				//Hasta que alguien modifique las entradas o el start.
				permit <= BIT_ONE;
				init_FSM <= BIT_ZERO;
			end
			
		end 
		
	end 

endmodule
