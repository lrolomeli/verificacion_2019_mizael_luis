/*********************************************************************************
* Module Name: logic_and.sv

* Description: el modulo aplica una compuerta and a dos datos.

* Inputs: a, b

* Outputs: out

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef LOGIC_AND
    `define LOGIC_AND

//================================================================================
// Import the Packages
//================================================================================
import global_pkg::*;


module logic_and
(
	/** Input ports **/
	input a,
	input b,

    /** Output ports **/
	output out
);

assign out = a & b;

endmodule
`endif