module reg_aq
#(
	parameter N = 4
)
(
	input [N-1:0] q,
	
	output [2*N:0] aq_reg
);


assign aq_reg = {4'b0000,q,1'b0};		


endmodule
