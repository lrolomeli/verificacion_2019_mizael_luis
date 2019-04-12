module statemachine
(
	input clk,
	input rst,
	input start,
	input load,
	input loaded_x,
	input loaded_y,
	input done,
	
	output logic sel,
	output logic go,
	output logic stop
);

typedef enum logic [1:0] {IDLE, PROCESSING} STATE;

STATE state;

always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
	begin
		state <= IDLE;
	end
	
	else
	begin
			case(state)
				IDLE :
				begin
					if(start)
						state <= PROCESSING;
					else
						state <= IDLE;
				end
				
				PROCESSING :
				begin
					if(done)
						state <= IDLE;
					else
						state <= PROCESSING;
				end		
				
				default: state <= IDLE;
				
			endcase
	
	end

end


assign sel  = loaded_x;
assign stop = done;
assign go = start;

endmodule
