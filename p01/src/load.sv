/*********************************************************************************
* Module Name: Load.sv

* Description: Load data to diferents registers  

* Inputs: clk, rst, l_s, multiplier, multiplicand

* Outputs: [DW-1:0] rgstr1, [DW_2-1:0] rgstr2

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
module load
(

	/** Input ports **/
	input clk,
	input rst,
	input l_s, 
	input [DW-ONE:ZERO] multiplier,
	input [DW-ONE:ZERO] multiplicand,
	
	/** oUTput ports **/
	output logic [DW-ONE:ZERO] rgstr1,	//Entrada del multiplier registrada
	output logic [DW_2-ONE:ZERO] rgstr2	//Entrada del multiplicand registrada
//Esta entrada es la que utilizamos para realizar la suma secuencial con el producto
//Por lo tanto debe tener el mismo ancho de bus que el resultado.
//Ademas requerimos que no se pierdan los datos de multiplicand cuando se hace un shift
//left y como vamos a hacer DW shift lefts si no fuera el tamano de DW_2  perderiamos datos.
);



always_ff@(posedge clk, negedge rst)
begin: always_MS

	if(~rst)	/** Clean registers **/
	begin
		rgstr1 <= ZERO;	
		rgstr2 <= ZERO;
	end
	
	else
	begin
		
      if (l_s)	/** Load data to register **/
		begin
		   rgstr1 <= multiplier[DW-TWO:ZERO];
			rgstr2 <= multiplicand[DW-TWO:ZERO];
		end

		else
		begin	/** assing data to register **/
			rgstr1 <= rgstr1;
			rgstr2 <= rgstr2;
		end

	end

end: always_MS

endmodule
