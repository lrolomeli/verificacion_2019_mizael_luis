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
import global_pkg ::*;
module top_processors
(
	input clk,
	input rst,
	input start,
	input load,
	input A,
	input B,
	
	output logic pop,
	output logic ov_counter,
	output logic[1 : 0] sel,
	output logic done

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

provider provider1_inst
(
	.*,
	.client(proc1_itf)
);

processor processor2_inst
(
	.*,
	.processor(proc2_itf)
);

provider provider2_inst
(
	.*,
	.client(proc2_itf)
);

processor processor3_inst
(
	.*,
	.processor(proc3_itf)
);

provider provider3_inst
(
	.*,
	.client(proc3_itf)
);

processor processor4_inst
(
	.*,
	.processor(proc4_itf)
);

provider provider4_inst
(
	.*,
	.client(proc4_itf)
);

fsm FSM1
(
	.*,
	.client1(proc1_itf.ctrl),
	.client2(proc2_itf),
	.client3(proc3_itf),
	.client4(proc4_itf)
);


endmodule
