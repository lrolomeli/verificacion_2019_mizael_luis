/*********************************************************************************
* Description: Global Package

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  01/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

`ifndef PROCESSOR_PKG_SV
    `define PROCESSOR_PKG_SV
import global_pkg::*; 
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Package Declaration
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
package processor_pkg ;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Parameters
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Type defs
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	
	typedef logic [3-1:0]       					Ncounter_t;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// States Machine
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	/** enum used to select type of register **/
	typedef enum logic [2:0] {NP, LOAD, OP, RESULT, TRANSMIT, TRANSMITING, POP_RES} STATE_e;
	 
endpackage
`endif