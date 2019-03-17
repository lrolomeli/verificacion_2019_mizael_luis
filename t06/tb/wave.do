onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_t06/t6/bits
add wave -noupdate /tb_t06/t6/units
add wave -noupdate /tb_t06/t6/tens
add wave -noupdate /tb_t06/t6/hundreds
add wave -noupdate /tb_t06/t6/sign
add wave -noupdate /tb_t06/t6/units_w
add wave -noupdate /tb_t06/t6/tens_w
add wave -noupdate /tb_t06/t6/hundreds_w
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4500 ps} 0}
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
WaveRestoreZoom {0 ps} {31500 ps}
