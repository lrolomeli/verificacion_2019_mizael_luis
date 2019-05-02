interface processors_if();
import global_pkg::*;

data_t A;
data_t B;
data_t prev;
logic retro;
logic enable;

data_t out;
logic done;


modport proc(
input A,
input B,
input prev,
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
output prev,

input out

);

endinterface