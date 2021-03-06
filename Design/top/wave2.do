onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_top_num/TOP_NUM1/i_CLK
add wave -noupdate /test_top_num/TOP_NUM1/i_RESET_n
add wave -noupdate /test_top_num/TOP_NUM1/i_data
add wave -noupdate /test_top_num/TOP_NUM1/i_debug_cordic
add wave -noupdate /test_top_num/TOP_NUM1/i_debug_demod
add wave -noupdate -color red -format Analog-Step -height 226 -max 63.000000000000064 -min -64.0 /test_top_num/TOP_NUM1/demod/Filter_outQ
add wave -noupdate -color green -format Analog-Step -height 225 -max -15.54054054054054 -min -45.405405405405403 /test_top_num/TOP_NUM1/modu/o_q
add wave -noupdate -color {royal blue} -format Analog-Step -height 211 -max 63.000000000000036 -min -64.0 /test_top_num/TOP_NUM1/demod/Filter_outI
add wave -noupdate -color yellow -format Analog-Step -height 212 -max -16.500000000000004 -min -46.5 /test_top_num/TOP_NUM1/modu/o_i
add wave -noupdate -group {DEMOD CORDIC} -format Analog-Step -height 84 -max 8.0 -min -8.0 /test_top_num/TOP_NUM1/i_in_demod_I
add wave -noupdate -group {DEMOD CORDIC} -format Analog-Step -height 84 -max 8.0 -min -8.0 /test_top_num/TOP_NUM1/i_in_demod_Q
add wave -noupdate -group {DEMOD CORDIC} -format Analog-Step -height 84 -max 63.0 -min -64.0 /test_top_num/TOP_NUM1/demod/Filter_outI
add wave -noupdate -group {DEMOD CORDIC} -format Analog-Step -height 84 -max 63.0 -min -64.0 /test_top_num/TOP_NUM1/demod/Filter_outQ
add wave -noupdate -group {DEMOD CORDIC} -format Analog-Step -height 84 -max 180.00000000000003 -min -178.0 -radix decimal /test_top_num/TOP_NUM1/cordic/Z
add wave -noupdate -group {DEMOD CORDIC} -childformat {{/test_top_num/TOP_NUM1/o_output(8) -radix decimal} {/test_top_num/TOP_NUM1/o_output(7) -radix decimal} {/test_top_num/TOP_NUM1/o_output(6) -radix decimal} {/test_top_num/TOP_NUM1/o_output(5) -radix decimal} {/test_top_num/TOP_NUM1/o_output(4) -radix decimal} {/test_top_num/TOP_NUM1/o_output(3) -radix decimal} {/test_top_num/TOP_NUM1/o_output(2) -radix decimal} {/test_top_num/TOP_NUM1/o_output(1) -radix decimal} {/test_top_num/TOP_NUM1/o_output(0) -radix decimal}} -subitemconfig {/test_top_num/TOP_NUM1/o_output(8) {-height 16 -radix decimal} /test_top_num/TOP_NUM1/o_output(7) {-height 16 -radix decimal} /test_top_num/TOP_NUM1/o_output(6) {-height 16 -radix decimal} /test_top_num/TOP_NUM1/o_output(5) {-height 16 -radix decimal} /test_top_num/TOP_NUM1/o_output(4) {-height 16 -radix decimal} /test_top_num/TOP_NUM1/o_output(3) {-height 16 -radix decimal} /test_top_num/TOP_NUM1/o_output(2) {-height 16 -radix decimal} /test_top_num/TOP_NUM1/o_output(1) {-height 16 -radix decimal} /test_top_num/TOP_NUM1/o_output(0) {-height 16 -radix decimal}} /test_top_num/TOP_NUM1/o_output
add wave -noupdate -group MOD /test_top_num/TOP_NUM1/i_CLK
add wave -noupdate -group MOD /test_top_num/TOP_NUM1/i_RESET_n
add wave -noupdate -group MOD /test_top_num/TOP_NUM1/i_data
add wave -noupdate -group MOD /test_top_num/TOP_NUM1/modu/s_in_data
add wave -noupdate -group MOD -format Analog-Step -height 84 -max 15.0 -min -15.0 /test_top_num/TOP_NUM1/modu/o_i
add wave -noupdate -group MOD -format Analog-Step -height 84 -max 15.0 -min -15.0 /test_top_num/TOP_NUM1/modu/o_q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {242370 ns} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {238353 ns} {263676 ns}
