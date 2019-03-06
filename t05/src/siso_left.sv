module siso_left #(
parameter DW = 4
) (
input               clk,
input               rst,
input               enb,
input               inp,
output              out
);

logic [DW-1:0]      rgstr_r;

always_ff@(posedge clk or negedge rst) begin: rgstr_label
    if(!rst)
        rgstr_r  <= '0;
    else if (enb)
        rgstr_r  <= {rgstr_r[DW-2:0], inp};
end:rgstr_label

assign out  = rgstr_r[DW-1];

//TODO: try to design a siso register where shifting is performed to the right instead of the left

endmodule
