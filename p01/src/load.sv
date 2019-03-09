module load
#(
	parameter DW_2 = 16,	//El tamano del resultado de la multiplicacion 2 veces DW
	parameter DW = 8,		//El tamano de los datos de entrada
	parameter DWlogb2 = $clog2(DW)	//Tamano de contador necesario para obtener el resultado en DW ciclos de reloj
)(

	//Entradas
	input clk,
	input rst,
	input l_s, //Senal de carga de datos de entrada o senal de start
	input [DW-1:0] multiplier,
	input [DW-1:0] multiplicand,
	
	output logic [DW-1:0] rgstr1,	//Entrada del multiplier registrada
	output logic [DW_2-1:0] rgstr2	//Entrada del multiplicand registrada
//Esta entrada es la que utilizamos para realizar la suma secuencial con el producto
//Por lo tanto debe tener el mismo ancho de bus que el resultado.
//Ademas requerimos que no se pierdan los datos de multiplicand cuando se hace un shift
//left y como vamos a hacer DW shift lefts si no fuera el tamano de DW_2  perderiamos datos.
);



always_ff@(posedge clk, negedge rst)
begin: always_MS

	if(~rst)
	begin
		rgstr1 <= '0;
		rgstr2 <= '0;
	end
	
	else
	begin
		
      if (l_s)
		begin
		   rgstr1 <= multiplier[DW-2:0];
			rgstr2 <= multiplicand[DW-2:0];
		end

		else
		begin
			rgstr1 <= rgstr1;
			rgstr2 <= rgstr2;
		end

	end

end: always_MS

endmodule
