module demux
(
	/** Input ports **/
	input load,
	input sel,
	
	output load_y,
	output load_x

);


assign load_y = (sel) ? load : '0;
assign load_x = (sel) ? '0 : load; 



endmodule
