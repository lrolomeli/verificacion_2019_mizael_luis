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
#(
	parameter N = 4
)(
	/** Input ports **/
	input [N:0] QD, /** division **/
	input [N:0] QM, /** multiplication **/
	input [N:0] QR1,/** sqrt one **/
	input [N:0] QR0,/** sqrt two **/
	input [1:0] op, /** select operation **/
	input msb_aq,
	
	/** Output ports **/
	output logic [N:0]out

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
