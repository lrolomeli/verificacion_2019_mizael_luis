/*********************************************************************************
* Module Name: control_unit.sv

* Description: Control Unit

* Inputs: clk, rst, start, l_s, done

* Outputs: init_FSM, enable

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

module control_unit 
(
input clk,
input rst,
input start,
input l_s,
input done,

output logic init_FSM,
output logic enable

);

always_ff@(posedge clk, negedge rst)
begin 

	if(~rst)
	begin
		l_s  <= ZERO;
		done  <= ZERO;
		start <= ZERO;
	end
	
	else
	begin 
		if (start)
		begin 
			init_FSM <= ONE;	//La senal de start inicia la maquina de estados	
		end
		
		else if (l_s)
		begin 
			enable <= ONE;	//Esta senal habilita el modulo de multiplicacion en la FSM
		end
		
		if (done)
		begin
			//No estoy seguro de que poner aqui cuando ya termino de multiplicar.
			init_FSM <= ZERO;	//Indica que ya se ha completado el estado de multiplicacion
		end
		
	end 
	
end 

endmodule
