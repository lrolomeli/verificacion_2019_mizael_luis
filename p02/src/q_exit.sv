//================================================================================
// Import the Packages
//================================================================================
import Pkg_Global::*;

module q_exit
#(
	parameter N = 4
)(
	input [N:0] QD,
	input [N:0] QM,
	input [N:0] QR1,
	input [N:0] QR0,
	input [1:0] op,
	input msb_aq,
	
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
