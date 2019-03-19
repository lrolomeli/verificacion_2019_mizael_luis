//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez
//
// Create Date:  04/02/2019
// Design Name:
// Module Name:  segments
// Project Name: tarea1
// Target Devices: FPGA ALTERA DE2-115
// Tool versions: Quartus Prime
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module segments
(
	 //entradas para mostrar del 0 al 9
	 input w,
    input x,
    input y,
    input z,

	 //salidas para representar cada uno de los segmentos
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g

);
	 //ecuaciones boleanas de la tabla de verdad de cada digito a segmentos
	 assign a = ((~w & ~y) & (x ^ z)) | ((w & z)&(x ^ y));
    assign b = ((~w&x) & (y^z))| ((w&x)&((~y&~z)|(y&z)))|((w&y)&(x^z));
    assign c = (~w&~x&y&~z)|((w&x)&((~y&~z)|y));
	 assign d = ((~w&~y) & (x^z))|(x&y&z)|((w&~x)&(y^z));
	 assign e = ~w&(z|(x&~y))|(w&~x&~y&z);
	 assign f = (~w&~x&y)|((~y&z)&((~w&~x)|(w&x)))|(~w&x&y&z);
	 assign g = (~y&((~w&~x)|(w&x&~z)))|(~w&x&y&z);

endmodule
