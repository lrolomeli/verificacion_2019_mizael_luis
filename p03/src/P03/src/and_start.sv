//================================================================================
// Import the Packages
//================================================================================

`ifndef AND_START
	`define AND_START
	
module and_start
(
	/** Input ports **/
	input a,
	input b,
	input clr,
	input clk,
	input rst,
	
	output logic start
);

wire out;

logic flag;

assign out = a & b;


always_ff@(posedge clk, negedge rst)
begin
	if(~rst)
	begin
		start<='0;
		flag <='0;
	end
	else 
	begin
		start <= '0;
		
		if(out && ~flag)//si ya estan listos los datos comenzamos la operacion.
		begin
			flag <= 1'b1;
			start <= 1'b1;//start debe estar en un por un ciclo de reloj.
		end
		
		if(clr)
			flag <= '0;
	end
end

endmodule
`endif