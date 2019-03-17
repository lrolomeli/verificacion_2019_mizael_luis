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

//Top module 
module top
(

input [7:0] bits,

output [6:0] units,
output [6:0] tens,
output [6:0] hundreds

);

wire [3:0] units_w;
wire [3:0] tens_w;
wire [3:0] hundreds_w;

bin2dec b2d
(
	.bin(bits),
	
	.bcd({hundreds_w,tens_w,units_w})
);

segments units_segment
(
     //inputs 
     .w(units_w[3]),
     .x(units_w[2]),
     .y(units_w[1]),
     .z(units_w[0]),
	  
	  //outputs 
     .a(units[0]),
     .b(units[1]),
     .c(units[2]),
     .d(units[3]),
     .e(units[4]),
     .f(units[5]),
     .g(units[6])
	 
);

segments tens_segment
(
	  //inputs 
     .w(tens_w[3]),
     .x(tens_w[2]),
     .y(tens_w[1]),
     .z(tens_w[0]),
	  
	  //outputs 
     .a(tens[0]),
     .b(tens[1]),
     .c(tens[2]),
     .d(tens[3]),
     .e(tens[4]),
     .f(tens[5]),
     .g(tens[6])
	 
);
	
segments hundreds_segment
(
     //inputs 
     .w(hundreds_w[3]),
     .x(hundreds_w[2]),  
     .y(hundreds_w[1]),
     .z(hundreds_w[0]),
	  
	  //outputs 
     .a(hundreds[0]),
     .b(hundreds[1]),
     .c(hundreds[2]),
     .d(hundreds[3]), 
     .e(hundreds[4]),
     .f(hundreds[5]),
     .g(hundreds[6])
	 
);	


endmodule
