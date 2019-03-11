onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_P01/clk
add wave -noupdate /tb_P01/rst
add wave -noupdate /tb_P01/start
add wave -noupdate /tb_P01/multiplier
add wave -noupdate /tb_P01/multiplicand
add wave -noupdate /tb_P01/sign
add wave -noupdate -radix hexadecimal /tb_P01/product
add wave -noupdate /tb_P01/P01/ld/clk
add wave -noupdate /tb_P01/P01/ld/rst
add wave -noupdate /tb_P01/P01/ld/l_s
add wave -noupdate /tb_P01/P01/ld/multiplier
add wave -noupdate /tb_P01/P01/ld/multiplicand
add wave -noupdate /tb_P01/P01/ld/charged
add wave -noupdate /tb_P01/P01/ld/rgstr1
add wave -noupdate /tb_P01/P01/ld/rgstr2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3235309200 ps} 0}
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
WaveRestoreZoom {20971608900 ps} {20971817700 ps}
