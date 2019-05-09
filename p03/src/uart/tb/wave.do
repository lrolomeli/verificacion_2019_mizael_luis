onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_p03/uart/tx_top_inst/clk
add wave -noupdate /tb_p03/uart/tx_top_inst/rst
add wave -noupdate /tb_p03/uart/tx_top_inst/transmit
add wave -noupdate /tb_p03/uart/tx_top_inst/tx_data
add wave -noupdate /tb_p03/uart/tx_top_inst/tx
add wave -noupdate /tb_p03/uart/tx_top_inst/tx_fsm_inst/state
add wave -noupdate /tb_p03/uart/tx_top_inst/clk_w
add wave -noupdate /tb_p03/uart/tx_top_inst/enb_w
add wave -noupdate /tb_p03/uart/tx_top_inst/sel_w
add wave -noupdate /tb_p03/uart/tx_top_inst/load_w
add wave -noupdate /tb_p03/uart/tx_top_inst/data_out_w
add wave -noupdate /tb_p03/uart/tx_top_inst/parity_w
add wave -noupdate /tb_p03/uart/rx_top_inst/clk
add wave -noupdate /tb_p03/uart/rx_top_inst/rst
add wave -noupdate /tb_p03/uart/rx_top_inst/rx
add wave -noupdate /tb_p03/uart/rx_top_inst/rx_fsm_inst/state
add wave -noupdate /tb_p03/uart/rx_top_inst/parity_err
add wave -noupdate /tb_p03/uart/rx_top_inst/rx_data
add wave -noupdate /tb_p03/uart/rx_top_inst/count_w
add wave -noupdate /tb_p03/uart/rx_top_inst/ovf_w
add wave -noupdate /tb_p03/uart/rx_top_inst/sel_w
add wave -noupdate /tb_p03/uart/rx_top_inst/enb_count_w
add wave -noupdate /tb_p03/uart/rx_top_inst/enb_sipo_fsm
add wave -noupdate /tb_p03/uart/rx_top_inst/enb_sipo
add wave -noupdate /tb_p03/uart/rx_top_inst/enb_parity_fsm
add wave -noupdate /tb_p03/uart/rx_top_inst/parity_w
add wave -noupdate /tb_p03/uart/rx_top_inst/enb_parity
add wave -noupdate /tb_p03/uart/rx_top_inst/parity
add wave -noupdate /tb_p03/uart/transmit
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {95392600 ps} 0}
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
WaveRestoreZoom {0 ps} {132394600 ps}
