

library IEEE ;
use IEEE.std_logic_1164.ALL ;
--use ieee.std_logic_signed.all;
use std.textio.all;
library lib_VHD ;
use lib_VHD.ROM_cordic;


entity test_rom_cordic is end test_rom_cordic;

architecture test1 of test_rom_cordic is
--Test fonctionel !!!
  component ROM_cordic  
	port( clk		: in std_logic;
		  reset_n 	: in std_logic;
		  enable	: in std_logic;
    	  X    		: out std_logic_vector(7 downto 0);
		  Y			: out std_logic_vector(7 downto 0)) ;
  end component;
--Test fonctionel !!!
	component CORDIC_top is
	port( 	clk  : in std_logic;
		reset_n  : in std_logic;
	  	X  : in  std_logic_vector(7 downto 0);
		Y  : in  std_logic_vector(7 downto 0);
		Z  : out std_logic_vector(8 downto 0));
	end component;
	
signal sig_clk : std_logic := '0';
signal sig_resetn : std_logic := '0';
signal sig_enable:  std_logic := '0';
signal sig_X:  std_logic_vector(7 downto 0);
signal sig_Y:  std_logic_vector(7 downto 0);
signal sig_out_z: std_logic_vector (8 downto 0);

--signal period: natural;
begin
	ROM_1: ROM_cordic 
		port map(sig_clk,sig_resetn,sig_enable,sig_X,sig_Y);
		
	CORDIC_1: CORDIC_top
	port map (sig_clk,sig_resetn,sig_X,sig_Y,sig_out_z);
		
		sig_clk <= not(sig_clk) after  10 ns; --50Mhz
		sig_resetn <= '1' after 60 ns; 
		
	process 
   	begin
   	
		wait for 20 ns;
		sig_enable <=  '1';
		wait for 2000 ns;
		
	end process;
  
end test1;


