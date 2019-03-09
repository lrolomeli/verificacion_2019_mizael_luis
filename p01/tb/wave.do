onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_module/clk
add wave -noupdate /top_module/rst
add wave -noupdate /top_module/l_s
add wave -noupdate /top_module/multiplier
add wave -noupdate /top_module/multiplicand
add wave -noupdate -radix hexadecimal /top_module/product
add wave -noupdate /top_module/rgstr1_w
add wave -noupdate /top_module/rgstr2_w
add wave -noupdate /top_module/shift_reg_w
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {122810 ps} 0}
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
WaveRestoreZoom {0 ps} {525 ns}
