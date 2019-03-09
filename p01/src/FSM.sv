module FSM
(
input clk,
input rst,
input start,
input enable,

output logic l_s,
output logic done
);

/** enum used to select type of register **/
enum logic [1:0] {IDLE, LOAD, MULTIPLYING} STATES;

always_ff@(posedge clk, negedge rst)
begin: always_MS

	if(~rst)
	begin
		l_s <= '0;
		enable_out <= '0;
		state <= '0;
	end
	
	else
	begin
		case(state)
		IDLE :
		begin
			//Vamos a estar en este estado mientras la
			//senal de start sea igual a cero
			if(start)
			begin
				l_s < = 1'b1;
				state <= LOAD;
			end
			l_s < = '0;
			state <= state;
			
		end
		
		LOAD :
		begin 
			if(enable)
			begin
				state <= MULTIPLYING;
			end
			state <= state;

		end
		
		MULTIPLYING :
		begin 
			//Si ya termino de multiplicar debe
			//enviar una senal de done
			
			/**Multiplicando*/
			/**Ya acabe = done*/
			done <= 1'b1;
		end
		
		
		default: 
		begin 
			l_s <= '0;
			state <= '0;
			done <= '0;
		end
		
end: always_MS

endmodule
