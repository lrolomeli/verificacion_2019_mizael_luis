module FSM
(
input clk,
input rst,
input init_FSM,,
input enable_in,
input start,
input done,

output logic l_s,
output logic enable_out


);

enum logic [1:0] {IDLE, LOAD, MULTIPLYING} STATES;

always_ff@(posedge clk, negedge rst)
begin: always_MS

	if(~rst)
	begin
		init_FSM <= '0;
		enable <= '0;
		start <= '0;
	end
	
	else
	begin
		case(state)
		Idle :
		begin 
			init_FSM <= '0;
			enable <= '0;
			start <= '0;
		end
		
		load :
		begin 
			l_s = 1'b1;
		end
		
		default: 
		begin 
		end
		
		if (enable)
		begin
			enable_out = 1'b1;
		end
		
end: always_MS

endmodule
