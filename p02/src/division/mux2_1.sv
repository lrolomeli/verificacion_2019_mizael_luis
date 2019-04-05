module mux2_1
#(
	parameter N = 4
)(
	input [(2*N)-1:0] a,
	input [(2*N)-1:0] b,
	input selector,
	
	output logic [(2*N)-1:0] out

);

always_comb
begin 
	if(selector == 1)
	begin
		out = a; 
	end
	
	else
	begin 
		out = b;
	end
end 
endmodule 