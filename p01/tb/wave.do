onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_P01/P01/clk
add wave -noupdate /tb_P01/P01/rst
add wave -noupdate /tb_P01/P01/start
add wave -noupdate /tb_P01/P01/multiplier
add wave -noupdate /tb_P01/P01/multiplicand
add wave -noupdate /tb_P01/P01/sign
add wave -noupdate /tb_P01/P01/product
add wave -noupdate /tb_P01/P01/start_w
add wave -noupdate /tb_P01/P01/init_FSM_w
add wave -noupdate /tb_P01/P01/done_w
add wave -noupdate /tb_P01/P01/l_s_w
add wave -noupdate /tb_P01/P01/complete_w
add wave -noupdate /tb_P01/P01/permit_w
add wave -noupdate /tb_P01/P01/charged_w
add wave -noupdate /tb_P01/P01/rgstr1_w
add wave -noupdate /tb_P01/P01/rgstr2_w
add wave -noupdate /tb_P01/P01/shift_reg_w
add wave -noupdate /tb_P01/P01/product_w
add wave -noupdate /Pkg_Global::count
add wave -noupdate /Pkg_Global::state
add wave -noupdate /tb_P01/P01/multiplier_w
add wave -noupdate /tb_P01/P01/multiplicand_w
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {83886693700 ps} 0}
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
WaveRestoreZoom {83886621500 ps} {83886867500 ps}
