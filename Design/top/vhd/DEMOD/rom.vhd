library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity rom is port (	i_rom_address	: in  std_logic_vector(2 downto 0);
        							o_rom_out    	: out std_logic_vector(3 downto 0));
end rom;

architecture a of rom is
  type tab_rom is array (0 to 4) of std_logic_vector(3 downto 0);
  constant filter_rom : tab_rom := (	0 => "0001",
																			1 => "0111", 
																			2 => "1011", 
																			3 => "1101",
      																4 => "1111");
begin
	o_rom_out <= filter_rom(to_integer(unsigned(i_rom_address)));
end A;

