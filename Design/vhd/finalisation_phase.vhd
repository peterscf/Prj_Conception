library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;



Entity finalisation_phase is
generic (N_bit	 : integer -- Correspond au nombre de bit sur lequel sont codés les signaux entrées/sortis
	);


port (	I         : in  std_logic_vector (N_bit-1 downto 0);
	Q         : in  std_logic_vector (N_bit-1 downto 0);
	c1        : in  std_logic ;
	c2        : in  std_logic ;
	Phase_in  : in  std_logic_vector (8 downto 0);
	I_out     : out std_logic_vector (N_bit-1 downto 0);
	Q_out     : out std_logic_vector (N_bit-1 downto 0);
	Phase_out : out  std_logic_vector (8 downto 0)
     );

end  finalisation_phase;



Architecture arch_finalisation_phase of finalisation_phase is 

signal Phase_in_signed  : signed (8 downto 0);
signal Phase_out_signed : signed (8 downto 0);

begin

Phase_in_signed <= signed (Phase_in);


process_interne : process (c1, c2, Phase_in_signed)

	begin

	if c1 = '1' then
		Phase_out_signed <= Phase_in_signed + "010110100"; -- on additionne 180 °

	elsif c2 = '1' then
		Phase_out_signed <= Phase_in_signed + "101001100"; -- on soustrait 180 °
	else 
		Phase_out_signed <= Phase_in_signed;

	end if ;


	
end process process_interne;


I_out <= I;
Q_out <= Q;
Phase_out <= std_logic_vector (Phase_out_signed);

end arch_finalisation_phase ;














