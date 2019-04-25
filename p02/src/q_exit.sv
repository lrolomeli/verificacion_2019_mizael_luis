/*********************************************************************************
* Module Name: q_exit

* Description: this is the correct Q to different operation 

* Inputs:	QD, QM, QR1, QR0, op, msb_aq,

* Outputs:	out

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  14/04/2019

* Project Name: P02

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/


//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module q_exit
(
	/** Input ports **/
	input wqsize QD, /** division **/
	input wqsize QM, /** multiplication **/
	input wqsize QR1,/** sqrt one **/
	input wqsize QR0,/** sqrt two **/
	input twobits op, /** select operation **/
	input msb_aq,
	
	/** Output ports **/
	output wqsize out

);


always_comb
begin
	case(op)
	
	2'b00:
	begin
		out = QM;
	end
	2'b01:
	begin
		out = QD;
	end
	2'b10:
	begin
		out = (msb_aq) ? QR0: QR1;
	end
	default:
	begin
		out = '0;
	end
	
	endcase

end	
endmodule 
