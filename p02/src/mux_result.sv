//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module mux_result
(
	input [2*N-1:0] in,
	input [1:0]sel,
	
	output logic [2*N-1:0] out

);

always_comb
begin
	case(sel)
		2'b00:out = in;
		2'b01:out = {{N{1'b0}},in[N-1:0]};
		2'b10:out = {{N{1'b0}},in[N-1:0]};
		default: out = 0;
	endcase
end


	
endmodule 
