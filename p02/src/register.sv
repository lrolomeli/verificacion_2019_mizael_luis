module register
#(
	parameter N = 4
)(
	/** Input ports **/
	input clk,
	input rst,
	input [N-1:0] in,
	
	/** Output ports **/
	output logic [N-1:0] reg_in
);



always_ff@(posedge clk, negedge rst)
begin: register

	if(~rst)
	begin
		/** Clean registers **/
		reg_in <= '0;
	end
	
	else
	begin
		/** Load input **/
		reg_in <= in;
	end

end: register

endmodule
