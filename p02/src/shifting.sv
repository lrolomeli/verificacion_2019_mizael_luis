//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module shifting
(
	input bin,
	input [LENGTH-1:0] ins,
	output logic [LENGTH-1:0] shifted_out

);

assign shifted_out = {ins[LENGTH-2:0], bin};


endmodule
