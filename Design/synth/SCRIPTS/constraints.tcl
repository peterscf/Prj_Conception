set CLK_PERIOD 20.00
#set CLK_SKEW 0.00
#set INPUT_DELAY 0.00
#set OUTPUT_DELAY 0.00

#Précise l'horloge du circuit
create_clock -name HCLK -period 20 -waveform {0.0 10.0} {clk}	
#Indique de ne pas modifier plus tard le net d'horloge
set_dont_touch_network HCLK						
#Génère le skew maximal attendu									
set_clock_uncertainty 1.0 [get_clocks HCLK]						

set_input_delay 13 -max -clock HCLK [remove_from_collection [all_inputs] [get_ports clk]]
set_output_delay 13 -max -clock HCLK [all_outputs]

