module mux3_1
#(
	parameter N = 4
)(

	input [N-1:0] m_a2,
	input [N-1:0] m,
	input [1:0] mux_adder_f,
	
	output logic [N-1:0] mux_out

);



always_comb
begin
	case(mux_adder_f)
		2'b00:mux_out = m;
		2'b01:mux_out = m_a2;
		2'b10:mux_out = '0;
		default:mux_out = '0;
	endcase

end
endmodule 