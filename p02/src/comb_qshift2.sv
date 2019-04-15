//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module comb_qshift2
#(
	parameter N = 4
)(
	input [N-1:0] Q,
	
	output [N-1:0] qor1,
	output [N-1:0] qor3

);

	assign qor1 = (Q << 2'b10) | 2'b01;
	assign qor3 = (Q << 2'b10) | 2'b11;

endmodule
