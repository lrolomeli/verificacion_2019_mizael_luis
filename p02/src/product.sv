module product
#(
	parameter N = 4
)(

	input clk,
	input rst,
	input [2*N:0] a_q,
	
	output logic [N-1:0] a_out,
	output logic [N:0] q_out,
	output logic [(2*N)-1:0] product

);



always_ff@(posedge clk, negedge rst)
begin
	if(~rst)
	begin
		a_out <= '0;
		q_out <= '0;
		product <= '0;
	end
	
	else
	begin
		q_out <= a_q[N:0];
		a_out <= a_q[2*N:N+1];
		product <= a_q[2*N:1];
	end

end
endmodule 