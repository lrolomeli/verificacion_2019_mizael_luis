/*********************************************************************************
* Description: Global Package

* Version: 1.0

* Company: ITESO

* Engineers: Luis Roberto Lomeli Plascencia, Jorge Mizael Rodriguez Gutierrez

* Create Date:  01/05/2019

* Project Name: P03

* Target Devices: FPGA ALTERA DE2-115

* Tool versions: Quartus Prime
*********************************************************************************/

module top_processors
(
	input clk,
	input rst

);
	 
processors_if proc1_itf();
processors_if proc2_itf();
processors_if proc3_itf();
processors_if proc4_itf();


processor processor1_inst
(
	.*,
	.processor(proc1_itf)
);

processor processor2_inst
(
	.*,
	.processor(proc2_itf)
);

processor processor3_inst
(
	.*,
	.processor(proc3_itf)
);

processor processor4_inst
(
	.*,
	.processor(proc4_itf)
);

//fsm
//(
//	.client1(proc1_itf)
//	.client2(proc2_itf)
//	.client3(proc3_itf)
//	.client4(proc4_itf)
//);


endmodule
