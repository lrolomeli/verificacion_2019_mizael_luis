module FSM
(
input clk,
input rst,
input init_FSM,
input done,

output logic l_s,
output logic complete
);

/** enum used to select type of register **/
enum logic [1:0] {IDLE, LOAD, MULTIPLYING} STATES;
logic [1:0] state;

always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
	begin
		l_s <= '0;
		state <= IDLE;
		complete <= '0;
	end
	
	else
	begin
		case(state)
			IDLE :
			begin
				//Vamos a estar en este estado mientras la
				//senal de start sea igual a cero
				if(init_FSM)
				begin
					state <= LOAD;
					l_s <= 1'b1;
				end
				
			end
			
			LOAD :
			begin
			
				l_s <= '0;
				state <= MULTIPLYING;

			end
			
			MULTIPLYING :
			begin 
				//Si ya termino de multiplicar debe
				//enviar una senal de done
				if(done)
				begin
					state <= IDLE;
					//Tienes que indicarle al control unit que mantenga el resultado
					complete <= 1'b1;
					//y en caso de volver a recibir un start hay que limpiar antes el resultado
				end

			end
			
			
			default: 
			begin 
				l_s <= '0;
				state <= IDLE;
				complete <= '0;
			end
		
		endcase
	
	end
		
end

endmodule
