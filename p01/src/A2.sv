module a2
#(
	parameter DW_2 = 16,
	parameter DW = 8
)(

	input multiplier_msb,
	input multiplicand_msb,
	input [DW_2-1 : 0]product,
	
	output logic sign,
	output logic [DW_2-1:0] result

);

always_comb 
begin

	if (multiplier_msb ^ multiplicand_msb)
	begin
		result = ~(product [DW_2-2:0]) - 1'b1;
		sign = multiplier_msb ^ multiplicand_msb;
	end
	else 
	begin 
		result = product [DW_2-2:0];
		sign = multiplier_msb ^ multiplicand_msb;
	end
		
end

endmodule
