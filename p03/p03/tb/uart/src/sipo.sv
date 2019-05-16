import uart_pkg::*;

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