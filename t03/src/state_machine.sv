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
	input clk,
	input rst,
	input start,
	
	output logic led_1hz,
	output logic led_state
);

logic [1:0] state;
logic [1:0] flag;
logic [2:0] count_on;
logic [2:0] count_off;

always_ff@(posedge clk or negedge rst)
begin

	if(~rst)
	begin
		state <= '0;
		count_on <= '0;
		count_off <= '0;
		led_1hz <= 1'b1;
		led_state <= 1'b1;
	end
	
	else
	begin
	
		led_1hz <= ~led_1hz;
		
		case(state)
			2'b00:
			if(start)
			begin
				state <= 2'b01;
			end
			
			2'b01:
			if(count_on < 3'd6)
			begin
				led_state <= '0;
				count_off <= '0;
				count_on <= count_on + 1'b1;
			end
			else
			begin
				state <= 2'b10;
			end
			
			2'b10:
			if(count_off < 3'd4)
			begin
				led_state <= 1'b1;
				count_on <= '0;
				count_off <= count_off + 1'b1;
			end
			else
			begin
				flag <= flag + 2'b01;
				state <= (flag == 2'b11) ? 2'b00 : 2'b01;
			end
			
			default:
			state <= 2'b00;

		endcase
		
	end
	
end

endmodule
