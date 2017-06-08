-----------------------------PRE_PROCESS.vhd----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity PRE_PROCESS is

	generic(  Nb: integer );
  	
	port( 	clk : in std_logic;
			reset_n : in std_logic;
			Iin  : in std_logic_vector(Nb-1 downto 0);
			Qin  : in std_logic_vector(Nb-1 downto 0);
	  		Iout : out  std_logic_vector(Nb-1 downto 0);
			Qout : out  std_logic_vector(Nb-1 downto 0);
			Z : out std_logic_vector(8 downto 0));
end PRE_PROCESS;

architecture A of PRE_PROCESS is

	signal sig_Iout:signed(Nb-1 downto 0);
	signal sig_Qout:signed(Nb-1 downto 0);
	signal sig_Zout: std_logic_vector(8 downto 0);

begin 

  synchro: process (clk,reset_n)
  begin
	if clk'event and clk ='1' then 
		if(reset_n = '0')then 
  			Z<="000000000";
  			Iout<="00000000";
  			Qout<="00000000";
	else 
 			Z <= sig_Zout;
 			Iout<= std_logic_vector(sig_Iout);
 			Qout<= std_logic_vector(sig_Qout);
		end if;
	end if;

  end process synchro;


  compute: process (Iin,Qin)
  begin 
	if(Iin(Nb-1)='1') then
		sig_Iout <= not(signed(Iin))+1;
		sig_Qout <= not(signed(Qin))+1;			
		if(Qin(Nb-1)='0') then --Qin positif 
			sig_Zout<= "010110100";-- +180°
		else --Qin negatif
			sig_Zout<= "101001100";-- -180°
		end if;
	else 
		sig_Iout <= signed(Iin);
		sig_Qout <= signed(Qin);
		sig_Zout <= "000000000";
	end if;
  end process compute;
	
end A;
