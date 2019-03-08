module control_unit 
(
input clk,
input rst,
input l_s,
input done,
input start,

output logic init_FSM,
output logic enable

);

/** enum used to select type of register **/
enum logic [1:0] {IDLE, LOAD, MULTIPLYING} STATES;

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
			init_FSM <= 1'b1;
		end
		
		else
		begin
			init_FSM <= '0;
		end
		
		if (l_s)
		begin 
			enable <= 1'b1;
		end
		
		else
		begin
			enable <= '0;
		end
		
		if (done)
		begin
			init_FSM <= '0;
		end
		
	end 
	
end 

endmodule
