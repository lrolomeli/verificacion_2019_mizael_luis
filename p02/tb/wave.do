onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_p02/p02/clk
add wave -noupdate /tb_p02/p02/rst
add wave -noupdate /tb_p02/p02/load
add wave -noupdate /tb_p02/p02/op
add wave -noupdate /tb_p02/p02/clear
add wave -noupdate /tb_p02/p02/Q
add wave -noupdate /tb_p02/p02/M
add wave -noupdate /tb_p02/p02/product
add wave -noupdate /tb_p02/p02/clear_w
add wave -noupdate /tb_p02/p02/op_w
add wave -noupdate /tb_p02/p02/regQ_w
add wave -noupdate /tb_p02/p02/regM_w
add wave -noupdate /tb_p02/p02/aq_w
add wave -noupdate /tb_p02/p02/aq_op_w
add wave -noupdate /tb_p02/p02/aq_ls_w
add wave -noupdate /tb_p02/p02/a_w
add wave -noupdate /tb_p02/p02/a_p_w
add wave -noupdate /tb_p02/p02/a_subs_w
add wave -noupdate /tb_p02/p02/a_add_w
add wave -noupdate /tb_p02/p02/q_w
add wave -noupdate /tb_p02/p02/aq_out_w
add wave -noupdate /tb_p02/p02/aq_reg_w
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {23900 ps} 0}
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
WaveRestoreZoom {0 ps} {630 ns}
