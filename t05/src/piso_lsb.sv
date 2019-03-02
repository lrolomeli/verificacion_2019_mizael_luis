module piso_lsb #(
parameter DW = 4
) (
input               clk,    // Clock
input               rst,    // asynchronous reset low active 
input               enb,    // Enable
input               l_s,    // load or shift
input  [DW-1:0]     inp,    // data input
output              out     // Serial output
);

logic [DW-1:0]      rgstr_r;

always_ff@(posedge clk or negedge rst) begin: rgstr_label
    if(!rst)
        rgstr_r  <= '0;
    else if (enb) begin
        if (l_s)
            rgstr_r  <= inp;
        else 
            rgstr_r  <= {rgstr_r[0], rgstr_r[DW-1:1]};
    end
end:rgstr_label

assign out  = rgstr_r[0];    // LSB bit is the first to leave

endmodule