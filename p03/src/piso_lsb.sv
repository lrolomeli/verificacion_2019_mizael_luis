/*********************************************************************************
* Module Name: piso_lsb.sv

* Description:   

* Inputs: clk, rst, enb, load, inp,

* Outputs: out, parity  

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/
`ifndef PISO_LSB
	`define PISO_LSB

//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;
import global_pkg::*;

module piso_lsb
(
	input               clk,    // Clock
	input               rst,    // asynchronous reset low active 
	input               enb,    // Enable
	input               load,   // load or shift
	input  data_t	     inp,    // data input
	output              out,    // Serial output
	output				  parity  // parity
);

data_t      rgstr_r;

always_ff@(posedge clk or negedge rst) begin: rgstr_label
    if(~rst)
        rgstr_r  <= FALSE;
    else if (enb) begin
        if (load)
            rgstr_r  <= inp;
        else 
            rgstr_r  <= {rgstr_r[0], rgstr_r[W_DATA-1:1]};
    end
end:rgstr_label

//claculo de la paridad de los bits 
assign parity = rgstr_r[0] ^ rgstr_r[1] ^ rgstr_r[2] ^ rgstr_r[3] ^ rgstr_r[4] ^ rgstr_r[5] ^ rgstr_r[6] ^ rgstr_r[7];
assign out  = rgstr_r[0];    // LSB bit is the first to leave

endmodule

`endif