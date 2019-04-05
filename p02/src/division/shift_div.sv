module shift_div
#(
	parameter N = 4
)(
	input [(2*N)-1:0] in,
	output logic [(2*N)-1:0] out

);
	assign out = {in[6:0],in[7]};
	
endmodule 