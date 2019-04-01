module product
#(
	parameter N = 4
)(

	input clk,
	input rst,
	input [2*N:0] a_q,
	
	output logic [2*N:0] product

);



always_ff@(posedge clk, negedge rst)
begin
	if(~rst)
	begin
		product <= '0;
	end
	
	else
	begin
		product <= a_q;
	end

end
endmodule 