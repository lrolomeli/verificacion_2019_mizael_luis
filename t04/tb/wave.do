onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top_module/clk
add wave -noupdate /tb_top_module/rst
add wave -noupdate /tb_top_module/start
add wave -noupdate /tb_top_module/led_1hz
add wave -noupdate /tb_top_module/led_state
add wave -noupdate /tb_top_module/top_module/c/FPGA_RATE
add wave -noupdate /tb_top_module/top_module/c/RATE
add wave -noupdate /tb_top_module/top_module/c/COUNT
add wave -noupdate /tb_top_module/top_module/c/BITS
add wave -noupdate /tb_top_module/top_module/c/fpga_clk
add wave -noupdate /tb_top_module/top_module/c/rst
add wave -noupdate /tb_top_module/top_module/c/enable
add wave -noupdate /tb_top_module/top_module/c/clk_div
add wave -noupdate -radix unsigned /tb_top_module/top_module/c/time_count
add wave -noupdate /tb_top_module/top_module/sm/clk
add wave -noupdate /tb_top_module/top_module/sm/rst
add wave -noupdate /tb_top_module/top_module/sm/start
add wave -noupdate /tb_top_module/top_module/sm/led_1hz
add wave -noupdate /tb_top_module/top_module/sm/led_state
add wave -noupdate /tb_top_module/top_module/sm/state
add wave -noupdate /tb_top_module/top_module/sm/flag
add wave -noupdate /tb_top_module/top_module/sm/count_on
add wave -noupdate /tb_top_module/top_module/sm/count_off
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {28600 ps} 0}
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
WaveRestoreZoom {0 ps} {630 ns}
