//Coder:          DSc Abisai Ramirez Perez
//Date:           03/31/2019
//Name:           sdp_dc_ram.sv
//Description:    This is the HDL of a single dual-port dual-clock random access memory. 

module top
import sdp_dc_ram_pkg::*;
(
input clk,
input rst,
input pop,
input push,
input [W_DATA-1:0] data,

output [W_DATA-1:0] rd_data,
output full,
output empty

);


sdp_dc_ram_if sdp_dc_ram_itf();

fifo fifo_inst(
.*,
// client ram interface
.cln_if(sdp_dc_ram_itf)
);

sdp_dc_ram sram(
// Core clock a
.clk_a(clk),
// Core clock b
.clk_b(clk),
// Memory interface
.mem_if(sdp_dc_ram_itf)

);

endmodule
