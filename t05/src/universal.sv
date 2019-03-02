/*********************************************************************************
* Module Name:  
*	universal.sv
* Description:
* Inputs: clk, rst, l_s, [2:0]selector, enable, [DW-1:0]inp
* Outputs: [DW-1:0] out
* Version:
*	1.0
* Company: 
*	ITESO
* Engineers: 
*	Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez
* Create Date:  
*	01/03/2019
* Project Name: 
*	t05
* Target Devices: 
*	FPGA ALTERA DE2-115
* Tool versions: 
*	Quartus Prime
*********************************************************************************/
module universal 
#(
	/** parameter to module **/
	parameter DW = 4
)(
	
	/** Input ports **/
	input clk,
	input rst,
	input l_s,
	input [2:0] selector,
	input enable,
	input [DW-1:0] inp,
	
	/** Output ports **/
	output logic [DW-1:0] out
);

/** enum used to select type of register **/
enum logic [2:0] {SIPO_LSB, SIPO_MSB, PISO_LSB, PISO_MSB, SISO_LSB, SISO_MSB, PIPO} STATES;

/** register used **/
logic [DW-1:0] rgstr;


always_ff@(posedge clk, negedge rst)
begin

	if(~rst)
	begin
		rgstr <= '0; /** assigned zero to register **/
	end
	
	else
	begin
		if(enable)
		begin
		
			case(selector)
				SIPO_LSB:	/** type of register **/
				begin
					if (l_s)	
					begin
						rgstr <= inp;	/** load date to register **/
					end
					else
					begin		
						rgstr <= {rgstr[DW-2:0], inp[0]};	/** specific function register **/
						out <= rgstr;								/** output of register **/
					end
				end
				
				SIPO_MSB:	/** type of register **/
				begin
					if (l_s)
					begin
						rgstr <= inp;	/** load date to register **/
					end
					else
					begin
						rgstr <= {inp[0], rgstr[DW-1:1]};	/** specific function register **/
						out <= rgstr;								/** output of register **/
					end
				end
				
				PISO_LSB:	/** type of register **/
				begin
					if (l_s)
					begin
						rgstr <= inp;	/** load date to register **/
					end
					
					else
					begin   
						rgstr <= {rgstr[0], rgstr[DW-1:1]};	/** specific function register **/
						out  = rgstr[0];							/** output of register **/
					end
				end
				
				PISO_MSB: /** type of register **/
				begin
					if (l_s)
					begin
						rgstr <= inp;	/** load date to register **/
					end
					
					else
					begin
						rgstr <= {rgstr[DW-2:0], rgstr[DW-1]};	/** specific function register **/
						out  = rgstr[DW-1];							/** output of register **/
					end
				end
				
				SISO_LSB:	/** type of register **/
				begin
					if (l_s)
					begin
						rgstr <= inp;	/** load date to register **/
					end
					else
					begin
						rgstr  <= {rgstr[DW-2:0], inp[0]};	/** specific function register **/
						out  = rgstr[DW-1];						/** output of register **/
					end
				end
				
				SISO_MSB:	/** type of register **/
				begin
					if (l_s)
					begin
						rgstr <= inp;	/** load date to register **/
					end
					else
					begin
						rgstr  <= {inp[0], rgstr[DW-1:1]};	/** specific function register **/
						out  = rgstr[0];							/** output of register **/
					end
				end
				
				PIPO:	/** type of register **/
				begin
					if (l_s)
					begin
						rgstr <= inp;	/** load date to register **/
					end
					else
					begin
						rgstr  <= inp;	/** specific function register **/
						out  = rgstr;	/** output of register **/
					end
				end
				
				default: /** default case **/
				begin
					out <= '0;
					rgstr <= '0;
				end
				
			endcase
		
		end
				
	end

end

endmodule 