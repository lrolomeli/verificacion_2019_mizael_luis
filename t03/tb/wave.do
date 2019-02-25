onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top_module/clk
add wave -noupdate /tb_top_module/rst
add wave -noupdate /tb_top_module/start
add wave -noupdate /tb_top_module/led_1hz
add wave -noupdate /tb_top_module/led_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {119860664900 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {126000105 ns}
