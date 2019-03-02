module sipo #(
parameter DW = 4
) (
input               clk,
input               rst,
input               enb,
input               inp,
output  [DW-1:0]    out
);

logic [DW-1:0]      rgstr_r;

always_ff@(posedge clk or negedge rst) begin: rgstr_label
    if(!rst)
        rgstr_r  <= '0;
    else if (enb)
        rgstr_r  <= {inp, rgstr_r[DW-1:1]};
end:rgstr_label

assign out  = rgstr_r;

endmodule
