module left_shift
#(
parameter DW_2 = 16
)
(
input clk,
input l_s,
input rst,
input permit,
input [DW_2-1:0] rgstr2,

output logic [DW_2-1:0] shift_out
);


always_ff@(posedge clk, negedge rst)
begin 

	if(~rst)
	begin
		shift_out <= '0;
	end
	
	else
	begin 
		if(l_s)
		begin
			shift_out <= rgstr2;
		end
		else if(~permit)
		begin
			shift_out <= {shift_out[DW_2-2:0], 1'b0};
		end
		
	end 
	
end 

endmodule 
