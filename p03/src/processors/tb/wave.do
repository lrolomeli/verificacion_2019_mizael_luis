onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_Processors_FSM/p03/clk
add wave -noupdate /tb_Processors_FSM/p03/rst
add wave -noupdate /tb_Processors_FSM/p03/start
add wave -noupdate /tb_Processors_FSM/p03/A
add wave -noupdate /tb_Processors_FSM/p03/B
add wave -noupdate /tb_Processors_FSM/p03/push
add wave -noupdate /tb_Processors_FSM/p03/pop_done_w
add wave -noupdate /tb_Processors_FSM/p03/pop_w
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/clk
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/rst
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/start
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/pop_done
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/pop
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/push
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/state
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/count_N
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/count_N_N
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/overflow_n
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/ov_n_n
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/add
add wave -noupdate /tb_Processors_FSM/p03/proc1_itf/A
add wave -noupdate /tb_Processors_FSM/p03/proc1_itf/B
add wave -noupdate /tb_Processors_FSM/p03/proc1_itf/retro
add wave -noupdate /tb_Processors_FSM/p03/proc1_itf/enable
add wave -noupdate -radix unsigned /tb_Processors_FSM/p03/proc1_itf/out
add wave -noupdate /tb_Processors_FSM/p03/proc1_itf/done
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {70 ps} 0}
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
WaveRestoreZoom {0 ps} {108 ps}
