module A2
#(
	parameter DW_2 = 16,
	parameter DW = 8,
)(

	input multiplier_msb,
	input multiplicand_msb,
	input [DW_2-1 : 0]product,
	
	output Sign,
	output logic [DW_2-2:0] result

);

always_comb 
begin
	if (multiplier_msb ^ multiplicand_msb)
	begin
		assign result = ~(product [DW_2-2:0]) - 1b'1;
		assign sign = multiplier_msb ^ multiplicand_msb,
	end
	else 
	begin 
		assign result = product [DW_2-2:0];
		assign sign = multiplier_msb ^ multiplicand_msb,
	end
end
endmodule

