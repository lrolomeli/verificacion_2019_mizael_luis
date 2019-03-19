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

//================================================================================
// Import the Packages
//================================================================================
import Global_Pkg::*;

module bin2dec
(
	 /** Input ports **/
    input [W_IN:ZERO] bin,

	 /** Output ports **/
    output logic [W_OUT:ZERO] bcd,
	 output sign
);

/** VARIABLE TO SAVE INPUT **/
logic [W_IN:ZERO] in;

/** LOGIC TO APLICATE COMPLEMENT a2 **/
assign in = (bin[SEVEN]) ? ~(bin) + BIT_ONE : bin;
assign sign = bin[SEVEN];

always_comb
begin
	/** INIT TO OUT WITH ZERO **/
	bcd = BIT_ZERO;

	/** USE TO GENERATE **/
	for (integer i = ZERO; i < EIGHT; i = i + BIT_ONE)
	begin : generate_block

		/** ACCOMMODATION OF THE OUTPUT TO SEVEN SEGMENTS **/
		bcd = {bcd[TEEN:ZERO],in[SEVEN-i]};

		/** LOGIC TO ASSIGN UNIT **/
		bcd[THREE:ZERO] =  (i < SEVEN && bcd[THREE:ZERO] > FOUR) ? bcd[THREE:ZERO] + BIT_THREE : bcd[THREE:ZERO];

		/** LOGIC TO ASSIGN TESNS **/
		bcd[SEVEN:FOUR] =  (i < SEVEN && bcd[SEVEN:FOUR] > FOUR) ? bcd[SEVEN:FOUR] + BIT_THREE : bcd[SEVEN:FOUR];

		/** LOGIC TO ASSIGN HUNDREDS **/
		bcd[ELEVEN:EIGHT] = (i < SEVEN && bcd[ELEVEN:EIGHT] > FOUR) ? bcd[ELEVEN:EIGHT] + BIT_THREE : bcd[ELEVEN:EIGHT];

	end

end


endmodule
