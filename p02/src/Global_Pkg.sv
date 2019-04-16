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
// Parameters
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	parameter N = 16;
	parameter C = $clog2(2*N);
	parameter FPGA_CLK = 50000000;
	parameter MILLIS = 20;
	parameter COUNT = (FPGA_CLK / MILLIS);
	parameter BITS = $clog2(COUNT);
	
	
	//segmentos
	parameter DEC_4 = 4;
	parameter TAM = ((N)/3)+1;
	parameter LENGTH = 4 * TAM;
	parameter N_SEG = 7;
	
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Type defs
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	typedef enum {FALSE, TRUE} bool;
	
	typedef logic [LENGTH-1:0] buses;
	typedef logic [7-1:0] segment;
	
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// States Machine
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	/** enum used to select type of register **/
	typedef enum logic [1:0] {IDLE, PROCESSING} STATE;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// wires
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

endpackage

