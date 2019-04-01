module mux2_1
#(
	parameter N = 4
)(
	input clk,
	input rst,
	input [N-1:0] a,
	input [N-1:0] b,
	input selector,
	
	output logic [N-1:0]out

);

always_ff@(posedge clk, negedge rst)
begin: mux_reg

	if(~rst)
	begin
		/** Clean registers **/
		out <= '0;
	end
	
	else
	begin
		/** Load input **/
		out <= (selector) ? b : a;
	end

end: mux_reg
	
endmodule 