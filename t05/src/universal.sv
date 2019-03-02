module universal 
#(
	parameter DW = 4
)(
	input clk,
	input rst,
	input l_s,
	input [2:0] selector,
	input enable,
	input [DW-1:0] inp,
	output logic [DW-1:0] out
);

enum logic [2:0] {SIPO_LSB, SIPO_MSB, PISO_LSB, PISO_MSB, SISO_LSB, SISO_MSB, PIPO} STATES;

logic [DW-1:0] rgstr;


always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
	begin
		rgstr <= '0;
	end
	
	else
	begin
		if(enable)
		begin
		
			case(selector)
				SIPO_LSB:
				begin
					if (l_s)
					begin
						rgstr <= inp;
					end
					else
					begin
						rgstr <= {rgstr[DW-2:0], inp[0]};
						out <= rgstr;
					end
				end
				
				SIPO_MSB:
				begin
					if (l_s)
					begin
						rgstr <= inp;
					end
					else
					begin
						rgstr <= {inp[0], rgstr[DW-1:1]};
						out <= rgstr;
					end
				end
				
				PISO_LSB:
				begin
					if (l_s)
					begin
						rgstr <= inp;
					end
					
					else
					begin   
						rgstr <= {rgstr[0], rgstr[DW-1:1]};	
						out  = rgstr[0];
					end
				end
				
				PISO_MSB:
				begin
					if (l_s)
					begin
						rgstr <= inp;
					end
					
					else
					begin
						rgstr <= {rgstr[DW-2:0], rgstr[DW-1]};
						out  = rgstr[DW-1];
					end
				end
				
				SISO_LSB:
				begin
					if (l_s)
					begin
						rgstr <= inp;
					end
					else
					begin
						rgstr  <= {rgstr[DW-2:0], inp[0]};
						out  = rgstr[DW-1];
					end
				end
				
				SISO_MSB:
				begin
					if (l_s)
					begin
						rgstr <= inp;
					end
					else
					begin
						rgstr  <= {inp[0], rgstr[DW-1:1]};
						out  = rgstr[0];
					end
				end
				
				PIPO:
				begin
					if (l_s)
					begin
						rgstr <= inp;
					end
					else
					begin
						rgstr  <= inp;
						out  = rgstr;
					end
				end
				
				default:
				begin
					out <= '0;
					rgstr <= '0;
				end
				
			endcase
		
		end
				
	end

end

endmodule 