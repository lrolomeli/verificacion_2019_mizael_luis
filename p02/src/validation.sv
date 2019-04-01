module validation
(
	input a,
	input b,
	input c,
	
	output logic error

);


always_comb
begin

	if(a)
		error = 1'b1;
	else
		error = 1'b0;
		
	if(b)
		error = 1'b1;
	else
		error = 1'b0;
		
	if(c)
		error = 1'b1;
	else
		error = 1'b0;
		
end


endmodule

