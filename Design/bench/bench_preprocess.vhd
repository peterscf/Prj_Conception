library IEEE ;
use IEEE.std_logic_1164.ALL ;
--use ieee.std_logic_signed.all;
use std.textio.all;
library lib_VHD ;
use lib_VHD.PRE_PROCESS;


entity test_Preprocess is end test_Preprocess;

architecture test1 of test_Preprocess is
--Test fonctionel !!!
	component PRE_PROCESS 
		generic(  Nb: integer );
		
		 port(	clk : in std_logic;
				reset_n : in std_logic;
				Iin  : in std_logic_vector(Nb-1 downto 0);
				Qin  : in std_logic_vector(Nb-1 downto 0);
	  			Iout : out  std_logic_vector(Nb-1 downto 0);
				Qout : out  std_logic_vector(Nb-1 downto 0);
				Z : out std_logic_vector(8 downto 0));
	end component;

signal sig_clk : std_logic := '0';
signal sig_resetn : std_logic := '0';
signal sig_Iin: std_logic_vector(7 downto 0);
signal sig_Qin:  std_logic_vector(7 downto 0);
signal sig_Iout:  std_logic_vector(7 downto 0);
signal sig_Qout:  std_logic_vector(7 downto 0);         
signal sig_Z:  std_logic_vector(7 downto 0);

--signal period: natural;
begin
	PP1: PRE_PROCESS 
		generic map (8)
		port map(sig_clk,sig_resetn,sig_Iin,sig_Qin,sig_Iout,sig_Qout,sig_Z);
		
		sig_clk <= not(sig_clk) after  10 ns; --50Mhz
		sig_resetn <= '1' after 60 ns; 
		
	process 
   	begin

		wait for 20 ns;
		sig_x_in <=  in_x(i);  -- deg
		sig_y_in <= in_y(i);  -- deg
		
	i<=i+1;

	end process;
  
end test1;
