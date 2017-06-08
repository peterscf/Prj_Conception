------------------------------ROM.vhd-------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity ROM is
  port(Rom_Address : in  std_logic_vector(2 downto 0);
        Rom_out    : out std_logic_vector(5 downto 0)) ;
end ROM;

architecture A of ROM is
  type     tab_rom is array (0 to 5) of std_logic_vector(5 downto 0);
  constant filter_rom : tab_rom :=
    (0   => "101101" , 1 => "011010" ,2 => "001110" , 3 => "000111" ,  4 => "000011" , 5 => "000001" 6 => "XXXXXX" 7 => "XXXXXX");
      --	  0d45			  0d26			 0d14 			 0d07			  0d03 			  0d01

begin

  Rom_out <= filter_rom(to_integer(unsigned(Rom_Address)));

end A;

