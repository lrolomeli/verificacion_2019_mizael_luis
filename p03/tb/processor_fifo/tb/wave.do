onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group cosas /tb_Processors_FSM/rst
add wave -noupdate -group cosas /tb_Processors_FSM/start
add wave -noupdate -group cosas -radix unsigned /tb_Processors_FSM/uart
add wave -noupdate -group cosas /tb_Processors_FSM/pop_uart
add wave -noupdate -group cosas /tb_Processors_FSM/uart_push
add wave -noupdate -group cosas /tb_Processors_FSM/N
add wave -noupdate -group cosas /tb_Processors_FSM/full_A
add wave -noupdate -group cosas /tb_Processors_FSM/empty_A
add wave -noupdate -group cosas /tb_Processors_FSM/full_B
add wave -noupdate -group cosas /tb_Processors_FSM/empty_B
add wave -noupdate -group cosas /tb_Processors_FSM/full_out
add wave -noupdate -group cosas /tb_Processors_FSM/empty_out
add wave -noupdate -group cosas /tb_Processors_FSM/result_uart_w
add wave -noupdate -group cosas /tb_Processors_FSM/p03/matrix/ramM/ram
add wave -noupdate -group cosas /tb_Processors_FSM/p03/vector/ramM/clk
add wave -noupdate -group cosas /tb_Processors_FSM/p03/vector/ramM/rd_en
add wave -noupdate -group cosas /tb_Processors_FSM/p03/vector/ramM/wr_en
add wave -noupdate -group cosas /tb_Processors_FSM/p03/vector/ramM/count_push
add wave -noupdate -group cosas /tb_Processors_FSM/p03/vector/ramM/count_pop
add wave -noupdate -group cosas /tb_Processors_FSM/p03/vector/ramM/data_in
add wave -noupdate -group cosas /tb_Processors_FSM/p03/vector/ramM/data_out
add wave -noupdate -expand -group procesador -radix unsigned /tb_Processors_FSM/p03/proc1_itf/A
add wave -noupdate -expand -group procesador -radix unsigned /tb_Processors_FSM/p03/proc1_itf/B
add wave -noupdate -expand -group procesador /tb_Processors_FSM/p03/proc1_itf/retro
add wave -noupdate -expand -group procesador /tb_Processors_FSM/p03/proc1_itf/enable
add wave -noupdate -expand -group procesador -radix unsigned /tb_Processors_FSM/p03/proc1_itf/out
add wave -noupdate -expand -group procesador /tb_Processors_FSM/p03/proc1_itf/done
add wave -noupdate -expand -group procesador -radix unsigned /tb_Processors_FSM/p03/processor1_inst/result
add wave -noupdate -expand -group procesador -radix unsigned /tb_Processors_FSM/p03/processor1_inst/product
add wave -noupdate -expand -group procesador /tb_Processors_FSM/clk
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/state
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/count_N
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/overflow_n
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/count_N_N
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/ov_n_n
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {52 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {49 ps} {115 ps}
