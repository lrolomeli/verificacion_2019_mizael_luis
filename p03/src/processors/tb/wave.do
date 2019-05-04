onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group P1 /tb_Processors_FSM/p03/proc1_itf/A
add wave -noupdate -expand -group P1 /tb_Processors_FSM/p03/proc1_itf/B
add wave -noupdate -expand -group P1 /tb_Processors_FSM/p03/proc1_itf/prev
add wave -noupdate -expand -group P1 /tb_Processors_FSM/p03/proc1_itf/retro
add wave -noupdate -expand -group P1 /tb_Processors_FSM/p03/proc1_itf/enable
add wave -noupdate -expand -group P1 /tb_Processors_FSM/p03/proc1_itf/out
add wave -noupdate -expand -group P1 /tb_Processors_FSM/p03/proc1_itf/done
add wave -noupdate /tb_Processors_FSM/p03/clk
add wave -noupdate -expand -group P2 /tb_Processors_FSM/p03/proc2_itf/A
add wave -noupdate -expand -group P2 /tb_Processors_FSM/p03/proc2_itf/B
add wave -noupdate -expand -group P2 /tb_Processors_FSM/p03/proc2_itf/prev
add wave -noupdate -expand -group P2 /tb_Processors_FSM/p03/proc2_itf/retro
add wave -noupdate -expand -group P2 /tb_Processors_FSM/p03/proc2_itf/enable
add wave -noupdate -expand -group P2 /tb_Processors_FSM/p03/proc2_itf/out
add wave -noupdate -expand -group P2 /tb_Processors_FSM/p03/proc2_itf/done
add wave -noupdate -expand -group P3 /tb_Processors_FSM/p03/proc3_itf/A
add wave -noupdate -expand -group P3 /tb_Processors_FSM/p03/proc3_itf/B
add wave -noupdate -expand -group P3 /tb_Processors_FSM/p03/proc3_itf/prev
add wave -noupdate -expand -group P3 /tb_Processors_FSM/p03/proc3_itf/retro
add wave -noupdate -expand -group P3 /tb_Processors_FSM/p03/proc3_itf/enable
add wave -noupdate -expand -group P3 /tb_Processors_FSM/p03/proc3_itf/out
add wave -noupdate -expand -group P3 /tb_Processors_FSM/p03/proc3_itf/done
add wave -noupdate -group P4 /tb_Processors_FSM/p03/proc4_itf/A
add wave -noupdate -group P4 /tb_Processors_FSM/p03/proc4_itf/B
add wave -noupdate -group P4 /tb_Processors_FSM/p03/proc4_itf/prev
add wave -noupdate -group P4 /tb_Processors_FSM/p03/proc4_itf/retro
add wave -noupdate -group P4 /tb_Processors_FSM/p03/proc4_itf/enable
add wave -noupdate -group P4 /tb_Processors_FSM/p03/proc4_itf/out
add wave -noupdate -group P4 /tb_Processors_FSM/p03/proc4_itf/done
add wave -noupdate -group C3 /tb_Processors_FSM/p03/FSM1/client3/A
add wave -noupdate -group C3 /tb_Processors_FSM/p03/FSM1/client3/B
add wave -noupdate -group C3 /tb_Processors_FSM/p03/FSM1/client3/prev
add wave -noupdate -group C3 /tb_Processors_FSM/p03/FSM1/client3/retro
add wave -noupdate -group C3 /tb_Processors_FSM/p03/FSM1/client3/enable
add wave -noupdate -group C3 /tb_Processors_FSM/p03/FSM1/client3/out
add wave -noupdate -group C3 /tb_Processors_FSM/p03/FSM1/client3/done
add wave -noupdate -group C4 /tb_Processors_FSM/p03/FSM1/client4/A
add wave -noupdate -group C4 /tb_Processors_FSM/p03/FSM1/client4/B
add wave -noupdate -group C4 /tb_Processors_FSM/p03/FSM1/client4/prev
add wave -noupdate -group C4 /tb_Processors_FSM/p03/FSM1/client4/retro
add wave -noupdate -group C4 /tb_Processors_FSM/p03/FSM1/client4/enable
add wave -noupdate -group C4 /tb_Processors_FSM/p03/FSM1/client4/out
add wave -noupdate -group C4 /tb_Processors_FSM/p03/FSM1/client4/done
add wave -noupdate -expand -group C1 /tb_Processors_FSM/p03/FSM1/client1/A
add wave -noupdate -expand -group C1 /tb_Processors_FSM/p03/FSM1/client1/B
add wave -noupdate -expand -group C1 /tb_Processors_FSM/p03/FSM1/client1/prev
add wave -noupdate -expand -group C1 /tb_Processors_FSM/p03/FSM1/client1/retro
add wave -noupdate -expand -group C1 /tb_Processors_FSM/p03/FSM1/client1/enable
add wave -noupdate -expand -group C1 /tb_Processors_FSM/p03/FSM1/client1/out
add wave -noupdate -expand -group C1 /tb_Processors_FSM/p03/FSM1/client1/done
add wave -noupdate -group C2 /tb_Processors_FSM/p03/FSM1/client2/A
add wave -noupdate -group C2 /tb_Processors_FSM/p03/FSM1/client2/B
add wave -noupdate -group C2 /tb_Processors_FSM/p03/FSM1/client2/prev
add wave -noupdate -group C2 /tb_Processors_FSM/p03/FSM1/client2/retro
add wave -noupdate -group C2 /tb_Processors_FSM/p03/FSM1/client2/enable
add wave -noupdate -group C2 /tb_Processors_FSM/p03/FSM1/client2/out
add wave -noupdate -group C2 /tb_Processors_FSM/p03/FSM1/client2/done
add wave -noupdate /tb_Processors_FSM/p03/FSM1/state
add wave -noupdate /tb_Processors_FSM/p03/rst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {38 ps} 0}
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
WaveRestoreZoom {27 ps} {97 ps}
