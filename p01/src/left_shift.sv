module left_shift 
#(
parameter DW_2 = 16;
)
(
input clk,
input l_s,
input rst,
input [DW_2-1:0] rgstr,

output logic [DW_2-1:0] shift_out
);


always_ff@(posedge clk, negedge rst)
begin 

	if(~rst)
	begin
		rgstr <= '0;
		shift_out <= '0;
	end
	
	else
	begin 
	shift_out <= {rgstr[DW_2-2:0], 1'b0};
	end 
	
end 

endmodule 
