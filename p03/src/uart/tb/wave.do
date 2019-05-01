onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_p03/p03/rst
add wave -noupdate /tb_p03/p03/clk
add wave -noupdate /tb_p03/p03/tx_data
add wave -noupdate /tb_p03/p03/transmit
add wave -noupdate /tb_p03/p03/serial_rx
add wave -noupdate /tb_p03/p03/rx_data
add wave -noupdate /tb_p03/p03/serial_tx
add wave -noupdate /tb_p03/p03/receiving
add wave -noupdate /tb_p03/p03/sending
add wave -noupdate /tb_p03/p03/tx_count
add wave -noupdate /tb_p03/p03/rx_count
add wave -noupdate /tb_p03/p03/clk_w
add wave -noupdate /tb_p03/p03/transmit_w
add wave -noupdate /tb_p03/p03/uart
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {80800 ps} 0}
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
WaveRestoreZoom {0 ps} {393800 ps}
