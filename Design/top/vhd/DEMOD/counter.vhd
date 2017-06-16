library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity counter is
		          port(	i_hclk	: in std_logic;
                    i_rstn	: in std_logic;
			              o_count : out std_logic_vector(3 downto 0));

end counter;

architecture a of counter is
  begin
    process(i_hclk)
      variable v_val : std_logic_vector (3 downto 0);
      begin
	      if i_hclk'event and i_hclk = '1' then
          if (i_rstn = '0') then 
	          v_val := "0000";
  	      else
            if (v_val = "1001") then
              v_val := "0000";
            else
              v_val := v_val + "0001";
            end if;
	        end if;
	        o_count <= v_val;  
        end if;
    end process;
end A;
