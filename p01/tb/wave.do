onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_P01/P01/sm/clk
add wave -noupdate /tb_P01/P01/sm/rst
add wave -noupdate /tb_P01/P01/sm/start
add wave -noupdate /tb_P01/P01/sm/l_s
add wave -noupdate /tb_P01/P01/sm/done
add wave -noupdate /tb_P01/P01/sm/idle
add wave -noupdate /tb_P01/P01/sm/load
add wave -noupdate /tb_P01/P01/sm/ready
add wave -noupdate /tb_P01/P01/sm/state
add wave -noupdate /tb_P01/P01/cu/idle
add wave -noupdate /tb_P01/P01/cu/load
add wave -noupdate /tb_P01/P01/cu/ready
add wave -noupdate /tb_P01/P01/cu/l_s
add wave -noupdate /tb_P01/P01/cu/permit
add wave -noupdate -radix decimal /tb_P01/P01/product
add wave -noupdate -radix decimal /tb_P01/P01/shift_reg_w
add wave -noupdate -radix decimal /tb_P01/P01/multiplier
add wave -noupdate -radix decimal /tb_P01/P01/multiplicand
add wave -noupdate -radix decimal /tb_P01/P01/sa/count
add wave -noupdate -radix decimal /tb_P01/P01/ld/rgstr1
add wave -noupdate -radix decimal /tb_P01/P01/ld/rgstr2
add wave -noupdate /tb_P01/P01/ld/charged
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {250000 ps} 0}
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
WaveRestoreZoom {0 ps} {1533 ns}
