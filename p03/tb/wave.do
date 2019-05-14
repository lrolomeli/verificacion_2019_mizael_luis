onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb_p03/DUV/clk
add wave -noupdate /top_tb_p03/DUV/rst
add wave -noupdate /top_tb_p03/DUV/rx_interrupt
add wave -noupdate /top_tb_p03/DUV/data
add wave -noupdate /top_tb_p03/DUV/tx
add wave -noupdate /top_tb_p03/DUV/ready
add wave -noupdate /top_tb_p03/DUV/full_A
add wave -noupdate /top_tb_p03/DUV/empty_A
add wave -noupdate /top_tb_p03/DUV/result_w
add wave -noupdate /top_tb_p03/DUV/N_w
add wave -noupdate /top_tb_p03/DUV/enable_n_w
add wave -noupdate /top_tb_p03/DUV/push_A_w
add wave -noupdate /top_tb_p03/DUV/push_B_w
add wave -noupdate /top_tb_p03/DUV/transmit_w
add wave -noupdate /top_tb_p03/DUV/clear_interrupt_w
add wave -noupdate /top_tb_p03/DUV/data_w
add wave -noupdate /top_tb_p03/DUV/clear_w
add wave -noupdate /top_tb_p03/DUV/cmd_fsm_inst/uart_data
add wave -noupdate /top_tb_p03/DUV/cmd_fsm_inst/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {18 ps} 0}
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
WaveRestoreZoom {0 ps} {660 ps}
