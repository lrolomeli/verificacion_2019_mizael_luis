module reg_q
#(
    parameter N = 4
)
(
    input clk,
	 input rst,
    input [N-1:0] q,

    output logic [(2*N)-1:0] aq_reg
);

always_ff@(posedge clk, negedge rst)
begin
	if(~rst)
		begin 
			aq_reg <= '0;
		end 
		
		else
		begin 
			aq_reg <= {4'b0000,q};
		end

end
endmodule
