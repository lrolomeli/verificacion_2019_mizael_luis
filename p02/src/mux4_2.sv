module mux4_2
#(
	parameter N = 4
)(
	input [N-1:0] a,
	input [N-1:0] b,
	input [N-1:0] c,
	input [N-1:0] d,
	input selector,
	
	output logic [N-1:0]out1,
	output logic [N-1:0]out2

);

always_comb
begin
	if(selector)
	begin
		out1 = a;
		out2 = b;
	end
	
	else
	begin
		out1= c;
		out2= d;
	end

end


	
endmodule 