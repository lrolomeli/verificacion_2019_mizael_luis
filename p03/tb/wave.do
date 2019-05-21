onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/clk
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/rst
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/N
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/p_retro
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/p_enable
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/pop_result
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/transmit
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/pop
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/push
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/clr
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/state
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/cnt
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/chain_cnt
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/ovf
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/chain_ovf
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/enb
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/clrcnt
add wave -noupdate -group fsm_processor /top_tb_p03/DUV/top_processors_inst/fsm_p_inst/clrchain
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/processor1_inst/clk
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/processor1_inst/rst
add wave -noupdate -expand -group processor -radix unsigned /top_tb_p03/DUV/top_processors_inst/processor1_inst/A
add wave -noupdate -expand -group processor -radix unsigned /top_tb_p03/DUV/top_processors_inst/processor1_inst/B
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/processor1_inst/enable
add wave -noupdate -expand -group processor /top_tb_p03/DUV/top_processors_inst/processor1_inst/retro
add wave -noupdate -expand -group processor -radix unsigned /top_tb_p03/DUV/top_processors_inst/processor1_inst/out
add wave -noupdate -expand -group processor -radix unsigned /top_tb_p03/DUV/top_processors_inst/processor1_inst/product
add wave -noupdate -expand -group vector /top_tb_p03/DUV/top_processors_inst/vector/clk
add wave -noupdate -expand -group vector /top_tb_p03/DUV/top_processors_inst/vector/rst
add wave -noupdate -expand -group vector /top_tb_p03/DUV/top_processors_inst/vector/pop
add wave -noupdate -expand -group vector /top_tb_p03/DUV/top_processors_inst/vector/push
add wave -noupdate -expand -group vector /top_tb_p03/DUV/top_processors_inst/vector/data_in
add wave -noupdate -expand -group vector /top_tb_p03/DUV/top_processors_inst/vector/N
add wave -noupdate -expand -group vector /top_tb_p03/DUV/top_processors_inst/vector/clr
add wave -noupdate -expand -group vector /top_tb_p03/DUV/top_processors_inst/vector/data_out
add wave -noupdate -expand -group vector /top_tb_p03/DUV/top_processors_inst/vector/ready
add wave -noupdate -expand -group vector /top_tb_p03/DUV/top_processors_inst/vector/count_push_w
add wave -noupdate -expand -group vector /top_tb_p03/DUV/top_processors_inst/vector/count_pop_w
add wave -noupdate -expand -group vector -radix unsigned -childformat {{{/top_tb_p03/DUV/top_processors_inst/vector/ramV/ram[3]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/vector/ramV/ram[2]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/vector/ramV/ram[1]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/vector/ramV/ram[0]} -radix unsigned}} -expand -subitemconfig {{/top_tb_p03/DUV/top_processors_inst/vector/ramV/ram[3]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/vector/ramV/ram[2]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/vector/ramV/ram[1]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/vector/ramV/ram[0]} {-radix unsigned}} /top_tb_p03/DUV/top_processors_inst/vector/ramV/ram
add wave -noupdate -expand -group matrix /top_tb_p03/DUV/top_processors_inst/matrix/clk
add wave -noupdate -expand -group matrix /top_tb_p03/DUV/top_processors_inst/matrix/rst
add wave -noupdate -expand -group matrix /top_tb_p03/DUV/top_processors_inst/matrix/pop
add wave -noupdate -expand -group matrix /top_tb_p03/DUV/top_processors_inst/matrix/push
add wave -noupdate -expand -group matrix /top_tb_p03/DUV/top_processors_inst/matrix/data_in
add wave -noupdate -expand -group matrix /top_tb_p03/DUV/top_processors_inst/matrix/N
add wave -noupdate -expand -group matrix /top_tb_p03/DUV/top_processors_inst/matrix/full
add wave -noupdate -expand -group matrix /top_tb_p03/DUV/top_processors_inst/matrix/empty
add wave -noupdate -expand -group matrix /top_tb_p03/DUV/top_processors_inst/matrix/data_out
add wave -noupdate -expand -group matrix /top_tb_p03/DUV/top_processors_inst/matrix/ready
add wave -noupdate -expand -group matrix /top_tb_p03/DUV/top_processors_inst/matrix/full_w
add wave -noupdate -expand -group matrix /top_tb_p03/DUV/top_processors_inst/matrix/empty_w
add wave -noupdate -expand -group matrix /top_tb_p03/DUV/top_processors_inst/matrix/count_push_w
add wave -noupdate -expand -group matrix /top_tb_p03/DUV/top_processors_inst/matrix/count_pop_w
add wave -noupdate -expand -group matrix /top_tb_p03/DUV/top_processors_inst/matrix/wr_en_w
add wave -noupdate -expand -group matrix /top_tb_p03/DUV/top_processors_inst/matrix/rd_en_w
add wave -noupdate -expand -group matrix -childformat {{{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[15]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[14]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[13]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[12]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[11]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[10]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[9]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[8]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[7]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[6]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[5]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[4]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[3]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[2]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[1]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[0]} -radix unsigned}} -subitemconfig {{/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[15]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[14]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[13]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[12]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[11]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[10]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[9]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[8]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[7]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[6]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[5]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[4]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[3]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[2]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[1]} {-radix unsigned} {/top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram[0]} {-radix unsigned}} /top_tb_p03/DUV/top_processors_inst/matrix/ramM/ram
add wave -noupdate -group vector_result /top_tb_p03/DUV/top_processors_inst/fifo_result/clk
add wave -noupdate -group vector_result /top_tb_p03/DUV/top_processors_inst/fifo_result/rst
add wave -noupdate -group vector_result /top_tb_p03/DUV/top_processors_inst/fifo_result/pop
add wave -noupdate -group vector_result /top_tb_p03/DUV/top_processors_inst/fifo_result/push
add wave -noupdate -group vector_result -radix unsigned /top_tb_p03/DUV/top_processors_inst/fifo_result/data_in
add wave -noupdate -group vector_result /top_tb_p03/DUV/top_processors_inst/fifo_result/N
add wave -noupdate -group vector_result /top_tb_p03/DUV/top_processors_inst/fifo_result/clr
add wave -noupdate -group vector_result -radix unsigned -childformat {{{/top_tb_p03/DUV/top_processors_inst/fifo_result/data_out[7]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/fifo_result/data_out[6]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/fifo_result/data_out[5]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/fifo_result/data_out[4]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/fifo_result/data_out[3]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/fifo_result/data_out[2]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/fifo_result/data_out[1]} -radix unsigned} {{/top_tb_p03/DUV/top_processors_inst/fifo_result/data_out[0]} -radix unsigned}} -expand -subitemconfig {{/top_tb_p03/DUV/top_processors_inst/fifo_result/data_out[7]} {-height 15 -radix unsigned} {/top_tb_p03/DUV/top_processors_inst/fifo_result/data_out[6]} {-height 15 -radix unsigned} {/top_tb_p03/DUV/top_processors_inst/fifo_result/data_out[5]} {-height 15 -radix unsigned} {/top_tb_p03/DUV/top_processors_inst/fifo_result/data_out[4]} {-height 15 -radix unsigned} {/top_tb_p03/DUV/top_processors_inst/fifo_result/data_out[3]} {-height 15 -radix unsigned} {/top_tb_p03/DUV/top_processors_inst/fifo_result/data_out[2]} {-height 15 -radix unsigned} {/top_tb_p03/DUV/top_processors_inst/fifo_result/data_out[1]} {-height 15 -radix unsigned} {/top_tb_p03/DUV/top_processors_inst/fifo_result/data_out[0]} {-height 15 -radix unsigned}} /top_tb_p03/DUV/top_processors_inst/fifo_result/data_out
add wave -noupdate -group vector_result /top_tb_p03/DUV/top_processors_inst/fifo_result/ready
add wave -noupdate -group vector_result /top_tb_p03/DUV/top_processors_inst/fifo_result/count_push_w
add wave -noupdate -group vector_result /top_tb_p03/DUV/top_processors_inst/fifo_result/count_pop_w
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {986 ps} 0}
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
WaveRestoreZoom {0 ps} {2037 ps}
