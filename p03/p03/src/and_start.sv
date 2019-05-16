/*********************************************************************************
* Module Name: and_start.sv

* Description: el modulo aplica una compuerta and a dos datos.  

* Inputs: a, b, clr, clk, rst,

* Outputs: start

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef AND_START
	`define AND_START

//================================================================================
// Import the Packages
//================================================================================
import global_pkg::*;

	
module and_start
(
	/** Input ports **/
	input a,
	input b,
	input clr,
	input clk,
	input rst,
	
	/** output ports **/
	output logic start
);


logic out; /* Dato auxiliar para analizar el dato */
logic flag; /* Bandera utilizada  */


assign out = a & b; /* Operacion bit a bit */


always_ff@(posedge clk, negedge rst)
begin
	if(~rst)
	begin
		/* Valores despues de un reset */
		start <= FALSE;
		flag <= FALSE;
	end
	else 
	begin
		start <= FALSE;
		
		if(out && ~flag)//si ya estan listos los datos comenzamos la operacion.
		begin
			flag <= TRUE;
			start <= TRUE;//start debe estar en un por un ciclo de reloj.
		end
		
		if(clr)
			flag <= FALSE;	//limpia la bandera si es correcto 
	end
end

endmodule
`endif