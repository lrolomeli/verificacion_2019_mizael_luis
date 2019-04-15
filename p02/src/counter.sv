//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module counter
#(
	parameter N = 4,
	parameter C = $clog2(2*N)
)(
	/** Input ports **/
	input clk,
	input rst,
	input start,
	
	/** Output ports **/
	output logic ov_counter,
	output logic flag_r,
	output logic able,
	output logic [C:0] count
);




always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
	begin
		/** Clean registers **/
		count <= '0;
		ov_counter <= '0;
		able <= '0;
		flag_r <= '0;
	end
	
	else
	begin
		if(start)
		begin
			count <= N-1'b1;
			ov_counter <= '0;
			able <= 1'b1;
		end
		
		else if(able)
		begin
			if(count)
			begin
				count <= count - 1'b1;
			end
			else
			begin
				ov_counter <= 1'b1;
				able <= '0;
			end
		end
		
		if(ov_counter)
		begin
			flag_r <= 1'b1;
		end
		
	end

end

endmodule

