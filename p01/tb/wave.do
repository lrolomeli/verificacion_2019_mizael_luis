onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_P01/P01/clk
add wave -noupdate /tb_P01/P01/rst
add wave -noupdate /tb_P01/P01/start
add wave -noupdate -color White -radix decimal /tb_P01/P01/multiplier
add wave -noupdate -color White -radix decimal /tb_P01/P01/multiplicand
add wave -noupdate /tb_P01/P01/sign
add wave -noupdate -color Magenta -radix decimal /tb_P01/P01/product
add wave -noupdate -color Yellow /tb_P01/P01/start_w
add wave -noupdate -color {Blue Violet} /tb_P01/P01/done_w
add wave -noupdate -color {Blue Violet} /tb_P01/P01/l_s_w
add wave -noupdate -color {Blue Violet} /tb_P01/P01/permit_w
add wave -noupdate -color {Blue Violet} /tb_P01/P01/charged_w
add wave -noupdate -color White -radix hexadecimal /tb_P01/P01/multiplier_w
add wave -noupdate -color White -radix hexadecimal /tb_P01/P01/multiplicand_w
add wave -noupdate -color White -radix hexadecimal /tb_P01/P01/rgstr1_w
add wave -noupdate -color White -radix hexadecimal /tb_P01/P01/rgstr2_w
add wave -noupdate -color White -radix hexadecimal /tb_P01/P01/shift_reg_w
add wave -noupdate -color White -radix hexadecimal /tb_P01/P01/product_w
add wave -noupdate -color Blue /Pkg_Global::state
add wave -noupdate /tb_P01/P01/sa/count
add wave -noupdate /tb_P01/P01/result_w
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {41943070000 ps} 0}
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
WaveRestoreZoom {41943025900 ps} {41943194100 ps}
