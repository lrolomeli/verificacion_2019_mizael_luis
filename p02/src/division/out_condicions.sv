module out_condicions
#(
	parameter N = 4
)(
	input [(2*N)-1:0] a,
	input selector,
	
	output logic [(2*N)-1:0]out

);

always_comb
begin
	if(a[7] == 1)
	begin
		out = {a[(2*N)-1:1],1'b0}; 
	end

	else if (a[7] == 0) 
	begin
		out = {a[(2*N)-1:1],1'b1}; 
	end
	
	else
	begin 
		out = '0;
	end
end 
	
endmodule 