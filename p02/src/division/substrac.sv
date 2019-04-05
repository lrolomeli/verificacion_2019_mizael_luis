module substrac
#(
	parameter N = 4
)(
	input [N-1:0] a,
	input [N-1:0] b,

	output [N-1:0] r
);


	assign r = a - b;

		
endmodule
