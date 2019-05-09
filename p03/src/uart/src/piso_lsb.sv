import uart_pkg::*;

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
        rgstr_r  <= '0;
    else if (enb) begin
        if (load)
            rgstr_r  <= inp;
        else 
            rgstr_r  <= {rgstr_r[0], rgstr_r[W_DATA-1:1]};
    end
end:rgstr_label


assign parity = rgstr_r[0] ^ rgstr_r[1] ^ rgstr_r[2] ^ rgstr_r[3] ^ rgstr_r[4] ^ rgstr_r[5] ^ rgstr_r[6] ^ rgstr_r[7];
assign out  = rgstr_r[0];    // LSB bit is the first to leave

endmodule