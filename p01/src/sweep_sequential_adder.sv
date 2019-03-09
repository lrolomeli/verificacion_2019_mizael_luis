module sweep_sequential_adder
#(
	parameter DW_2 = 16,	//El tamano del resultado de la multiplicacion 2 veces DW
	parameter DW = 8,		//El tamano de los datos de entrada
	parameter DWlogb2 = $clog2(DW)	//Tamano de contador necesario para obtener el resultado en DW ciclos de reloj
)(

	//Entradas
	input clk,
	input rst,
	input l_s,
	input [DW-1:0] rgstr1,
	input [DW_2-1:0] rgstr2,
	
	//Salidas
	output logic done,
	output logic [DW_2-1:0] product

);

//A este modulo le debe entrar una senal de control que indique si hay que empezar a contar
//Por ejemplo ls 
logic [DWlogb2:0] count;

always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
	begin
		count <= '0;
		product <= '0;
	end
	
	else
	begin
		
		//La misma senal de start no puede indicar el inicio del contador		
		if(l_s)
		begin
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
		
			//La operacion de multiplicacion tiene una latencia de DW ciclos de reloj
			//Sin embargo en el ciclo DW-1 debimos haber terminado con la multiplicacion
			//debido a que utilizamos el msb de cada entrada para representar el complemento A2
			//en este punto ya tenemos un resultado al que faltaria simplemente comprobar si hacer
			//el calculo del complemento a2 o mostrar el dato obtenido a la salida en resultado.
			if(count == DW-1)
			begin
				done <= 1'b1;
				count <= '0;				
			end
			
			else
			begin
				count <= count + 1'b1;
			end
		
		end

	end

end

endmodule
