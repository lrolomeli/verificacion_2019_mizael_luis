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
import global_pkg::*;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Package Declaration
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
package uart_pkg ;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Parameters
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	//parameter  W_DATA      = 8;
	
	// Parameter Declarations
	parameter FPGA_RATE = 50000000;
	parameter RATE = 115200; //HERTZ
	parameter COUNT = FPGA_RATE / (RATE);
	parameter HALFCOUNT = COUNT / 2;
	parameter BITS = $clog2(COUNT);
	
	
	parameter START_CMD = 8'h FE;
	parameter END_CMD = 8'h EF;
	parameter CMD1 = 8'h 1;
	parameter CMD2 = 8'h 2;
	parameter CMD3 = 8'h 3;
	parameter CMD4 = 8'h 4;
	parameter CMD5 = 8'h 5;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Type defs
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	typedef logic [BITS:0]								timer_t;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// States Machine
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	/** enum used to select type of register **/
	//typedef enum logic [2:0] {IDLE, POP, OP, OVERFLOW, RESULT} STATE_e;
	//typedef enum logic [1:0] {WAIT, SYNC, STORE} STATE_RX_e;
	typedef enum logic [3:0] {IDLE, START, BIT1, BIT2, BIT3, BIT4, BIT5, BIT6, BIT7, BIT8, PARITY, STOP} UART_STATE_e;
	//typedef enum logic [3:0] {IDLE, LENGTH, RCMD1, RCMD2, RCMD3, RCMD4, RCMD5, PUSH4, PUSH5, EF1, EF2, EF3, EF4, EF5} CMD_STATE_e
	typedef enum logic [2:0] {IDLECMD, LENGTH, COMMAND, RCMD1, RCMD2, RCMD3, RCMD4, RCMD5} CMD_STATUS_e;
	typedef enum logic [1:0] {WAIT4BYTE, CHECKSTATUS} CMD_STATE_e;
	
endpackage
`endif