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

`ifndef UART_PKG_SV
    `define UART_PKG_SV
	 
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Package Declaration
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
package uart_pkg ;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Parameters
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	parameter  W_DATA      = 8;
	
	// Parameter Declarations
	parameter FPGA_RATE = 50000000;
	parameter RATE = 115200; //HERTZ
	parameter COUNT = FPGA_RATE / (RATE);
	parameter HALFCOUNT = COUNT / 2;
	parameter BITS = $clog2(COUNT);
	
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
	typedef logic [BITS:0]								timer_t;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// States Machine
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	/** enum used to select type of register **/
	//typedef enum logic [2:0] {IDLE, POP, OP, OVERFLOW, RESULT} STATE_e;
	//typedef enum logic [1:0] {WAIT, SYNC, STORE} STATE_RX_e;
	typedef enum logic [3:0] {IDLE, START, BIT1, BIT2, BIT3, BIT4, BIT5, BIT6, BIT7, BIT8, PARITY, STOP} UART_STATE_e;
endpackage
`endif