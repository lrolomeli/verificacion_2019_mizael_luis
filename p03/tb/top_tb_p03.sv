timeunit 1ps; //It specifies the time unit that all the delay will take in the simulation.
timeprecision 1ps;// It specifies the resolution in the simulation.

import fifo_pkg::*;
import uart_pkg::*;
import processor_pkg::*;
import global_pkg::*;
module top_tb_p03;

	logic clk;
	logic rst;
	logic rx_interrupt;
	logic working;
	data_t data;
	
	logic tx;
	logic ready;
	logic full_A;
	logic empty_A;
	logic clear_interrupt;
	

top_p03_tb DUV
(
	.*
	
);

/**************************************************************************/
	
/******************** Stimulus *************************/
initial // Clock generator
  begin
    clk = 1'b0;
    forever #2 clk = !clk;
  end
/*----------------------------------------------------------------------------------------*/

initial begin /*Reset*/
	# 0 rst = 1'b0;
	#1 rst = 1'b1;
end
/*----------------------------------------------------------------------------------------*/


initial begin
	# 0 data = '0;
	// PROBAR EL COMANDO 1
	# 40 data = 8'h FE;
	
	# 40 data = 8'h 03;
	
	# 40 data = 8'h 01;
	
	# 40 data = 8'h 04;
		
	# 40 data = 8'h EF;

	// PROBAR EL COMANDO 2
	# 40 data = 8'h FE;
	
	# 40 data = 8'h 02;
	
	# 40 data = 8'h 02;
		
	# 40 data = 8'h EF;
	
	// PROBAR EL COMANDO 3
	# 40 data = 8'h FE;
	
	# 40 data = 8'h 02;
	
	# 40 data = 8'h 03;
		
	# 40 data = 8'h EF;
	
	// PROBAR EL COMANDO 4
	# 40 data = 8'h FE;
	
	# 40 data = 8'h 03;
	
	# 40 data = 8'h 04;
	
	# 40 data = 8'h 01;
	
	# 40 data = 8'h 02;
	
	# 40 data = 8'h 03;
	
	# 40 data = 8'h 04;
	
	# 40 data = 8'h 05;
	
	# 40 data = 8'h 06;
	
	# 40 data = 8'h 07;
	
	# 40 data = 8'h 08;
	
	# 40 data = 8'h 09;
	
	# 40 data = 8'h 0A;
	
	# 40 data = 8'h 0B;
	
	# 40 data = 8'h 0C;
	
	# 40 data = 8'h 0D;
	
	# 40 data = 8'h 0E;
	
	# 40 data = 8'h 0F;
	
	# 40 data = 8'h 10;
		
	# 40 data = 8'h EF;
	
	// PROBAR EL COMANDO 5
	# 40 data = 8'h FE;
	
	# 40 data = 8'h 03;
	
	# 40 data = 8'h 05;
	
	# 40 data = 8'h 11;
	
	# 40 data = 8'h 12;
	
	# 40 data = 8'h 13;
	
	# 40 data = 8'h 14;
		
	# 40 data = 8'h EF;
		
	$stop;
end


initial begin
	# 0 rx_interrupt = 1'b0;
	//comando 1
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
		# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8
		# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	#8
		# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8 
	# 30 rx_interrupt = 1'b1;
	# 2 rx_interrupt = 1'b0;
	# 8	
	$stop;
	

end



endmodule

