onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_lab3/sim_HEX5
add wave -noupdate /tb_lab3/sim_HEX4
add wave -noupdate /tb_lab3/sim_HEX3
add wave -noupdate /tb_lab3/sim_HEX2
add wave -noupdate /tb_lab3/sim_HEX1
add wave -noupdate /tb_lab3/sim_HEX0
add wave -noupdate /tb_lab3/sim_clk
add wave -noupdate /tb_lab3/sim_rst_n
add wave -noupdate /tb_lab3/sim_SW
add wave -noupdate /tb_lab3/DUT/clk
add wave -noupdate /tb_lab3/DUT/rst_n
add wave -noupdate /tb_lab3/DUT/state
add wave -noupdate /tb_lab3/DUT/SW
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1097 ps} 0}
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
WaveRestoreZoom {810 ps} {1810 ps}
