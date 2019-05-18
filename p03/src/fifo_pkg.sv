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

`ifndef FIFO_PKG
    `define FIFO_PKG_SV
import global_pkg::*;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Package Declaration
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
package fifo_pkg ;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Parameters
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    parameter  W_ADDR      = 8;			// ancho de la direcciones
    //parameter  W_DEPTH     = 2**W_ADDR;	// localidades de memoria[0 : W_DEPTH - 1]
	//parameter  W_DEPTH     = N*N;	// localidades de memoria[0 : W_DEPTH - 1]
	parameter  VECTOR_SIZE = 8;
	parameter  MATRIX_SIZE = 64;
	parameter  COUNT_N 	  = $clog2(VECTOR_SIZE);
	parameter  COUNT_N_N 	= $clog2(MATRIX_SIZE);
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Type defs
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

     typedef logic [W_ADDR-1:0]        				addr_t;
	 typedef logic [COUNT_N-1:0]       				address_t;
	 typedef logic [COUNT_N:0]       				counter_t;
	 typedef logic [COUNT_N_N-1:0]       			M_address_t;
	 typedef logic [COUNT_N_N:0]       				M_counter_t;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// States Machine
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	/** enum used to select type of register **/
	//typedef enum logic [1:0] {IDLE, POP, PUSH} STATE_FIFO_e;

	endpackage
`endif