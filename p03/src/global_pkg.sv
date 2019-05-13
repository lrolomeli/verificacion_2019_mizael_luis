/*********************************************************************************
* Description: Global Package

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  13/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

`ifndef GLOBAL_PKG_SV
    `define GLOBAL_PKG_SV
	 
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Package Declaration
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
package global_pkg ;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Parameters
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   parameter  W_DATA      = 8;			// ancho de los datos
	parameter NIBBLE = 4;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Type defs
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    typedef logic [W_DATA-1:0]        				data_t;
	 typedef logic [NIBBLE-1:0]						nibble_t;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// States Machine
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	/** enum used to select type of register **/
	 
endpackage
`endif