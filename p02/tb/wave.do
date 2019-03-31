onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_p02/p02/clk
add wave -noupdate /tb_p02/p02/rst
add wave -noupdate /tb_p02/p02/l_s
add wave -noupdate /tb_p02/p02/q
add wave -noupdate /tb_p02/p02/m
add wave -noupdate /tb_p02/p02/product
add wave -noupdate /tb_p02/p02/mux_adder_f_w
add wave -noupdate /tb_p02/p02/a_w
add wave -noupdate /tb_p02/p02/m_w
add wave -noupdate /tb_p02/p02/m_a2_w
add wave -noupdate /tb_p02/p02/a_out_w
add wave -noupdate /tb_p02/p02/q_out_w
add wave -noupdate /tb_p02/p02/shift_out_w
add wave -noupdate /tb_p02/p02/q_w
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
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
WaveRestoreZoom {69100 ps} {70100 ps}
