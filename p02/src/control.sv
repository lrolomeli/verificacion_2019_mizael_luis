module control(

	input start,
	
	output logic control

);



always_comb
begin

	if(start)
	begin
		control = 1'b1;
	end
	else
	begin
		control = 1'b0;
	end


end


endmodule
