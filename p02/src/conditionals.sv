module conditionals
#(
	parameter N = 4
)(

	input [1:0] q,
	
	output logic [N-1:0] mux_adder_f
);

always_comb
begin 


	if(q[1]^q[0])
	begin 
		if(q[0])
			mux_adder_f = 2'b00;
		else
			mux_adder_f = 2'b01;
	end

	else
	begin
		mux_adder_f = 2'b10;
	end


end

endmodule
