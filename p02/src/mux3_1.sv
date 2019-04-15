//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module mux3_1
#(
	parameter N = 4
)(
	input [N-1:0] m,
	input [N-1:0] d,
	input [N-1:0] r,
	input [1:0]sel,
	
	output logic [N-1:0]out

);

always_comb
begin
	case(sel)
		2'b00:out = m;
		2'b01:out = d;
		2'b10:out = r;
		default: out = 0;
	endcase
end


	
endmodule 
