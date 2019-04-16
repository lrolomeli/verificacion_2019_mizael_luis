//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module comparer
(

 input [DEC_4-1:0] in,
 output logic [DEC_4-1:0] out
 
);

assign out = (in > DEC_4) ? in + 2'd3 : in;


endmodule
