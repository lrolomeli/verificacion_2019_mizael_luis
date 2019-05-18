onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/uart
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/clk
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/rst
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/push_A
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/push_B
add wave -noupdate -expand -group processor -radix unsigned /top_tb_p03/DUV/top_processors_inst/N
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/clear
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/full_A
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/empty_A
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/ready
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/transmit
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/result_uart_w
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/A_w
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/B_w
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/out_w
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/pop_done_w
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/pop_w
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/uart_push_w
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/push_result_w
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/pop_result_w
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/matrix_ready
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/vector_ready
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/p_enable_w
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/p_retro_w
add wave -noupdate -group CMD /top_tb_p03/DUV/cmd_fsm_inst/clk
add wave -noupdate -group CMD /top_tb_p03/DUV/cmd_fsm_inst/rst
add wave -noupdate -group CMD -radix hexadecimal /top_tb_p03/DUV/cmd_fsm_inst/uart_data
add wave -noupdate -group CMD /top_tb_p03/DUV/cmd_fsm_inst/rx_interrupt
add wave -noupdate -group CMD /top_tb_p03/DUV/cmd_fsm_inst/clear_interrupt
add wave -noupdate -group CMD /top_tb_p03/DUV/cmd_fsm_inst/push_A
add wave -noupdate -group CMD /top_tb_p03/DUV/cmd_fsm_inst/push_B
add wave -noupdate -group CMD /top_tb_p03/DUV/cmd_fsm_inst/enable_n
add wave -noupdate -group CMD /top_tb_p03/DUV/cmd_fsm_inst/clear
add wave -noupdate -group CMD /top_tb_p03/DUV/cmd_fsm_inst/status
add wave -noupdate /top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram
add wave -noupdate -childformat {{{/top_tb_p03/DUV/top_processors_inst/vector/ramV/ram[3]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/vector/ramV/ram[2]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/vector/ramV/ram[1]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/vector/ramV/ram[0]} -radix unsigned}} -expand -subitemconfig {{/top_tb_p03/DUV/top_processors_inst/vector/ramV/ram[3]} {-height 15 -radix unsigned} {/top_tb_p03/DUV/top_processors_inst/vector/ramV/ram[2]} {-height 15 -radix unsigned} {/top_tb_p03/DUV/top_processors_inst/vector/ramV/ram[1]} {-height 15 -radix unsigned} {/top_tb_p03/DUV/top_processors_inst/vector/ramV/ram[0]} {-height 15 -radix unsigned}} /top_tb_p03/DUV/top_processors_inst/vector/ramV/ram
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/clk
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/rst
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/start
add wave -noupdate -group fsm_process -radix unsigned /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/N
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/p_retro
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/p_enable
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/pop_result
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/transmit
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/pop
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/push
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/state
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/cnt
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/chain_cnt
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/ovf
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/chain_ovf
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/enb
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/clrcnt
add wave -noupdate -group fsm_process /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/clrchain
add wave -noupdate -expand -group p1 /top_tb_p03/DUV/top_processors_inst/processor1_inst/clk
add wave -noupdate -expand -group p1 /top_tb_p03/DUV/top_processors_inst/processor1_inst/rst
add wave -noupdate -expand -group p1 -radix unsigned /top_tb_p03/DUV/top_processors_inst/processor1_inst/A
add wave -noupdate -expand -group p1 -radix unsigned /top_tb_p03/DUV/top_processors_inst/processor1_inst/B
add wave -noupdate -expand -group p1 /top_tb_p03/DUV/top_processors_inst/processor1_inst/enable
add wave -noupdate -expand -group p1 /top_tb_p03/DUV/top_processors_inst/processor1_inst/retro
add wave -noupdate -expand -group p1 -radix unsigned /top_tb_p03/DUV/top_processors_inst/processor1_inst/out
add wave -noupdate -expand -group p1 -radix unsigned /top_tb_p03/DUV/top_processors_inst/processor1_inst/product
add wave -noupdate /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/state
add wave -noupdate /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/cnt
add wave -noupdate /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/chain_cnt
add wave -noupdate /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/ovf
add wave -noupdate /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/chain_ovf
add wave -noupdate /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/clrcnt
add wave -noupdate /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/clrchain
add wave -noupdate /top_tb_p03/DUV/top_processors_inst/vector/pointers_inst/count_pop
add wave -noupdate /top_tb_p03/DUV/top_processors_inst/matrix/pointers_M_inst/count_pop
add wave -noupdate /top_tb_p03/DUV/top_processors_inst/vector/ramV/rd_en
add wave -noupdate /top_tb_p03/DUV/top_processors_inst/matrix/ready
add wave -noupdate /top_tb_p03/DUV/top_processors_inst/vector/ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1620 ps} 0}
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
WaveRestoreZoom {1634 ps} {1708 ps}
