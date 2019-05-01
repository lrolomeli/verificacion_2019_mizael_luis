// Coder:           DSc Abisai Ramirez Perez
// Date:            31 April 2019
// Name:            sdp_dc_ram_pkg.sv
// Description:     This is the package of single-port RAM
`ifndef SDP_DC_RAM__PKG_SV
    `define SDP_DC_RAM_PKG_SV
package sdp_dc_ram_pkg ;

    localparam  W_DATA      = 8;
    localparam  W_ADDR      = 3;	//BITS PARA ACCEDER A LA MEMORIA
    localparam  W_DEPTH     = 2**W_ADDR; //TAMANO DE LA MEMORIA

    typedef logic [W_DATA-1:0]        data_t;
    typedef logic [W_ADDR-1:0]        addr_t;

endpackage
`endif
