onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_p02/p02/clk
add wave -noupdate /tb_p02/p02/rst
add wave -noupdate /tb_p02/p02/l_s
add wave -noupdate /tb_p02/p02/q
add wave -noupdate /tb_p02/p02/m
add wave -noupdate /tb_p02/p02/product
add wave -noupdate /tb_p02/p02/m_w
add wave -noupdate /tb_p02/p02/m_a2_w
add wave -noupdate /tb_p02/p02/a_out_w
add wave -noupdate /tb_p02/p02/aq_w
add wave -noupdate /tb_p02/p02/aq_reg_w
add wave -noupdate /tb_p02/p02/shift_out_w
add wave -noupdate /tb_p02/p02/mux_n2/out
add wave -noupdate /tb_p02/p02/mux_n2/selector
add wave -noupdate /tb_p02/p02/mux_n2/a
add wave -noupdate /tb_p02/p02/mux_n2/b
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {147900 ps} 0}
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
WaveRestoreZoom {0 ps} {178500 ps}
