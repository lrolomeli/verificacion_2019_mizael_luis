module mux3_1
#(
	parameter N = 4
)(
	input [N-1:0] m_a2,
	input [N-1:0] m,
	input [1:0] selector,
	
	output logic [N-1:0] mux_out

);

always_comb
begin

	case(selector)
		2'b01:mux_out = m;
		2'b10:mux_out = m_a2;
		default:mux_out = '0;
	endcase

end

endmodule 