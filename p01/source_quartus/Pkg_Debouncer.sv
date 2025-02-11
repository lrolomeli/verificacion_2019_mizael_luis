/*********************************************************************************
* Description: Debouncer

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
package Pkg_Debouncer;

//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Type defs
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Parameters
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//	parameter MILLIS = 20;		// (2^(20))/ 50 MHz = 20 ms debouncer time
//	parameter COUNT = 200;  // Max Counting with 20 bits
	
	//parameter FREQ = 50000000;
	//parameter MILLIS = 0.002;
	//parameter COUNT = 1000000; //FREQ * TIME_COUNT = 50MHz * 20ms
	parameter COUNT = 200; //FREQ * TIME_COUNT = 10kHz * 20ms
	parameter BITS = $clog2(COUNT);
	/** Logic counter **/ 
	logic [BITS : ZERO]	counter;							
	
	/** Input flip-flops **/
	logic DFF1;
	logic DFF2;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// States Machine
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// wires
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

endpackage 