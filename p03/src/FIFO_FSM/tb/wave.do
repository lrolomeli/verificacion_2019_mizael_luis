onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fifo/DUV/clk
add wave -noupdate /tb_fifo/DUV/rst
add wave -noupdate /tb_fifo/DUV/pop
add wave -noupdate /tb_fifo/DUV/push
add wave -noupdate -radix unsigned /tb_fifo/DUV/data_in
add wave -noupdate /tb_fifo/DUV/full
add wave -noupdate /tb_fifo/DUV/empty
add wave -noupdate /tb_fifo/DUV/data_out
add wave -noupdate /tb_fifo/DUV/full_w
add wave -noupdate /tb_fifo/DUV/empty_w
add wave -noupdate /tb_fifo/DUV/push_wire
add wave -noupdate /tb_fifo/DUV/pop_wire
add wave -noupdate /tb_fifo/DUV/count_push_w
add wave -noupdate /tb_fifo/DUV/count_pop_w
add wave -noupdate /tb_fifo/DUV/wr_en_w
add wave -noupdate /tb_fifo/DUV/rd_en_w
add wave -noupdate /tb_fifo/DUV/fsm_fifo_inst/state
add wave -noupdate /tb_fifo/DUV/ramV/rd_en
add wave -noupdate /tb_fifo/DUV/ramV/wr_en
add wave -noupdate /tb_fifo/DUV/ramV/count_push
add wave -noupdate /tb_fifo/DUV/ramV/count_pop
add wave -noupdate /tb_fifo/DUV/ramV/data_in
add wave -noupdate /tb_fifo/DUV/ramV/data_out
add wave -noupdate -childformat {{{/tb_fifo/DUV/ramV/ram[7]} -radix unsigned} {{/tb_fifo/DUV/ramV/ram[6]} -radix unsigned} {{/tb_fifo/DUV/ramV/ram[5]} -radix unsigned} {{/tb_fifo/DUV/ramV/ram[4]} -radix unsigned} {{/tb_fifo/DUV/ramV/ram[3]} -radix unsigned} {{/tb_fifo/DUV/ramV/ram[2]} -radix unsigned} {{/tb_fifo/DUV/ramV/ram[1]} -radix unsigned} {{/tb_fifo/DUV/ramV/ram[0]} -radix unsigned}} -expand -subitemconfig {{/tb_fifo/DUV/ramV/ram[7]} {-radix unsigned} {/tb_fifo/DUV/ramV/ram[6]} {-radix unsigned} {/tb_fifo/DUV/ramV/ram[5]} {-radix unsigned} {/tb_fifo/DUV/ramV/ram[4]} {-radix unsigned} {/tb_fifo/DUV/ramV/ram[3]} {-radix unsigned} {/tb_fifo/DUV/ramV/ram[2]} {-radix unsigned} {/tb_fifo/DUV/ramV/ram[1]} {-radix unsigned} {/tb_fifo/DUV/ramV/ram[0]} {-radix unsigned}} /tb_fifo/DUV/ramV/ram
add wave -noupdate /tb_fifo/DUV/index_pop_push/clk
add wave -noupdate /tb_fifo/DUV/index_pop_push/rst
add wave -noupdate /tb_fifo/DUV/index_pop_push/push
add wave -noupdate /tb_fifo/DUV/index_pop_push/pop
add wave -noupdate /tb_fifo/DUV/index_pop_push/count_push
add wave -noupdate /tb_fifo/DUV/index_pop_push/count_pop
add wave -noupdate /tb_fifo/DUV/index_pop_push/full
add wave -noupdate /tb_fifo/DUV/index_pop_push/empty
add wave -noupdate /tb_fifo/DUV/index_pop_push/ovf_pop
add wave -noupdate /tb_fifo/DUV/index_pop_push/ovf_push
add wave -noupdate /tb_fifo/DUV/index_pop_push/b_pop
add wave -noupdate /tb_fifo/DUV/index_pop_push/b_push
add wave -noupdate /tb_fifo/DUV/fsm_fifo_inst/push_out
add wave -noupdate /tb_fifo/DUV/fsm_fifo_inst/pop_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 365
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
WaveRestoreZoom {0 ps} {72 ps}
