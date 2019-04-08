module left_shift
#(
	parameter N = 4,
	parameter shift
)(
	input [N-1:0] in,
	output [N-1:0] out

);


	assign out = in << shift;


endmodule
