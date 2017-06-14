------------------------------ROM.vhd-------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;
entity ROM_cordic is
  port( clk		: in std_logic;
	reset_n 	: in std_logic;
	enable		: in std_logic;
    X    		: out std_logic_vector(7 downto 0);
	Y			: out std_logic_vector(7 downto 0)) ;
end ROM_cordic;

architecture A of ROM_cordic is
  type   tab_rom is array (0 to 94) of std_logic_vector(7 downto 0);
  --signal count : std_logic_vector(7 downto 0); -- 0 to 180
  signal sig_X : std_logic_vector(7 downto 0);
  signal sig_Y : std_logic_vector(7 downto 0);


  constant rom_X : tab_rom := ( -- 0 to 45°
0=>X"C2",    1=>X"C4",    2=>X"C1",    3=>X"B8",    4=>X"BA",    5=>X"BF",    6=>X"C7",    7=>X"DC",    8=>X"BA",    9=>X"F3",    10=>X"CC",    11=>X"CD",    12=>X"D5",    13=>X"D7",    14=>X"D8",    15=>X"EB",    16=>X"F8",    17=>X"0C",    18=>X"0D",    19=>X"14",    20=>X"15",    21=>X"29",    22=>X"1D",    23=>X"1E",    24=>X"1E",    25=>X"23",    26=>X"24",    27=>X"23",    28=>X"24",    29=>X"24",    30=>X"25",    31=>X"29",    32=>X"25",    33=>X"29",    34=>X"29",    35=>X"29",    36=>X"30",    37=>X"30",    38=>X"33",    39=>X"34",    40=>X"3E",    41=>X"3C",    42=>X"3F",    43=>X"49",    44=>X"49",    45=>X"48",    46=>X"46",    47=>X"41",    48=>X"45",    49=>X"41",    50=>X"41",    51=>X"46",    52=>X"46",    53=>X"34",    54=>X"34",    55=>X"33",    56=>X"2B",    57=>X"29",    58=>X"49",    59=>X"49",    60=>X"28",    61=>X"14",    62=>X"14",    63=>X"15",    64=>X"08",    65=>X"08",    66=>X"08",    67=>X"F4",    68=>X"F4",    69=>X"F3",    70=>X"EC",    71=>X"EC",    72=>X"EB",    73=>X"D7",    74=>X"D7",    75=>X"E3",    76=>X"E2",    77=>X"E2",    78=>X"E1",    79=>X"E2",    80=>X"DD",    81=>X"DD",    82=>X"DC",    83=>X"DD",    84=>X"DD",    85=>X"DC",    86=>X"DB",    87=>X"DB",    88=>X"D7",    89=>X"D8",    90=>X"DB",    91=>X"D7",    92=>X"D0",    93=>X"D0",    94=>X"CD"); 
    
 constant rom_Y : tab_rom := ( -- 0 to 45°
0=>X"F4",    1=>X"F4",    2=>X"EB",    3=>X"DE",    4=>X"E3",    5=>X"E2",    6=>X"E3",    7=>X"EC",    8=>X"DD",    9=>X"F7",    10=>X"DC",    11=>X"DB",    12=>X"D8",    13=>X"D8",    14=>X"D8",    15=>X"D1",    16=>X"CD",    17=>X"C2",    18=>X"C5",    19=>X"C1",    20=>X"C1",    21=>X"BA",    22=>X"BA",    23=>X"B9",    24=>X"C0",    25=>X"BB",    26=>X"BF",    27=>X"BA",    28=>X"C0",    29=>X"CD",    30=>X"CD",    31=>X"D6",    32=>X"B7",    33=>X"D6",    34=>X"D6",    35=>X"D8",    36=>X"EC",    37=>X"EC",    38=>X"F8",    39=>X"F8",    40=>X"0C",    41=>X"0C",    42=>X"15",    43=>X"1E",    44=>X"1E",    45=>X"1E",    46=>X"1D",    47=>X"1E",    48=>X"23",    49=>X"23",    50=>X"23",    51=>X"22",    52=>X"22",    53=>X"24",    54=>X"25",    55=>X"25",    56=>X"28",    57=>X"28",    58=>X"24",    59=>X"24",    60=>X"28",    61=>X"30",    62=>X"30",    63=>X"2F",    64=>X"34",    65=>X"34",    66=>X"34",    67=>X"3E",    68=>X"3E",    69=>X"3B",    70=>X"3E",    71=>X"3F",    72=>X"3F",    73=>X"46",    74=>X"46",    75=>X"46",    76=>X"47",    77=>X"45",    78=>X"47",    79=>X"40",    80=>X"44",    81=>X"44",    82=>X"41",    83=>X"46",    84=>X"46",    85=>X"33",    86=>X"33",    87=>X"49",    88=>X"2A",    89=>X"2A",    90=>X"49",    91=>X"28",    92=>X"15",    93=>X"15",    94=>X"08");

begin
synchro: process (clk,reset_n,enable)
  variable counter: std_logic_vector(7 downto 0);
  begin
  	if enable = '1' then
		if clk'event and clk ='1' then 
			if(reset_n = '0')then
				counter:= "00000000";
			else 
	 			if counter = "01011110" then
	 				counter :="00000000";
	 			else
	 				counter := counter + "00000001";
	 			end if;
	 			
	 			--count=> counter;
	 			X <=  rom_X(conv_integer(counter));
				Y <=  rom_Y(conv_integer(counter));
			end if;
 	 	end if;
 	else
		counter :="00000000";
	end if;
  end process synchro;

--  synchro: process (clk,reset_n,enable)
--  variable counter: std_logic_vector(7 downto 0);
--  begin
--  	if enable = '1' then
--		if clk'event and clk ='1' then 
--			if(reset_n = '0')then
--				counter:= "00000000";
--			else 
--	 			if counter = "10110100" then
--	 				counter :="00000000";
--	 			else
--	 				counter := counter + "00000001";
--	 			end if;
--	 			
--	 			count=> counter;
--	 			X => sig_X;
--				Y => sig_Y;
--			end if;
-- 	 	end if;
-- 	else
--		counter :="00000000";
--	end if;
--  end process synchro;


--compute:process(enable,count)
 --variable counter std_logic_vector(7 downto 0) := "00000000";
--  begin
--     if enable = '1' then
--		if count => "00101100" then   --44
--			sig_X => rom_X(conv_integer(count));
--			sig_Y => rom_Y(conv_integer(count));
--
--		elsif count => "01011001" then --89
--			sig_X => not (rom_X(conv_integer(count - "00101101"))) + "00000001" ;
--			sig_Y => rom_Y(conv_integer(count - "00101101"));
--
--		elsif count => "10000110" then  --134
--			sig_X => not (rom_X(conv_integer(count - "01011010"))) + "00000001" ;
--			sig_Y => not (rom_Y(conv_integer(count - "01011010"))) + "00000001" ;
--
--		else  -- < 179
--			sig_X => rom_X(conv_integer(count - "10000111"));
--			sig_Y => not (rom_Y(conv_integer(count - "10000111"))) + "00000001" ;
--		end if;
--		
--	else
--		sig_X => "00000000";
--		sig_Y => "00000000";
--    
--    end if;
--end process compute;
end A;

