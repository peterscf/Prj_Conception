--https://www.hdlworks.com/hdl_corner/vhdl_ref/VHDLContents/TEXTIOPackage.htm
library IEEE ;
use IEEE.std_logic_1164.ALL ;
use ieee.numeric_std.all;
use std.textio.all;
library lib_VHD ;
use lib_VHD.CELL;


entity test_Cell is end test_cell;

architecture test1 of test_Cell is
--Test fonctionel !!!
	component Cell 
	 port(   clk: in std_logic;
            reset_n : in std_logic;
            x_in: in std_logic_vector(7 downto 0);
            y_in: in std_logic_vector(7 downto 0);
            z_in: in std_logic_vector(7 downto 0);
            tan_i: in std_logic_vector(5 downto 0);
            shift: in std_logic_vector(2 downto 0);
            x_out: out std_logic_vector(7 downto 0);         
            y_out: out std_logic_vector(7 downto 0);
            z_out: out std_logic_vector(7 downto 0));
	end component;

signal sig_clk : std_logic := '0';
signal sig_resetn : std_logic := '0';
signal sig_x_in: std_logic_vector(7 downto 0);
signal sig_y_in:  std_logic_vector(7 downto 0);
signal sig_z_in:  std_logic_vector(7 downto 0);
signal sig_tan_i:  std_logic_vector(5 downto 0);
signal sig_shift:  std_logic_vector(2 downto 0);
signal sig_x_out:  std_logic_vector(7 downto 0);         
signal sig_y_out:  std_logic_vector(7 downto 0);
signal sig_z_out:  std_logic_vector(7 downto 0);
signal period: natural;
begin
	C1: Cell port map(sig_clk,sig_resetn,sig_x_in,sig_y_in,sig_z_in,sig_tan_i,sig_shift,sig_x_out,sig_y_out,sig_z_out);
	--C2: Cell port map(sig_clk,sig_resetn,sig_x_in,sig_y_in,sig_z_in,sig_tan_i,sig_shift,sig_x_out,sig_y_out,sig_z_out);
	periode <= 20 ns;
	sig_clk <= not(sig_clk) after  20 ns; --50Mhz
	sig_resetn <= '1' after 2 us; 
	process 
   	begin
		sig_x_in <= "01000000";
		sig_y_in <= "01101110";
		sig_z_in <= "00000000";-- 0
		sig_tan_i <= "101101"; --45
		sig_shift <= "000";
--		wait 40 ;
--		sig_x_in <= sig_x_out;
--		sig_y_in <= sig_y_out;
--		sig_z_in <= sig_z_out;
--		sig_tan_i <= "011010"; --26
--		sig_shift <= "001"; --1
        	wait periode;
--		sig_x_in <= sig_x_out;
--		sig_y_in <= sig_y_out;
--		sig_z_in <= sig_z_out;
--		sig_tan_i <= "001110"; --14
--		sig_shift <= "010"; --2
--		wait 40 ns;
--		sig_x_in <= sig_x_out;
--		sig_y_in <= sig_y_out;
--		sig_z_in <= sig_z_out;
--		sig_tan_i <= "000111"; --7
--		sig_shift <= "011"; --3
--		wait 40 ns;
--		sig_x_in <= sig_x_out;
--		sig_y_in <= sig_y_out;
--		sig_z_in <= sig_z_out;
--		sig_tan_i <= "000011"; --3
--		sig_shift <= "100"; --4
--		wait 40 ns;
--		sig_x_in <= sig_x_out;
--		sig_y_in <= sig_y_out;
--		sig_z_in <= sig_z_out;
--		sig_tan_i <= "000001"; --1
--		sig_shift <= "101"; --5




	end process;
	
-- LECTURE: process
--	 variable L: line;
--	file ENTREES : text open write_mode is "echantillon_sinus.dat";
-- 
--  begin
--     while(true) loop
--	--lecture des simuli a envoyer sur x et y du DUT
--     end loop; --while
--  end process LECTURE;
  
end test1;
