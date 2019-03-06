module piso_msb #(
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
            rgstr_r  <= {rgstr_r[DW-2:0], rgstr_r[DW-1]};
    end
end:rgstr_label

assign out  = rgstr_r[DW-1];    // MSB bit is the first to leave
//TODO: try to design a piso register, where the LSB bit leave the register first and then the LSB bit+1.
endmodule
