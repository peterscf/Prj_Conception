------------------------------ROM.vhd-------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ROM_cordic is
  port( clk		: in std_logic;
	reset_n 	: in std_logic;
	enable		: in std_logic;
        X    		: out std_logic_vector(7 downto 0),
	Y		: out std_logic_vector(7 downto 0)) ;
end ROM_cordic;

architecture A of ROM_cordic is
  type   tab_rom is array (0 to 44) of std_logic_vector(7 downto 0);
  signal counter : std_logic_vector(0 to 7); -- 0 to 180
  signal sig_X : std_logic_vector(7 downto 0);
  signal sig_Z : std_logic_vector(7 downto 0);


  constant rom_X : tab_rom := ( -- 0 to 45°
0=>X"80",	1=>X"7F",	2=>X"7F",	3=>X"7F",	4=>X"7E",	5=>X"7E",	6=>X"7D",	7=>X"7C",	8=>X"7B",	9=>X"79",	10=>X"78",	11=>X"76",	12=>X"74",	13=>X"73",	14=>X"71",	15=>X"6E",	16=>X"6C",	17=>X"6A",	18=>X"67",	19=>X"64",	20=>X"62",	21=>X"5F",	22=>X"5C",	23=>X"58",	24=>X"55",	25=>X"52",	26=>X"4E",	27=>X"4B",	28=>X"47",	29=>X"43",	30=>X"40",	31=>X"3C",	32=>X"38",	33=>X"34",	34=>X"2F",	35=>X"2B",	36=>X"27",	37=>X"23",	38=>X"1E",	39=>X"1A",	40=>X"16",	41=>X"11",	42=>X"0D",	43=>X"08",	44=>X"04"); 
    
 constant rom_Y : tab_rom := ( -- 0 to 45°
0=>X"00",	1=>X"04",	2=>X"08",	3=>X"0D",	4=>X"11",	5=>X"16",	6=>X"1A",	7=>X"1E",	8=>X"23",	9=>X"27",	10=>X"2B",	11=>X"2F",	12=>X"34",	13=>X"38",	14=>X"3C",	15=>X"3F",	16=>X"43",	17=>X"47",	18=>X"4B",	19=>X"4E",	20=>X"52",	21=>X"55",	22=>X"58",	23=>X"5C",	24=>X"5F",	25=>X"62",	26=>X"64",	27=>X"67",	28=>X"6A",	29=>X"6C",	30=>X"6E",	31=>X"71",	32=>X"73",	33=>X"74",	34=>X"76",	35=>X"78",	36=>X"79",	37=>X"7B",	38=>X"7C",	39=>X"7D",	40=>X"7E",	41=>X"7E",	42=>X"7F",	43=>X"7F",	44=>X"7F");

begin

  synchro: process (clk,reset_n)
  begin
	if clk'event and clk ='1' then 
		if(reset_n = '0')then 

			X <= X"80";
        		Y <= X"00";
		else 
 			X <= sig_X;
			Y <= sig_Y;
		end if;
 	 end if;
  end process synchro;


  compute:process(enable,counter)
  begin
    counter = "00000000"
    if enable = '1' then
	counter = counter + "00000001";

	case counter is

		when "00000000" to "00101100" => -- 0 to 44
			sig_X = rom_X(to_integer(counter));
			sig_Y = rom_Y(to_integer(counter));

		when "00101101" to "01011001" => -- 45 to 89
			sig_X = not (rom_X(to_integer(counter - "00101101"))) + "00000001" ;
			sig_Y = rom_X(to_integer(counter - "00101101"));

		when "01011010" to "10000110" =>  -- 90 to 134
			sig_X = not (rom_X(to_integer(counter - "01011010"))) + "00000001" ;
			sig_Y = not (rom_X(to_integer(counter - "01011010"))) + "00000001" ;

		when "10000111" to "10110011" => -- 135 to 179
			sig_X = rom_X(to_integer(counter - "10000111"));
			sig_Y = not (rom_Y(to_integer(counter - "10000111"))) + "00000001" ;

		when others 
   			sig_X <= "XXXXXXXX";
        		sig_Y <= "XXXXXXXX";
	end case;
    end if;
  end process compute;
end A;

