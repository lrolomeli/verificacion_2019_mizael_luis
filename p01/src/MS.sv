module MS
#(
	parameter DW_2 = 16,	//El tamano del resultado de la multiplicacion 2 veces DW
	parameter DW = 8,		//El tamano de los datos de entrada
	parameter DWlogb2 = $clog2(DW)	//Tamano de contador necesario para obtener el resultado en DW ciclos de reloj
)(

	//Entradas
	input clk,
	input rst,
	input start,
	input l_s, //Senal de carga de datos de entrada
	input [DW-1:0] multiplier,
	input [DW-1:0] multiplicand,
	
	//Salidas
	output logic done,
	output logic [DW_2-1:0] product

);

logic [DW-1:0] rgstr1;		//Entrada del multiplier registrada
logic [DW_2-1:0] rgstr2;	//Entrada del multiplicand registrada
//Esta entrada es la que utilizamos para realizar la suma secuencial con el producto
//Por lo tanto debe tener el mismo ancho de bus que el resultado.
//Ademas requerimos que no se pierdan los datos de multiplicand cuando se hace un shift
//left y como vamos a hacer DW shift lefts si no fuera el tamano de DW_2  perderiamos datos.

logic [DWlogb2:0] count;


always_ff@(posedge clk, negedge rst)
begin: always_MS

	if(~rst)
	begin
		product <= '0;
		rgstr1 <= '0;
		rgstr2 <= '0;
		count <= '0;
		done <= '0;
	end
	
	else
	begin
		
      if (l_s)
		begin
		   rgstr1 <= multiplier[DW-2:0];
			rgstr2 <= multiplicand[DW-2:0];
			count <= '0;
		end
		
		else
		begin
		
			//Barrido de cada bit en "multiplier"
			//En caso de ser 1 el bit entonces sumamos el valor de rgstr2
			//Y rgstr2 tiene el valor de "multiplicand" y puede estar recorrido
			//o puede ser si counter es 0 el valor original de "multiplicand".
			if(rgstr1[count]) 
			begin
				product <= product + rgstr2;
			end
			
			//Recorrimiento del registro 2 donde almacenamos
			//los posibles sumandos del producto.
			//(DW_2-2) asi el msb desaparece y es un left shift.
			rgstr2 <= {rgstr2[DW_2-2:0], 1'b0};
			
			//NOTA: no necesitamos un right shift porque tomamos en cuenta
			//que el valor de counter recorre cada valor del multiplier
			//y de esta manera obtenemos cada bit por separado.
			
			//La operacion de multiplicacion tiene una latencia de DW ciclos de reloj
			//Sin embargo en el ciclo DW-1 debimos haber terminado con la multiplicacion
			//debido a que utilizamos el msb de cada entrada para representar el complemento A2
			//en este punto ya tenemos un resultado al que faltaria simplemente comprobar si hacer
			//el calculo del complemento a2 o mostrar el dato obtenido a la salida en resultado.
			if(count == DW-1)
			begin
				done <= 1'b1;
				
				//Si los msb de cada factor son iguales quiere decir
				//que el signo de la operacion sera positivo
				//de lo contrario al ser diferentes el resultado
				//debe ser negativo y de esta forma comprobamos si
				//tenemos que representar el resultado como complemento A2.
				if(multiplier[DW-1] ^ multiplicand[DW-1])
				begin
					product <= (~product) + 1'b1;
				end
				else
				begin
					product <= product;
				end
				
				count <= '0;
				
			end
			
			else
			begin
				count <= count + 1'b1;
			end
		
		end
		

	end

end: always_MS

endmodule
