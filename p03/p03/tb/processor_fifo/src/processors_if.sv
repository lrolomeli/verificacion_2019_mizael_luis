interface processors_if();
import processor_pkg::*;
import fifo_pkg::data_t;
data_t A;
data_t B;
logic retro;
logic enable;

data_t out;
logic done;


modport proc(
input A,
input B,
input retro,
input enable,

output out,
output done
);


modport ctrl
(

output retro,
output enable,

input done
);

modport data
(
output A,
output B,

input out

);

endinterface
