onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_top_num/TOP_NUM1/i_CLK
add wave -noupdate /test_top_num/TOP_NUM1/i_RESET_n
add wave -noupdate /test_top_num/TOP_NUM1/i_data
add wave -noupdate /test_top_num/TOP_NUM1/i_debug_cordic
add wave -noupdate /test_top_num/TOP_NUM1/i_debug_demod
add wave -noupdate -expand -group {DEMOD CORDIC} -format Analog-Step -height 84 -max 8.0 -min -8.0 /test_top_num/TOP_NUM1/i_in_demod_I
add wave -noupdate -expand -group {DEMOD CORDIC} -format Analog-Step -height 84 -max 8.0 -min -8.0 /test_top_num/TOP_NUM1/i_in_demod_Q
add wave -noupdate -expand -group {DEMOD CORDIC} -format Analog-Step -height 84 -max 89.000000000000014 -min -90.0 /test_top_num/TOP_NUM1/demod/Filter_outI
add wave -noupdate -expand -group {DEMOD CORDIC} -format Analog-Step -height 84 -max 89.000000000000014 -min -90.0 /test_top_num/TOP_NUM1/demod/Filter_outQ
add wave -noupdate -expand -group {DEMOD CORDIC} -format Analog-Step -height 84 -max 180.00000000000003 -min -178.0 -radix decimal -childformat {{/test_top_num/TOP_NUM1/cordic/Z(8) -radix decimal} {/test_top_num/TOP_NUM1/cordic/Z(7) -radix decimal} {/test_top_num/TOP_NUM1/cordic/Z(6) -radix decimal} {/test_top_num/TOP_NUM1/cordic/Z(5) -radix decimal} {/test_top_num/TOP_NUM1/cordic/Z(4) -radix decimal} {/test_top_num/TOP_NUM1/cordic/Z(3) -radix decimal} {/test_top_num/TOP_NUM1/cordic/Z(2) -radix decimal} {/test_top_num/TOP_NUM1/cordic/Z(1) -radix decimal} {/test_top_num/TOP_NUM1/cordic/Z(0) -radix decimal}} -subitemconfig {/test_top_num/TOP_NUM1/cordic/Z(8) {-radix decimal} /test_top_num/TOP_NUM1/cordic/Z(7) {-radix decimal} /test_top_num/TOP_NUM1/cordic/Z(6) {-radix decimal} /test_top_num/TOP_NUM1/cordic/Z(5) {-radix decimal} /test_top_num/TOP_NUM1/cordic/Z(4) {-radix decimal} /test_top_num/TOP_NUM1/cordic/Z(3) {-radix decimal} /test_top_num/TOP_NUM1/cordic/Z(2) {-radix decimal} /test_top_num/TOP_NUM1/cordic/Z(1) {-radix decimal} /test_top_num/TOP_NUM1/cordic/Z(0) {-radix decimal}} /test_top_num/TOP_NUM1/cordic/Z
add wave -noupdate -expand -group {DEMOD CORDIC} -format Analog-Step -height 84 -max 0.99999999999999989 -min -2.0 /test_top_num/TOP_NUM1/o_output_comparator
add wave -noupdate -group MOD /test_top_num/TOP_NUM1/i_CLK
add wave -noupdate -group MOD /test_top_num/TOP_NUM1/i_RESET_n
add wave -noupdate -group MOD /test_top_num/TOP_NUM1/i_data
add wave -noupdate -group MOD /test_top_num/TOP_NUM1/modu/s_in_data
add wave -noupdate -group MOD -format Analog-Step -height 84 -max 15.0 -min -15.0 /test_top_num/TOP_NUM1/modu/o_i
add wave -noupdate -group MOD -format Analog-Step -height 84 -max 15.0 -min -15.0 /test_top_num/TOP_NUM1/modu/o_q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {154013765 ps} 0} {{Cursor 2} {0 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 195
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {3329408 ps}
