//Coder:          DSc Abisai Ramirez Perez
//Date:           03/31/2019
//Name:           sdp_dc_ram.sv
//Description:    This is the HDL of a single dual-port dual-clock random access memory. 

`ifndef FIFO_SV
    `define FIFO_SV
module fifo 
import sdp_dc_ram_pkg::*;
(
input clk,
input rst,
input pop,
input push,
input [W_DATA-1:0] data,

output logic [W_DATA-1:0] rd_data,
output logic full,
output logic empty,

// client ram interface
sdp_dc_ram_if.cln cln_if

);

logic [W_ADDR:0]wr_ptr;
logic [W_ADDR:0]rd_ptr;

 
always_ff@(posedge clk, negedge rst) 
begin
	if(~rst)
	begin
		wr_ptr <= '0;
		rd_ptr <= '0;
		full <= '0;
		empty <= '0;
	end
	
	else
	begin
	
		if(push && ~full)
		begin
				
			cln_if.we <= 1'b1;
			cln_if.wr_addr_a <= wr_ptr;
			cln_if.data_a <= data;
			
			if(rd_ptr == W_DEPTH)
				wr_ptr <= '0;
			else
				wr_ptr++;

		end
		
		
		if(pop && ~empty)
		begin 
			
				
			cln_if.re <= 1'b1;
			cln_if.rd_addr_b <= rd_ptr;
			
			if(rd_ptr == W_DEPTH)
				rd_ptr <= '0;
			else
				rd_ptr++;
		end

		
		full <= ((wr_ptr - rd_ptr) == W_DEPTH) ? 1'b1: 1'b0;
		empty <= (wr_ptr == rd_ptr) ? 1'b1: 1'b0;

	end

end

assign rd_data = cln_if.rd_data_a;

endmodule
`endif