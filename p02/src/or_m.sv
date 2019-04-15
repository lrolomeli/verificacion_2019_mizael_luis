//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module or_m
#(
	parameter N = 4
)
(
	input [N-1:0] a,
	input [N-1:0] b,
	
	output [N-1:0] out

);


	assign out = a | b;

endmodule
