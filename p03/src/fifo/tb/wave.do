onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /FIFO_TB/DUV/clk
add wave -noupdate /FIFO_TB/DUV/rst
add wave -noupdate /FIFO_TB/DUV/pop
add wave -noupdate /FIFO_TB/DUV/push
add wave -noupdate /FIFO_TB/DUV/data
add wave -noupdate /FIFO_TB/DUV/rd_data
add wave -noupdate /FIFO_TB/DUV/full
add wave -noupdate /FIFO_TB/DUV/empty
add wave -noupdate /FIFO_TB/DUV/sram/clk_a
add wave -noupdate /FIFO_TB/DUV/sram/clk_b
add wave -noupdate -radix unsigned -childformat {{{/FIFO_TB/DUV/sram/ram[7]} -radix unsigned} {{/FIFO_TB/DUV/sram/ram[6]} -radix unsigned} {{/FIFO_TB/DUV/sram/ram[5]} -radix unsigned} {{/FIFO_TB/DUV/sram/ram[4]} -radix unsigned} {{/FIFO_TB/DUV/sram/ram[3]} -radix unsigned} {{/FIFO_TB/DUV/sram/ram[2]} -radix unsigned} {{/FIFO_TB/DUV/sram/ram[1]} -radix unsigned} {{/FIFO_TB/DUV/sram/ram[0]} -radix unsigned}} -expand -subitemconfig {{/FIFO_TB/DUV/sram/ram[7]} {-height 15 -radix unsigned} {/FIFO_TB/DUV/sram/ram[6]} {-height 15 -radix unsigned} {/FIFO_TB/DUV/sram/ram[5]} {-height 15 -radix unsigned} {/FIFO_TB/DUV/sram/ram[4]} {-height 15 -radix unsigned} {/FIFO_TB/DUV/sram/ram[3]} {-height 15 -radix unsigned} {/FIFO_TB/DUV/sram/ram[2]} {-height 15 -radix unsigned} {/FIFO_TB/DUV/sram/ram[1]} {-height 15 -radix unsigned} {/FIFO_TB/DUV/sram/ram[0]} {-height 15 -radix unsigned}} /FIFO_TB/DUV/sram/ram
add wave -noupdate /FIFO_TB/DUV/sdp_dc_ram_itf/rd_data_a
add wave -noupdate /FIFO_TB/DUV/sdp_dc_ram_itf/rd_addr_b
add wave -noupdate /FIFO_TB/DUV/fifo_inst/wr_ptr
add wave -noupdate /FIFO_TB/DUV/fifo_inst/rd_ptr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {104 ps} 0}
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
WaveRestoreZoom {0 ps} {264 ps}
