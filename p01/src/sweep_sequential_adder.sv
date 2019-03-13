/*********************************************************************************
* Module Name: sweep_sequential_adder.sv

* Description: sweep_sequential_adder

* Inputs: clk, rst, l_s, rgstr1, rgstr2,

* Outputs: done, product

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  09/04/2019

* Project Name: P01

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module sweep_sequential_adder
(

	/** Input ports **/
	input clk,
	input rst,
	input l_s,
	input permit,
	input [DW-ONE:ZERO] rgstr1,
	input [DW_2-ONE:ZERO] rgstr2,
	
	/** Output ports **/
	output logic done,
	output logic [DW_2-ONE:ZERO] product

);

	//A este modulo le debe entrar una senal de control que indique si hay que empezar a contar
	//Por ejemplo ls 
	logic [DWlogb2:0] count;

	always_ff@(posedge clk, negedge rst)
	begin

		if(~rst)
		begin
			/** clean outs **/
			count <= BIT_ZERO;
			product <= BIT_ZERO;
			done <= BIT_ZERO;
		end
		
		else
		begin
		
			//La misma senal de start no puede indicar el inicio del contador		
			if(l_s)
			begin
				count <= BIT_ZERO;
				product <= BIT_ZERO;
				done <= BIT_ZERO;
			end
			//Esta senal de permit directa de control unit es para mantener el resultado
			//cuando esta en estado de listo (done) y se limpia cuando hay una senal de
			//start.
			else if(permit)
			begin
			
				//Barrido de cada bit en "multiplier"
				//En caso de ser 1 el bit entonces sumamos el valor de rgstr2
				//Y rgstr2 tiene el valor de "multiplicand" y puede estar recorrido
				//o puede ser si counter es 0 el valor original de "multiplicand".

				if(rgstr1[count] && ~(count == DW-ONE)) 
				begin
					product <= product + rgstr2;
					count <= count + BIT_ONE;
				end
				
				//La operacion de multiplicacion tiene una latencia de DW ciclos de reloj
				//Sin embargo en el ciclo DW-1 debimos haber terminado con la multiplicacion
				//debido a que utilizamos el msb de cada entrada para representar el complemento A2
				//en este punto ya tenemos un resultado al que faltaria simplemente comprobar si hacer
				//el calculo del complemento a2 o mostrar el dato obtenido a la salida en resultado.
				
				else if(count == DW-ONE)
				begin
					done <= BIT_ONE;
				end
				
				else
				begin
					count <= count + BIT_ONE;
				end
						
			end
			
			else
			begin
				count <= BIT_ZERO;
				done <= BIT_ZERO;
			end
			
		end

	end

endmodule
