--https://www.hdlworks.com/hdl_corner/vhdl_ref/VHDLContents/TEXTIOPackage.htm
library IEEE ;
use IEEE.std_logic_1164.ALL ;
--use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use std.textio.all;
library lib_VHD ;
use lib_VHD.CORDIC_top;


entity test_top_file is end test_top_file;

architecture test1 of test_top_file is
--Test fonctionel !!!
	component CORDIC_top is
	generic (Nb: integer);
	port( 	clk  : in std_logic;
		reset_n  : in std_logic;
	  	X  : in  std_logic_vector(7 downto 0);
		Y  : in  std_logic_vector(7 downto 0);
		Z  : out std_logic_vector(7 downto 0));
	end component;


signal sig_clk : std_logic := '0';
signal sig_resetn : std_logic := '0';
signal sig_x_in: std_logic_vector(7 downto 0);
signal sig_y_in:  std_logic_vector(7 downto 0); 
signal sig_z_out:  std_logic_vector(7 downto 0);
signal i: integer := 0;

signal in_x: std_logic_vector(7 downto 0);
signal in_y: std_logic_vector(7 downto 0) ;
--type     tab_x is array (0 to 179) of std_logic_vector(7 downto 0);
--type     tab_y is array (0 to 179) of std_logic_vector(7 downto 0);

--signal period: natural;
begin
	C1: CORDIC_top
       	generic map(Nb=>8)	
	port map(sig_clk,sig_resetn,sig_x_in,sig_y_in,sig_z_out);
	sig_clk <= not(sig_clk) after  10 ns; --50Mhz
	sig_resetn <= '1' after 60 ns;
	process
	begin
		wait for 60 ns;
		while i<179 loop
			sig_x_in <= in_x;  
			sig_y_in <= in_y;
			wait for 20 ns ;		
			i<=i+1;
		end loop;
		wait for 80 ns;
	end process;

	
read_x_file :process 
variable inline: line;
variable character_variable:character;
variable end_of_line: boolean ;
file myfile: text is "/home/floriant/Documents/Prj_conception/Design/bench/x_simu.dat";
		 begin
			 while not endfile(myfile ) loop 
				 readline(myfile,inline);
				 read(inline,character_variable,end_of_line);
									
		while end_of_line loop
			read(inline,character_variable,end_of_line);			
		end loop;
		end loop;
		wait;       -- ne rien faire lorsque c'est fini
		end process read_x_file;
end test1;
