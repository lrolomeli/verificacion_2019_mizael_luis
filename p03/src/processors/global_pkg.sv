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

`ifndef GLOBAL_PKG_SV
    `define GLOBAL_PKG_SV
	 
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Package Declaration
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
package global_pkg ;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Parameters
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   parameter  W_DATA      = 5;
   parameter  W_ADDR      = 12;
   parameter  W_DEPTH     = 2**W_ADDR;
	parameter  N 		     = 4;
	parameter  COUNT_N 	  = N;

	/*

	parameter C = $clog2(2*N);
	parameter FPGA_CLK = 50000000;
	parameter MILLIS = 20;
	parameter COUNT = (FPGA_CLK / MILLIS);
	parameter BITS = $clog2(COUNT);
	*/

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Type defs
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    typedef logic [W_DATA-1:0]        				data_t;
    typedef logic [W_ADDR-1:0]        				addr_t;
	 typedef logic [COUNT_N-1:0]       				counter_t;
	 typedef logic [W_DATA : 0] [N-1:0] [N-1:0] 	matrix_t;	 
	 typedef logic [W_DATA : 0] [N-1:0] 			vector_t;
	 typedef logic [1:0]									uint2_t;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// States Machine
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	/** enum used to select type of register **/
	typedef enum logic [2:0] {IDLE, POP, OP, OVERFLOW, RESULT} STATE_e;
	 
	 
endpackage
`endif