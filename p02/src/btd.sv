//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module btd
(
	input [N-1:0] in_bits,
	output logic [LENGTH-1:0] out
);

buses [N-1:0] shifted_bits; 
buses [N:0] outs;

assign outs[0] = '0;

genvar i;

generate
	for(i=0; i<N; i=i+1'b1)
	begin : gen
		shifting sh
		(
			.bin(in_bits[(N-1'b1)-i]),
			.ins(outs[i]),
			.shifted_out(shifted_bits[i])
		);
		
		separator spr
		(
			.shifted_in(shifted_bits[i]),
			.dec_out(outs[i+1'b1])
		);
	end : gen

endgenerate

assign out = shifted_bits[N-1];

endmodule
