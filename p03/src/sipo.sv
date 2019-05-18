/*********************************************************************************
* Module Name: SiPo.sv

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
`ifndef SIPO
	`define SIPO

//================================================================================
// Import the Packages
//================================================================================
import uart_pkg::*;
import global_pkg::*;

module sipo
(
	input clk,
	input rst,
	input enb,
	input inp,
	output data_t out,
	output parity
);


always_ff@(posedge clk or negedge rst) begin: rgstr_label
    if(~rst)
        out  <= '0;
    else if (enb)
        out  <= {inp, out[W_DATA-1:1]};
end:rgstr_label

assign parity = out[0]^out[1]^out[2]^out[3]^out[4]^out[5]^out[6]^out[7];

endmodule
`endif