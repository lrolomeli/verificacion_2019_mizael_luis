//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez
//
// Create Date:  04/02/2019
// Design Name:
// Module Name:  top
// Project Name: tarea1
// Target Devices: FPGA ALTERA DE2-115
// Tool versions: Quartus Prime
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

//================================================================================
// Import the Packages
//================================================================================
import Global_Pkg::*;

//Top module
module top
(

input [SEVEN:ZERO] bits,

output [SIX:ZERO] units,
output [SIX:ZERO] tens,
output [SIX:ZERO] hundreds,
output sign

);

wire [THREE:ZERO] units_w;
wire [THREE:ZERO] tens_w;
wire [THREE:ZERO] hundreds_w;

bin2dec b2d
(
	.bin(bits),

	.bcd({hundreds_w,tens_w,units_w}),
	.sign(sign)
);

segments units_segment
(
     //inputs
     .w(units_w[THREE]),
     .x(units_w[TWO]),
     .y(units_w[ONE]),
     .z(units_w[ZERO]),

	  //outputs
     .a(units[ZERO]),
     .b(units[ONE]),
     .c(units[TWO]),
     .d(units[THREE]),
     .e(units[FOUR]),
     .f(units[FIVE]),
     .g(units[SIX])

);

segments tens_segment
(
	  //inputs
     .w(tens_w[THREE]),
     .x(tens_w[TWO]),
     .y(tens_w[ONE]),
     .z(tens_w[ZERO]),

	  //outputs
     .a(tens[ZERO]),
     .b(tens[ONE]),
     .c(tens[TWO]),
     .d(tens[THREE]),
     .e(tens[FOUR]),
     .f(tens[FIVE]),
     .g(tens[SIX])

);

segments hundreds_segment
(
     //inputs
     .w(hundreds_w[THREE]),
     .x(hundreds_w[TWO]),
     .y(hundreds_w[ONE]),
     .z(hundreds_w[ZERO]),

	  //outputs
     .a(hundreds[ZERO]),
     .b(hundreds[ONE]),
     .c(hundreds[TWO]),
     .d(hundreds[THREE]),
     .e(hundreds[FOUR]),
     .f(hundreds[FIVE]),
     .g(hundreds[SIX])

);


endmodule
