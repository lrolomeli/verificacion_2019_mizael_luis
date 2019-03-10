module control_unit 
(
input clk,
input rst,
input start,
input complete,

output logic permit,
output logic init_FSM

//output logic enable

);

always_ff@(posedge clk, negedge rst)
begin 

	if(~rst)
	begin
		init_FSM <= '0;
		permit <= '0;
	end
	
	else
	begin 
		if(start)
		begin
			permit <= '0;
			init_FSM <= 1'b1;	//La senal de start inicia la maquina de estados	
		end
		
		if(complete)
		begin
			//Mandar senal al multiplicador de que se mantenga el resultado
			//Hasta que alguien modifique las entradas o el start.
			permit <= 1'b1;
			init_FSM <= '0;
		end
		
	end 
	
end 

endmodule
