module debouncer
#(
	parameter MILLIS = 20,		// (2^(20))/ 50 MHz = 20 ms debouncer time
	parameter COUNT = 1048575  // Max Counting with 20 bits

)(
	// inputs
	input clk,
	input	rst, 
	input start,

	// output
	output logic db_out													
);
	

	// logic counter
	logic [MILLIS-1 : 0]	counter;							
	// input flip-flops
	logic DFF1;
	logic DFF2;
	
	
	always_ff@(posedge clk, negedge rst)
	begin: debouncer
	
		if(~rst)
		begin
			DFF1 <= '0;
			DFF2 <= '0;
			counter <= '0;
			db_out <= '0;
		end
		
		else
		begin
		
			DFF1 <= start;		//la entrada al ff1
			DFF2 <= DFF1;		//el ff1 al ff2
		
			if(DFF1 ^ DFF2)	//Si son diferentes el resultado es 1
			begin
				counter <= '0;	//limpia el contador
			end
			
			else	//Si son iguales checa si el contador termino
			begin
			
				if(counter == COUNT)
				begin
					db_out <= 1'b1;	//si termina de contar asigna la salida como la entrada
					counter <= '0;		//limpia el contador y si no
				end
				
				else
				begin
					db_out <= '0;
					counter <= counter + 1'b1;	//simplemente cuenta hasta llegar a la cuenta maxima.
				end
				
			end

		end

	end: debouncer

endmodule


