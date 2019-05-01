module uart
#(
	parameter N = 8,
	parameter C = 4,
	parameter D = 434
)
(
	// Port declarations
	input rst,				//senal de reset
	input clk,
	input [N-1:0] tx_data,
	input transmit,
	input serial_rx,
	
	output logic [N-1:0] rx_data,
	output logic serial_tx
);

// Internal Variables
logic receiving;
logic sending;
logic [C-1:0] tx_count;
logic [C-1:0] rx_count;
logic clk_w;
logic transmit_w;

typedef struct {
	logic stop;
	logic [N-1:0] data;
	logic start;

}UART_packet;

UART_packet uart;


`ifdef MODELSIM
assign clk_w = clk;
assign transmit_w = transmit;
`endif

`ifndef MODELSIM

pll_50_115 pll(
	.inclk0(clk),
	.c0(clk_w)
);

debounce db(

	/** Input ports **/
	.clk(clk_w),
	.rst(rst),
	.start(transmit),

	/** Output ports **/
	.db_out(transmit_w)	

);

`endif

//TX UART
always_ff@(posedge clk_w, negedge rst)
begin : tx_uart
	if(~rst)
	begin
		uart.stop <= 1'b1;
		uart.data <= '0;
		uart.start <= '0;
		serial_tx <= 1'b1;
		tx_count <= '0;
		sending <= '0;
	end
	
	else
	begin
		
		if(sending)
		begin
			
			if(tx_count == N)
			begin
				serial_tx <= uart.stop;
				sending <= '0;
				tx_count <= '0;
			end
			else
			begin
				tx_count <= tx_count + 1'b1;
				serial_tx <= uart.data[tx_count];
			end
				
		end
		
		else if(transmit_w)
		begin
			uart.data <= tx_data;
			serial_tx <= uart.start;
			sending <= 1'b1;
		
		end
		
	end
	
end : tx_uart

//RX UART
always_ff@(posedge clk_w, negedge rst)
begin : rx_uart
	if(~rst)
	begin
		receiving <= '0;
		rx_count <= '0;
		rx_data <= '0;
	end
	
	else
	begin
		
		if(~serial_rx || receiving)	//senal de start
		begin
			
			if(rx_count == N+1)	//Si ha recibido todos los bits
			begin
				receiving <= '0;	//Deja de recibir
				rx_count <= '0;	//Reinicia el contador
			end
			else
			begin
				rx_count <= rx_count + 1'b1;
				rx_data[rx_count-1] <= serial_rx;
				receiving <= 1'b1;
			end
				
		end
		
	end
	
end : rx_uart


endmodule
