module adder
#(
	parameter N = 4
)(
	input [N-1:0] a,
	input [N-1:0] m,

	output [N-1:0] s
);


	assign s = a + m;

		
endmodule
