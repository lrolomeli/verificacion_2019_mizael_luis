module MS
#(
	parameter DW_2 = 16,
	parameter DW = 8,
	parameter DWlogb2 = $clog2(DW)
)(

	input clk,
	input rst,
	//input start,
	input l_s,
	input [DW-1:0] multiplier,
	input [DW-1:0] multiplicand,
	
	output logic done,
	output logic [DW_2-1:0] product

);

logic [DW-1:0] rgstr1;
logic [DW_2-1:0] rgstr2;
logic [DWlogb2:0] count;

always_ff@(posedge clk, negedge rst)
begin: always_MS

	if(~rst)
	begin
		product <= '0;
		rgstr1 <= '0;
		rgstr2 <= '0;
		count <= '0;
		done <= '0;
	end
	
	else
	begin
		
      if (l_s)
		begin
		   rgstr1 <= multiplier;
			rgstr2 <= multiplicand;
		end
		
		else
		begin
		
			if(rgstr1[count])
			begin
				product <= product + rgstr2;
			end
			
			//rgstr1 <= {1'b0, rgstr1[DW-1:1]};
				
			//size of rgstr2 is DW2 in other words [DW_2-1:0]
			//if we want to shift left 1 bit we must eliminate the msb
			rgstr2 <= {rgstr2[DW_2-2:0], 1'b0}; 
			//Si queremos que no tome en cuenta el bit mas significativo 
			// es decir el signo	tenemos que tomar DW_2-3
			//rgstr2 <= {rgstr2[DW_2-3:0], 1'b0};
			
			if(count == DW)
			begin
				count <= '0;
				done <= 1'b1;
			end
			
			else
			begin
				count <= count + 1'b1;
			end
		
		end
		

	end

end: always_MS

endmodule
