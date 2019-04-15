//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module rightvshift
#(
	parameter N = 4,
	parameter C = $clog2(2*N)
)(
	input [N-1:0] in,
	input [C:0] shift,
	
	output [N-1:0] out

);


	assign out = in >> shift;


endmodule
