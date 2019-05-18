/*********************************************************************************
* Module Name: FSM.sv

* Description: FSM to description hardwere   

* Inputs: clk, rst, A, B, enable, retro,

* Outputs: out

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  15/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef AND_START
	`define AND_START
	
//================================================================================
// Import the Packages
//================================================================================
import processor_pkg::*;
import global_pkg::*;

module processor
(
	/** Input ports **/
	input clk,
	input rst,
	input data_t A,
	input data_t B,
	input enable,
	input retro,
	
	/** Output ports **/	
	output data_t out
	
);

data_t product;

//MULTIPLICACION DEL PRODUCTO
assign product = A * B;

always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
	begin
		out <= FALSE; //limpiamos la salida 
	end
	
	else if(enable)
	begin
		out <= product + out; //si esta saca el producto y lo suma con lo anterior 
	end
	else if(retro)
	begin
		out <= FALSE; //saca un cero 
	end
	else
	begin 
		out <= out; //mantiene el valor 
	end

end

endmodule
`endif