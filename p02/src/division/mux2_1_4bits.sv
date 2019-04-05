module mux2_1_4bits
#(
	parameter N = 4
)(
	input [(N)-1:0] a,
	input [(N)-1:0] b,
	input selector,
	
	output logic [(N)-1:0] out

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