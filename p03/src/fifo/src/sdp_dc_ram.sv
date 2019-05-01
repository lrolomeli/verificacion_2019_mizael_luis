//Coder:          DSc Abisai Ramirez Perez
//Date:           03/31/2019
//Name:           sdp_dc_ram.sv
//Description:    This is the HDL of a single dual-port dual-clock random access memory. 

`ifndef SDP_DC_RAM_SV
    `define SDP_DC_RAM_SV
module sdp_dc_ram 
import sdp_dc_ram_pkg::*;
(
// Core clock a
input   clk_a,
// Core clock b
input   clk_b,
// Memory interface
sdp_dc_ram_if.mem mem_if
);

// Declare a RAM variable 
data_t  ram [W_DEPTH-1:0];

//Variable to hold the registered read adddres
//data_t  addr_logic;

always_ff@(posedge clk_a) begin
if(mem_if.we)
    ram[mem_if.wr_addr_a] <= mem_if.data_a;
end

always_ff@(posedge clk_b) begin
if(mem_if.re)
    mem_if.rd_data_a <= ram [mem_if.rd_addr_b];
end

endmodule
`endif

