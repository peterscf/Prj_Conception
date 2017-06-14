--https://www.hdlworks.com/hdl_corner/vhdl_ref/VHDLContents/TEXTIOPackage.htm
library IEEE ;
use IEEE.std_logic_1164.ALL ;
--use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
--use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_textio.all;
use std.textio.all;
library lib_VHD ;
--library lib_SYNTH;
--use lib_SYNTH.CORDIC_top;

use lib_VHD.CORDIC_top;


entity test_top_file is end test_top_file;

architecture test1 of test_top_file is
--Test fonctionel !!!
	component CORDIC_top is
--	generic (Nb: integer);
	port( 	clk  : in std_logic;
		reset_n  : in std_logic;
	  	X  : in  std_logic_vector(7 downto 0);
		Y  : in  std_logic_vector(7 downto 0);
		Z  : out std_logic_vector(8 downto 0));
	end component;

function string_hex_to_std_logic_vector( str_hex: character )return std_logic_vector is 
 	variable val : std_logic_vector(3 downto 0);
 begin

        case str_hex is
            when '0' =>val:="0000";
            when '1' =>val:="0001";
	    when '2' =>val:="0010"; 
	    when '3' =>val:="0011"; 
	    when '4' =>val:="0100"; 
            when '5' =>val:="0101";
            when '6' =>val:="0110";
	    when '7' =>val:="0111"; 
            when '8' =>val:="1000";
            when '9' =>val:="1001";
	    when 'A' =>val:="1010"; 
            when 'B' =>val:="1011";
            when 'C' =>val:="1100";
	    when 'D' =>val:="1101"; 
            when 'E' =>val:="1110";
            when 'F' =>val:="1111";
	    when others =>val:="XXXX";
    end case;
    return val;
end string_hex_to_std_logic_vector ;

function string_to_slv(str :string (2 downto 1)) return std_logic_vector is 
 variable val_std : std_logic_vector(7 downto 0);
 begin
 	val_std(7 downto 4):= string_hex_to_std_logic_vector(str(2));
	val_std(3 downto 0):= string_hex_to_std_logic_vector(str(1));

	return val_std;
end string_to_slv;
 
 

signal sig_clk : std_logic := '0';
signal sig_resetn : std_logic := '0';
signal sig_x_in: std_logic_vector(7 downto 0);
signal sig_y_in:  std_logic_vector(7 downto 0); 
signal sig_z_out:  std_logic_vector(8 downto 0);

begin
	C1: CORDIC_top
       	generic map(Nb=>8)	
	port map(sig_clk,sig_resetn,sig_x_in,sig_y_in,sig_z_out);
	sig_clk <= not(sig_clk) after  10 ns; --50Mhz
	sig_resetn <= '1' after 15 ns;


---- Calcul et Ecriture+Lecture des echantillons et sinus
 LECTURE_X: process
	 variable L: line;
	 file ENTREES : text open read_mode is "./bench/x_simu.dat";
     	variable LIGNE: LINE;	 -- variables à lire
	variable val_hex: string (2 downto 1);
	variable i: integer :=0;

  begin
  --if sig_resetn ='1'then
     while(not(endfile(ENTREES))) loop
     	readline(ENTREES,LIGNE);
	read(LIGNE,val_hex);
--appel fonction convertion hex vers std_logic_vector
	
		wait until sig_clk'event and sig_clk = '1';
			sig_x_in<=string_to_slv(val_hex);
		report "  >>>>>>>>>>> y it=" & integer'image(i);
		i:=i+1;
		end loop; --while
		wait;
	--end if;
  end process LECTURE_X;

 LECTURE_Y: process
	 variable L: line;
	 file ENTREES : text open read_mode is "./bench/y_simu.dat";
     	variable LIGNE: LINE;	 -- variables à lire
	variable val_hex: string (2 downto 1);
	variable i: integer :=0;
  begin
  	--if sig_resetn = '1'then
     while(not(endfile(ENTREES))) loop
     	readline(ENTREES,LIGNE);
	read(LIGNE,val_hex);
--appel fonction convertion hex vers std_logic_vector

		wait until sig_clk'event and sig_clk = '1';
			sig_y_in<=string_to_slv(val_hex);
		report "  >>>>>>>>>>> y it=" & integer'image(i);
		i:=i+1;
		end loop; --while
		wait for 200 ns;
		assert false report " FIN DE LA SIMULATION" severity failure;
	--end if;

  end process LECTURE_Y;

      -- 
 ECRITURE_out: process
       variable L: line;
      variable C : integer;
      file SORTIES: text open WRITE_MODE is "./bench/sorties_cordic.dat";
 begin
	 --wait for 60 ns;
       wait until sig_clk'event and sig_clk = '1';
       		C:=conv_integer(signed(sig_z_out));
		   write(L,C);	-- écriture de Z dans la ligne
		   writeline(SORTIES, L); -- écriture de la ligne dans le fichier
       
 end process ECRITURE_out;

end test1;
