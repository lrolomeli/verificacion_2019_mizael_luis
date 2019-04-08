module mux2_1
#(
	parameter N = 4
)(
	input [N-1:0] a,
	input [N-1:0] b,
	input selector,
	
	
	output logic [N-1:0]out

);

	assign out = (selector) ? b : a;

	
endmodule 