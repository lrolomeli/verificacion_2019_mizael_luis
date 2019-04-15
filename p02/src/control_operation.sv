module control_operation
#(
	parameter N = 4
)
(
	input [N-1:0] a_plus_m,
	input [N-1:0] a_minus_m,
	input [N-1:0] a,
	input [N:0] q,
	input [2*N:0] aq_reg,
	input msb_AM,
	input ov_count,
	input msb_reg_A,
	input [1:0] op,
	
	output logic msb_aq,//bit que va al multiplexor de Q
	output logic [2*N:0] aq_out
);

logic [2*N:0] aq;


always_comb
begin
	case(op)
		2'b00://Multiplication
		begin
			//Si Q0 = 1 y Q1 = 0
			if(~q[1] && q[0])
				aq_out = {a_plus_m[N-1],a_plus_m,q[N:1]};
			else if(q[1] && ~q[0])
				aq_out = {a_minus_m[N-1],a_minus_m,q[N:1]};
			else 
				aq_out = {a[N-1],a,q[N:1]}; // shift signado 
		end
		2'b01://Division
		begin
			//Si a_sign es positiva
			if(a_minus_m[N-1])
				aq_out = {a_plus_m, q[N-1:1], 1'b0, 1'b0};
			else
				aq_out = {a_minus_m, q[N-1:1], 1'b1, 1'b0};
		end
		2'b10://Raiz
		begin
			case({ov_count,msb_reg_A})
				2'b00:
				begin
					aq_out = aq;
				end
				2'b01:
				begin
					aq_out = aq;
				end
				2'b10:
				begin
					aq_out = {a_plus_m, q[N:0]};
				end
				2'b11:
				begin
					aq_out = aq_reg;
				end		
				default:
				begin
					aq_out = '0;
				end
			endcase
		end
		
		default:
		begin
			aq_out = '0;
		end		
	endcase
end

assign aq = (msb_AM) ? {a_plus_m, q[N:0]}: {a_minus_m, q[N:0]};
assign msb_aq = aq[2*N];

endmodule
