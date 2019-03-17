`timescale 10ns / 100ps
module tb_t06;


logic [7:0] bits;
logic [6:0] units;
logic [6:0] tens;
logic [6:0] hundreds;
logic sign;

top t6(

.bits		(bits      	),
.units		(units     	),
.tens		(tens    	),
.hundreds	(hundreds       ),
.sign		(sign		)
);

initial begin

    bits = 8'b10101001;
	#1
    bits = 8'b11101101;
	#2	
    $stop;
end

endmodule

