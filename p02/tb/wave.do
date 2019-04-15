onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_p02/p02/clk
add wave -noupdate /tb_p02/p02/rst
add wave -noupdate /tb_p02/p02/load
add wave -noupdate /tb_p02/p02/op
add wave -noupdate /tb_p02/p02/start
add wave -noupdate /tb_p02/p02/data
add wave -noupdate /tb_p02/p02/result
add wave -noupdate /tb_p02/p02/remainder
add wave -noupdate /tb_p02/p02/op_w
add wave -noupdate /tb_p02/p02/load_x_w
add wave -noupdate /tb_p02/p02/load_y_w
add wave -noupdate /tb_p02/p02/loaded_x_w
add wave -noupdate /tb_p02/p02/loaded_y_w
add wave -noupdate /tb_p02/p02/loaded_res_w
add wave -noupdate /tb_p02/p02/msb_aq_w
add wave -noupdate -color Magenta /tb_p02/p02/operating_w
add wave -noupdate /tb_p02/p02/done_w
add wave -noupdate /tb_p02/p02/stop_w
add wave -noupdate /tb_p02/p02/regQ_w
add wave -noupdate /tb_p02/p02/regM_w
add wave -noupdate /tb_p02/p02/aq_w
add wave -noupdate /tb_p02/p02/A_sh_w
add wave -noupdate /tb_p02/p02/flag_r_w
add wave -noupdate /tb_p02/p02/count_w
add wave -noupdate /tb_p02/p02/count_sh_w
add wave -noupdate /tb_p02/p02/M_sh_w
add wave -noupdate /tb_p02/p02/am_or_w
add wave -noupdate /tb_p02/p02/qor1_w
add wave -noupdate /tb_p02/p02/qor3_w
add wave -noupdate /tb_p02/p02/q1_sh_w
add wave -noupdate /tb_p02/p02/q_sh_w
add wave -noupdate /tb_p02/p02/subs1_w
add wave -noupdate /tb_p02/p02/subs2_w
add wave -noupdate /tb_p02/p02/q_mux1_w
add wave -noupdate /tb_p02/p02/q_mux2_w
add wave -noupdate /tb_p02/p02/add1_w
add wave -noupdate /tb_p02/p02/add2_w
add wave -noupdate /tb_p02/p02/a_subs_w
add wave -noupdate /tb_p02/p02/a_add_w
add wave -noupdate /tb_p02/p02/q_exit_w
add wave -noupdate /tb_p02/p02/aq_ls_w
add wave -noupdate /tb_p02/p02/aq_mux_w
add wave -noupdate /tb_p02/p02/aq_out_w
add wave -noupdate -radix binary /tb_p02/p02/aq_reg_w
add wave -noupdate /tb_p02/p02/sel_w
add wave -noupdate /tb_p02/p02/count/count
add wave -noupdate /tb_p02/p02/co_inst/aq
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {249900 ps} 0}
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
WaveRestoreZoom {0 ps} {598500 ps}
