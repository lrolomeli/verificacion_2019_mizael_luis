module register
#(
	parameter N = 4
)(
	/** Input ports **/
	input clk,
	input rst,
	input load,
	input [N-1:0] in,
	
	/** Output ports **/
	output logic [N-1:0] reg_in,
	output logic loaded
);



always_ff@(posedge clk, negedge rst)
begin: register

	if(~rst)
	begin
		/** Clean registers **/
		reg_in <= '0;
		loaded <= '0; 
	end
	
	else
	begin

		if(load)
		begin
			reg_in <= in;
			loaded <= 1'b1; 
		end
		else
		begin
			reg_in <= reg_in;
		end

	end

end: register

endmodule
