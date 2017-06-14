------------------------------Resize.vhd-----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity Resize is
  port( resize_in    : in  std_logic_vector(20 downto 0);
        resize_out  : out std_logic_vector(24 downto 0)) ;

end Resize;

architecture A of Resize is
  signal ACCU : signed(24 downto 0);
begin
  
  P_ACCU : process (resize_in)
  begin
	if resize_in(20) = '1' then
	  ACCU <= signed("1111" & unsigned(resize_in));
	elsif resize_in(20) = '0' then
          ACCU <= signed("0000" & unsigned(resize_in));
	else 
	  ACCU <= signed("0000" & unsigned(resize_in));
	end if;
  end process P_ACCU;

  -- Accu_out prend la valeur vecteur du signal ACCU
  Resize_out <= std_logic_vector(ACCU);

end A;
