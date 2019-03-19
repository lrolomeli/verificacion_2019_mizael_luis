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
package Global_Pkg;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Type defs
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
typedef enum {ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEEN, ELEVEN} NUMBERS;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Parameters
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	parameter W_IN = 7;
	parameter W_OUT = 11;
	parameter BIT_ZERO = 1'b0;
	parameter BIT_ONE = 1'b1;
	parameter BIT_THREE = 4'd3;



	parameter DW_2 = 16;
	parameter DW = 8;
	parameter DWlogb2 = $clog2(DW);
	parameter MAX_COUNT = 2097181;


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// States Machine
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	/** enum used to select type of register **/
	enum logic [1:0] {IDLE, LOAD, MULTIPLYING} state;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// wires
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

endpackage

