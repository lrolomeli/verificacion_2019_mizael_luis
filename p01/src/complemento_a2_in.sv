import Pkg_Global::*;

module complemento_a2_in(

	input [DW-ONE:ZERO] in,
	
	output logic [DW-ONE:ZERO] out
	

);

always_comb
begin
	
	if(in[DW-ONE])
	begin
		out = ~(in) + BIT_ONE;
	end
	else
	begin
		out = in;
	end
	
end


endmodule
