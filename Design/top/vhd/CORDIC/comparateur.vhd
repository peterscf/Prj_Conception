library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity comparator is
 port(  i_clk       : in std_logic;
	i_restn     : in std_logic;
        i_phase     : in std_logic_vector  (8 downto 0);
        o_comparator: out std_logic_vector (1 downto 0)	
 ); 
end comparator;


architecture rtl_comparator of comparator is
signal s_o_comparator : std_logic_vector (1 downto 0);
begin 

P_SYNCHRO: process (i_clk,i_restn)
begin 
  if (i_clk'event and i_clk ='1') then 
	if (i_restn ='0') then 
	 o_comparator <= "XX";
        else
         o_comparator <= s_o_comparator;
	end if;
  end if;  
end process P_SYNCHRO;


P_COMPARATOR: process(i_phase)
begin
--  if (i_phase>="000000000" and i_phase <="001011001") 	  then  s_o_comparator<= "11"; -- angle entre 0 et 89 degré
--  elsif (i_phase>="001011010" and i_phase <="010110011") then s_o_comparator<= "01"; -- angle entre 90 et 186 degré
--  elsif (i_phase>="111111111" and i_phase <="110100111") then s_o_comparator<= "10"; -- angle entre -1 et -89 degré
--  elsif  (i_phase>="110100110" and i_phase <="101001100")  then s_o_comparator<= "00"; -- angle entre -90 et -186degré
--  else s_o_comparator<= "XX";
--  end if; 

  if (signed(i_phase) < "110100110") then  s_o_comparator<= "00"; -- angle -90 degré
  elsif (signed(i_phase) < "000000000") then s_o_comparator<= "10"; -- angle 0 degré
  elsif (signed(i_phase) < "001011010") then s_o_comparator<= "11"; -- angle 90
  elsif  (signed (i_phase) < "010110101")  then s_o_comparator<= "01"; -- 180
  else s_o_comparator<= "XX";
  end if; 

 -- when "000000000" to "001011001"  => 
 -- when "001011010" to "010110011"  => s_o_comparator<= "01"; -- angle entre 90 et 179 degré
  --when "111111111" to "110100111"  => s_o_comparator<= "10"; -- angle entre -1 et -89 degré
  --when "110100110" to "101001100"  => s_o_comparator<= "00"; -- angle entre -90 et -180 degré
  --when others => s_o_comparator<= "XX";
end process P_COMPARATOR;


end  rtl_comparator;
