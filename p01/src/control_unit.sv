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
		l_s  <= '0;
		done  <= '0;
		start <= '0;
	end
	
	else
	begin 
		if (start)
		begin 
			init_FSM <= 1'b1;	//La senal de start inicia la maquina de estados	
		end
		
		else if (l_s)
		begin 
			enable <= 1'b1;	//Esta senal habilita el modulo de multiplicacion en la FSM
		end
		
		if (done)
		begin
			//No estoy seguro de que poner aqui cuando ya termino de multiplicar.
			init_FSM <= '0;	//Indica que ya se ha completado el estado de multiplicacion
		end
		
	end 
	
end 

endmodule
