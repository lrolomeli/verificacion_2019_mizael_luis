module signed_shift
#(
	parameter N = 4
)(

	input [2*N:0] in,
	output [2*N:0] out

);

	assign out = in>>>1'b1;

endmodule 