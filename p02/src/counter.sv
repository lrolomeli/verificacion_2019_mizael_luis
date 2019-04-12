module counter
#(
	parameter N = 4,
	parameter C = $clog2(2*N)
)(
	/** Input ports **/
	input clk,
	input rst,
	input load,
	
	/** Output ports **/
	output logic ov_counter,
	output logic able
);

logic [C:0] count;


always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
	begin
		/** Clean registers **/
		count <= '0;
		ov_counter <= '0;
		able <= '0;
	end
	
	else
	begin
		if(load)
		begin
			count <= '0;
			ov_counter <= '0;
			able <= 1'b1;
		end
		
		else if(able)
		begin
			if(count==N-1)
			begin
				ov_counter <= 1'b1;
				able <= '0;
			end
			else
			begin
				count <= count + 1'b1;
			end
		end
		
	end

end

endmodule
