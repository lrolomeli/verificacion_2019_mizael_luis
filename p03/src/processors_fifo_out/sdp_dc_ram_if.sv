//Coder:          Abisai Ramirez Perez
//Date:           03/31/2019
//Name:           sp_dc_ ram_if.sv
//Description:    This is the interface of a dual-port dual-clock random access memory. 

`ifndef SDP_DC_RAM_IF_SV
    `define SDP_DC_RAM_IF_SV

interface sdp_dc_ram_if ();
import sdp_dc_ram_pkg::*;

// Write enable signal
logic       we        ;   // Write enable
logic       re        ;   // Read enable
data_t      data_a      ;   // data to be stored
data_t      rd_data_a   ;   // read data from memory
addr_t      wr_addr_a      ;   // Read write address
addr_t      rd_addr_b      ;   // Read write address

// Memory modport
modport mem (
input   we,
input   re,
input   data_a,
input   wr_addr_a,
output  rd_data_a,
input   rd_addr_b
);

//Client modport
modport cln (
output  we,
output  re,
output  data_a,
output  wr_addr_a,
input   rd_data_a,
output  rd_addr_b
);

endinterface
`endif

