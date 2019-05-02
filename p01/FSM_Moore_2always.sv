//					01		Cuenta ascendente
//					10		Cuenta descendente
//					11		Mantiene la cuenta.
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FSM_Moore_2always(
    input [1:0] X,
    input En,
    input Rst,
    input Clk,
    output reg [1:0]Cuenta
    );
localparam 	S0=0, S1=1, S2=2,S3=3;

reg [1:0]Edo_Actual;	
//reg  [1:0]Edo_Siguiente;


always @ (posedge Clk or negedge Rst) // Circuito Secuenicial en un proceso always.

if (!Rst)
	Edo_Actual<=0;

else if (En)
begin
	case(Edo_Actual)
		S0:begin 
			if (X==1)
				Edo_Actual<=S1; // Asciende en la cuenta
			else if (X==2)
				Edo_Actual<=S3;	// Desciende en la cuenta.
			else 
				Edo_Actual<=S0; // Hold
			end

		S1:begin 
			if (X==1)
				Edo_Actual<=S2;
			else if (X==2)
				Edo_Actual<=S0;
			else 
				Edo_Actual<=S1;
			end
		S2:begin 
			if (X==1)
				Edo_Actual<=S3;
			else if (X==2)
				Edo_Actual<=S1;
			else 
				Edo_Actual<=S2;
			end
		S3:begin 
			if (X==1)
				Edo_Actual<=S0;
			else if (X==2)
				Edo_Actual<=S2;
			else 
				Edo_Actual<=S3;
			end
		default:Edo_Actual<=0;
	endcase

end



always@*
begin
	Cuenta=Edo_Actual;
end

endmodule
