--https://www.hdlworks.com/hdl_corner/vhdl_ref/VHDLContents/TEXTIOPackage.htm
library IEEE ;
use IEEE.std_logic_1164.ALL ;
--use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
--use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_textio.all;
use std.textio.all;

library lib_VHD ;--include design top



entity test_top_num is end test_top_num;

entity top_num is
  port( i_CLK		: in  std_logic;                      
	i_RESET_n    	: in  std_logic;                     
	i_data          : in  std_logic;
	o_out_modu_I    : out std_logic_vector(4 downto 0);
	o_out_modu_Q    : out std_logic_vector(4 downto 0);
	o_out_demod_I  	: out std_logic_vector(7 downto 0);
	o_out_demod_Q  	: out std_logic_vector(7 downto 0);   
	o_phi  		: out std_logic_vector(8 downto 0)
      );
end top_num;

function string_bin_to_std_logic( str_bin: character )return std_logic is 
 	variable val : std_logic;
 begin

        case str_hex is
            when '0' =>val:='0';
            when '1' =>val:='1';
	    when others =>val:='X';
    end case;
    return val;
end string_bin_to_std_logic ;


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
 
 

signal 	sig_clk 		:std_logic := '0';
signal 	sig_resetn 		:std_logic := '0';                 
signal	sig_i_data          	:std_logic;
signal	sig_o_out_modu_I   	:std_logic_vector(4 downto 0);
signal	sig_o_out_modu_Q   	:std_logic_vector(4 downto 0);
signal	sig_o_out_demod_I  	:std_logic_vector(7 downto 0);
signal	sig_o_out_demod_Q  	:std_logic_vector(7 downto 0);   
signal	sig_o_phi		:std_logic_vector(8 downto 0)

begin
	NUM1: op_num port map(sig_clk,sig_resetn,sig_i_data,sig_o_out_modu_I,sig_o_out_modu_Q,sig_o_out_demod_I,sig_o_out_demod_Q,sig_o_phi);

	sig_clk <= not(sig_clk) after  10 ns; --50Mhz
	sig_resetn <= '1' after 5 ns;


---- Calcul et Ecriture+Lecture des echantillons et sinus
 LECTURE_data: process
	 variable L: line;
	 file ENTREES : text open read_mode is "./top/bit_stream.dat";
     	variable LIGNE: LINE;	 -- variables à lire
	variable val_bin: string;
	variable i: integer :=0;

  begin
     while(not(endfile(ENTREES))) loop
     	readline(ENTREES,LIGNE);
	read(LIGNE,val_bin);
--appel fonction convertion hex vers std_logic_vector
	if(reset ='1')then
		wait until sig_clk'event and sig_clk = '1';
			sig_i_data<=string_to_slv(val_bin);
		report "  >>>>>>>>>>> stream bit nb=" & integer'image(i);
		i:=i+1;
		end loop; --while
		wait;
	end if;
  end process LECTURE_data;


      -- 
 ECRITURE_out_cordic: process
       variable L: line;
      variable C : integer;
      file SORTIES: text open WRITE_MODE is "./top/sorties_cordic.dat";
 begin
	 --wait for 60 ns;
       wait until sig_clk'event and sig_clk = '1';
       		C:=conv_integer(signed(sig_o_phi)); -- ecriture des angles en integer
		   write(L,C);	-- écriture de Z dans la ligne
		   writeline(SORTIES, L); -- écriture de la ligne dans le fichier
       
 end process ECRITURE_out_cordic;

 ECRITURE_out_I_DEMOD: process
       variable L: line;
      variable C : integer;
      file SORTIES: text open WRITE_MODE is "./top/sorties_I_DEMOD.dat";
 begin
	 --wait for 60 ns;
       wait until sig_clk'event and sig_clk = '1';
       		C:=conv_integer(signed(sig_o_out_demod_I)); -- conversion sortie /!\ A determiner
		   write(L,C);	-- écriture de Z dans la ligne
		   writeline(SORTIES, L); -- écriture de la ligne dans le fichier
       
 end process ECRITURE_out_I_DEMOD;

 ECRITURE_out_Q_DEMOD: process
       variable L: line;
      variable C : integer;
      file SORTIES: text open WRITE_MODE is "./top/sorties_Q_DEMOD.dat";
 begin
	 --wait for 60 ns;
       wait until sig_clk'event and sig_clk = '1';
       		C:=conv_integer(signed(sig_o_out_demod_Q));-- conversion sortie /!\ A determiner
		   write(L,C);	-- écriture de Z dans la ligne
		   writeline(SORTIES, L); -- écriture de la ligne dans le fichier
       
 end process  ECRITURE_out_Q_DEMOD;

 ECRITURE_out_I_MOD: process
       variable L: line;
      variable C : integer;
      file SORTIES: text open WRITE_MODE is "./top/sorties_I_MOD.dat";
 begin
	 --wait for 60 ns;
       wait until sig_clk'event and sig_clk = '1';
       		C:=conv_integer(signed(sig_o_out_modu_I));-- conversion sortie /!\ A determiner
		   write(L,C);	-- écriture de Z dans la ligne
		   writeline(SORTIES, L); -- écriture de la ligne dans le fichier
       
 end process ECRITURE_out_I_MOD;

 ECRITURE_out_Q_MOD: process
       variable L: line;
      variable C : integer;
      file SORTIES: text open WRITE_MODE is "./top/sorties_Q_MOD.dat";
 begin
	 --wait for 60 ns;
       wait until sig_clk'event and sig_clk = '1';
       		C:=conv_integer(signed(sig_o_out_modu_Q));-- conversion sortie /!\ A determiner
		   write(L,C);	-- écriture de Z dans la ligne
		   writeline(SORTIES, L); -- écriture de la ligne dans le fichier
       
 end process  ECRITURE_out_Q_MOD;

end test1;
