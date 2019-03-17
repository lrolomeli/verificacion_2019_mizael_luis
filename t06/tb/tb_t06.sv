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
.sign		(sing		)
);

initial begin

    #2  bits = 8'b01111111;
    #12 bits = 8'b11111111;
    #22	bits = 8'b01010101;
    #32 bits = 8'b10101010;
    #42 bits = 8'b01001100;
	
    $stop;
end

endmodule

