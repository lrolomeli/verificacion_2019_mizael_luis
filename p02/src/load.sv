/*********************************************************************************
* Module Name: Load.sv

* Description: Load data to diferents registers  

* Inputs: clk, rst, l_s, [N-1:0] in

* Outputs: [N-1:0] reg_in,

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  09/04/2019

* Project Name: P01

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

//================================================================================
// Import the Packages
//================================================================================

module load
#(
	parameter N = 4
)(
	/** Input ports **/
	input clk,
	input rst,
	input l_s, //Senal de carga de datos de entrada o senal de start
	input [N-1:0] in,
	
	/** Output ports **/
	output logic [N-1:0] reg_in,
	output logic loaded
);



	always_ff@(posedge clk, negedge rst)
	begin: load

		if(~rst)
		begin
			/** Clean registers **/
			reg_in <= '0;
			loaded <= '0;
		end
		
		else
		begin
			
			if (l_s)
			begin
				/** Load input **/
				reg_in <= in;
				loaded <= 1'b1;
			end

			else
			begin
				/** maintain register data **/
				loaded <= loaded;
				reg_in <= reg_in;				
			end

		end

	end: load

endmodule
