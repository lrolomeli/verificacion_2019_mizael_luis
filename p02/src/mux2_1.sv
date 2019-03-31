module mux2_1
#(
	parameter N = 4
)(

	input [N:0] a,
	input [N:0] b,
	input selector,
	
	output [N:0]out

);


	assign out = (selector) ? a : b;

endmodule 