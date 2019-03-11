/*********************************************************************************
* Description: Global Package 

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  09/04/2019

* Project Name: P01

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Package Declaration
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
package Pkg_Global;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Type defs
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	typedef enum {FALSE, TRUE} bool;
	typedef enum {ZERO, ONE, TWO} NUMBERS;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Parameters
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	parameter BIT_ZERO = 1'b0;
	parameter BIT_ONE = 1'b1;
	parameter DW_2 = 16;
	parameter DW = 8;
	parameter DWlogb2 = $clog2(DW);
	//A este modulo le debe entrar una senal de control que indique si hay que empezar a contar
	//Por ejemplo ls 
	logic [DWlogb2:ZERO] count;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// States Machine
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	/** enum used to select type of register **/
	typedef enum bit [1:0] {IDLE, LOAD, MULTIPLYING} STATES;
	logic [1:0] state;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// wires
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

endpackage 


