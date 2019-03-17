//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO
// Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez
// 
// Create Date:  16/03/2019
// Design Name:  
// Module Name:  bin2dec
// Project Name: pbd
// Target Devices: FPGA ALTERA DE2-115
// Tool versions: Quartus Prime
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bin2dec
(
    input [7:0] bin,
    output logic [11:0] bcd
);

	
	
always_comb
begin
	bcd = '0;
	for (integer i = 0; i < 8; i = i+1'b1)
	begin : generate_block

		bcd = {bcd[10:0],bin[7-i]};
			
		bcd[3:0] = (bcd[3:0] > 4) ? bcd[3:0] + 4'd3 : bcd[3:0];

		bcd[7:4] = (bcd[7:4] > 4) ? bcd[7:4] + 4'd3 : bcd[7:4];

		bcd[11:8] = (bcd[11:8] > 4) ? bcd[11:8] + 4'd3 : bcd[11:8];  

	end
end
   
                
endmodule
