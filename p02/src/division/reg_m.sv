module reg_m
#(
    parameter N = 4
)
(
    input clk,
    input rst,
    input [N-1:0] m,

    output logic [N-1:0] m_reg
);

always_ff@(posedge clk, negedge rst)
begin
    if(~rst)
    begin
        /** Clean registers **/
        m_reg <= '0;
    end

    else
    begin
        m_reg <= m;
    end
end
endmodule
