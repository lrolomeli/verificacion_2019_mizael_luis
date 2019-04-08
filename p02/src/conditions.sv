module conditions
#(
	parameter N = 4
)
(
	input [N-1:0] a_plus_m,
	input [N-1:0] a_minus_m,
	input [N-1:0] a,
	input [N:0] q,
	input op,
	input a_sign,
	input Q0,
	input Q1,
	
	output logic [2*N:0] aq_out
);



always_comb
begin
	case(op)
		1'b0://Multiplication
		begin
			//Si Q0 = 1 y Q1 = 0
			if(~Q1 && Q0)
				aq_out = {a_plus_m[N-1],a_plus_m,q[N:1]};
			else if(Q1 && ~Q0)
				aq_out = {a_minus_m[N-1],a_minus_m,q[N:1]};
			else
				aq_out = {a[N-1],a,q[N:1]};
		end
		1'b1://Division
		begin
			//Si a_sign es positiva
			if(a_sign)
				aq_out = {a_plus_m, q[N-1:1], 1'b0, 1'b0};
			else
				aq_out = {a_minus_m, q[N-1:1], 1'b1, 1'b0};
		end
		default:
		begin
			aq_out = '0;
		end		
	endcase
end


endmodule
