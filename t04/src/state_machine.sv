/*********************************************************************************
* Module Name:  
*	state_machine.sv
* Description:
* Inputs:
* Outputs:
* Version:
*	1.0
* Company: 
*	ITESO
* Engineers: 
*	Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez
* Create Date:  
*	04/02/2019
* Project Name: 
*	t03
* Target Devices: 
*	FPGA ALTERA DE2-115
* Tool versions: 
*	Quartus Prime
*********************************************************************************/

module state_machine
(
	// Input Ports
	input clk,
	input rst,
	input start,
	
	// Output Ports
	output logic led_1hz,
	output logic led_state
);
logic [1:0] state;		 // number of states 
logic [1:0] flag;			 // flag to verify counts until 30 			
logic [2:0] count_on;
logic [1:0] count_off;

always_ff@(posedge clk or negedge rst)
begin

	if(~rst)
	begin
		//Start to job 
		state <= '0;
		count_on <= '0;
		count_off <= '0;
		led_1hz <= 1'b1;
		led_state <= 1'b1;
	end
	
	else
	begin
		//teh visual signal to conut second to second 
		led_1hz <= ~led_1hz;
				
		case(state)
			/** The idle state **/
			2'b00:
			if(start)
			begin
				state <= 2'b01;
				led_state <= '0;
				count_on <= count_on + 1'b1;
			end
			
			/** State on **/
			2'b01:
			if(count_on < 3'd5)
			begin
				led_state <= '0;
				count_off <= '0;
				count_on <= count_on + 1'b1;
			end
			else
			/** sentnce to change state **/
			begin
				state <= 2'b10;
				count_off <= count_off + 1'b1;
			end
			
			/** State off **/
			2'b10:
			if(count_off < 2'd3)
			begin
				led_state <= 1'b1;
				count_on <= '0;
				count_off <= count_off + 1'b1;
			end
			else
			begin
				/** flag to verify time to count until 10 **/
				flag <= flag + 2'b01;
				
				/** sentence to change state **/
				state <= (flag == 2'b11) ? 2'b00 : 2'b01;
			end
			
			default:
			state <= 2'b00;

		endcase
		
	end
	
end

endmodule
