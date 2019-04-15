module comb_qshift1
#(
	parameter N = 4
)(
	input [N-1:0] Q,
	
	output [N-1:0] q,
	output [N-1:0] q1

);

	assign q = Q << 1'b1;
	assign q1 = (Q << 1'b1) | 1'b1;

endmodule
