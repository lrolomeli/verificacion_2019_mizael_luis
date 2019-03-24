/*********************************************************************************
* Module Name: control_unit.sv

* Description: Control Unit

* Inputs: clk, rst, start, l_s, done

* Outputs: init_FSM, enable

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
import Pkg_Global::*;

module control_unit 
(

	/** Input ports **/
	input idle,
	input load,
	input ready,
	
	/** Output ports **/
	output logic l_s,
	output logic permit

);


always_comb
begin

	if(idle)
	begin
		permit = BIT_ZERO;
		l_s = BIT_ZERO;
	end
	
	else
	begin
		permit = BIT_ZERO;
		l_s = BIT_ZERO;
	end
	
	if(load)
	begin
		l_s = BIT_ONE;
	end
	
	else
	begin
		l_s = BIT_ZERO;
	end

	if(ready)
	begin
		permit = BIT_ONE;
	end
	
	else
	begin
		permit = BIT_ZERO;
	end

end


endmodule
