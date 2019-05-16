/*********************************************************************************
* Module Name: logic_xor.sv

* Description: el modulo aplica una compuerta xor a dos datos.

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
`ifndef LOGIC_XOR
    `define LOGIC_XOR

//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;

module logic_xor
(
	/** Input ports **/
	input a,
	input b,

    /** Output ports **/
	output out
);

assign out = a ^ b;

endmodule
`endif