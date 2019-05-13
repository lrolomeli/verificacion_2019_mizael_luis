onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group cosas /tb_Processors_FSM/rst
add wave -noupdate -expand -group cosas /tb_Processors_FSM/start
add wave -noupdate -expand -group cosas -radix unsigned /tb_Processors_FSM/uart
add wave -noupdate -expand -group cosas /tb_Processors_FSM/pop_uart
add wave -noupdate -expand -group cosas /tb_Processors_FSM/N
add wave -noupdate -expand -group cosas /tb_Processors_FSM/full_A
add wave -noupdate -expand -group cosas /tb_Processors_FSM/empty_A
add wave -noupdate -expand -group cosas /tb_Processors_FSM/result_uart_w
add wave -noupdate -expand -group cosas -expand /tb_Processors_FSM/p03/matrix/ramM/ram
add wave -noupdate -expand -group procesador -radix unsigned /tb_Processors_FSM/p03/proc1_itf/A
add wave -noupdate -expand -group procesador -radix unsigned /tb_Processors_FSM/p03/proc1_itf/B
add wave -noupdate -expand -group procesador /tb_Processors_FSM/p03/proc1_itf/retro
add wave -noupdate -expand -group procesador /tb_Processors_FSM/p03/proc1_itf/enable
add wave -noupdate -expand -group procesador -radix unsigned /tb_Processors_FSM/p03/proc1_itf/out
add wave -noupdate -expand -group procesador /tb_Processors_FSM/p03/proc1_itf/done
add wave -noupdate -expand -group procesador -radix unsigned /tb_Processors_FSM/p03/processor1_inst/result
add wave -noupdate -expand -group procesador -radix unsigned /tb_Processors_FSM/p03/processor1_inst/product
add wave -noupdate -expand -group procesador /tb_Processors_FSM/clk
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/state
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/count_N
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/overflow_n
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/count_N_N
add wave -noupdate /tb_Processors_FSM/p03/fsm_p_inst/ov_n_n
add wave -noupdate -childformat {{{/tb_Processors_FSM/p03/vector/ramV/ram[5]} -radix unsigned} {{/tb_Processors_FSM/p03/vector/ramV/ram[4]} -radix unsigned} {{/tb_Processors_FSM/p03/vector/ramV/ram[3]} -radix unsigned} {{/tb_Processors_FSM/p03/vector/ramV/ram[2]} -radix unsigned} {{/tb_Processors_FSM/p03/vector/ramV/ram[1]} -radix unsigned} {{/tb_Processors_FSM/p03/vector/ramV/ram[0]} -radix unsigned}} -expand -subitemconfig {{/tb_Processors_FSM/p03/vector/ramV/ram[5]} {-radix unsigned} {/tb_Processors_FSM/p03/vector/ramV/ram[4]} {-radix unsigned} {/tb_Processors_FSM/p03/vector/ramV/ram[3]} {-radix unsigned} {/tb_Processors_FSM/p03/vector/ramV/ram[2]} {-radix unsigned} {/tb_Processors_FSM/p03/vector/ramV/ram[1]} {-radix unsigned} {/tb_Processors_FSM/p03/vector/ramV/ram[0]} {-radix unsigned}} /tb_Processors_FSM/p03/vector/ramV/ram
add wave -noupdate -radix unsigned -childformat {{{/tb_Processors_FSM/p03/fifo_result/ramV/ram[4]} -radix unsigned} {{/tb_Processors_FSM/p03/fifo_result/ramV/ram[3]} -radix unsigned} {{/tb_Processors_FSM/p03/fifo_result/ramV/ram[2]} -radix unsigned} {{/tb_Processors_FSM/p03/fifo_result/ramV/ram[1]} -radix unsigned} {{/tb_Processors_FSM/p03/fifo_result/ramV/ram[0]} -radix unsigned}} -expand -subitemconfig {{/tb_Processors_FSM/p03/fifo_result/ramV/ram[4]} {-radix unsigned} {/tb_Processors_FSM/p03/fifo_result/ramV/ram[3]} {-radix unsigned} {/tb_Processors_FSM/p03/fifo_result/ramV/ram[2]} {-radix unsigned} {/tb_Processors_FSM/p03/fifo_result/ramV/ram[1]} {-radix unsigned} {/tb_Processors_FSM/p03/fifo_result/ramV/ram[0]} {-radix unsigned}} /tb_Processors_FSM/p03/fifo_result/ramV/ram
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {428 ps} 0}
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
WaveRestoreZoom {174 ps} {438 ps}
