/*********************************************************************************
* Module Name: ram_matrix.sv

* Description: memoria ram de la matriz  

* Inputs: 

* Outputs: 

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  09/04/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef RAM_MATRIX
    `define RAM_MATRIX
	 
//================================================================================
// Import the Packages
//================================================================================
import fifo_pkg::*;
import global_pkg::*;

module ram_matrix(
	/** Input ports **/
	input clk,	/* reloj 1*/
	input rd_en,	/* bandera de read */	
	input wr_en,	/* bandera de write */
	input M_address_t count_push,	/* direccion de escritura */
	input M_address_t count_pop,	/* direccion de lectura */
	input data_t data_in,		/* dato de entrada */
	//	input clk2, Para el uso de dos reloges 

	
	output data_t data_out /* dato de salida */
	
);

//-- Memoria
data_t  ram [MATRIX_SIZE-1:0];

	always_ff@(posedge clk)
	begin: WRITE   
			if(wr_en) /* Escritura de la memoria */
				ram[count_push] <= data_in;

	end:WRITE

	
	always_ff@(posedge clk /*clk2*/) begin: READ   
			if(rd_en) /* lectura */
				data_out <= ram[count_pop];

	end:READ
	
endmodule // ram

`endif