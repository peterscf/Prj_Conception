library IEEE ;
use IEEE.std_logic_1164.ALL ;
use ieee.numeric_std.all;
library lib_COMP ;
use lib_COMP.Cell;


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
signal sig_x_in: in std_logic_vector(7 downto 0);
signal sig_y_in: in std_logic_vector(7 downto 0);
signal sig_z_in: in std_logic_vector(7 downto 0);
signal sig_tan_i: in std_logic_vector(5 downto 0);
signal sig_shift: in std_logic_vector(2 downto 0);
signal sig_x_out: out std_logic_vector(7 downto 0);         
signal sig_y_out: out std_logic_vector(7 downto 0);
signal sig_z_out: out std_logic_vector(7 downto 0));
begin
	C1: Cell port map(sig_clk,sig_resetn,sig_x_in,sig_y_in,sig_z_in,sig_tan_i,sig_shift,sig_x_out,sig_y_out,sig_z_out);
	-- C2: Cell port map(sig_clk,sig_resetn,sig_x_in,sig_y_in,sig_z_in,sig_tan_i,sig_shift,sig_x_out,sig_y_out,sig_z_out);
	-- C3: Cell port map(sig_clk,sig_resetn,sig_x_in,sig_y_in,sig_z_in,sig_tan_i,sig_shift,sig_x_out,sig_y_out,sig_z_out);
	-- C4: Cell port map(sig_clk,sig_resetn,sig_x_in,sig_y_in,sig_z_in,sig_tan_i,sig_shift,sig_x_out,sig_y_out,sig_z_out);
	-- C5: Cell port map(sig_clk,sig_resetn,sig_x_in,sig_y_in,sig_z_in,sig_tan_i,sig_shift,sig_x_out,sig_y_out,sig_z_out);
	-- C6: Cell port map(sig_clk,sig_resetn,sig_x_in,sig_y_in,sig_z_in,sig_tan_i,sig_shift,sig_x_out,sig_y_out,sig_z_out);
	-- C7: Cell port map(sig_clk,sig_resetn,sig_x_in,sig_y_in,sig_z_in,sig_tan_i,sig_shift,sig_x_out,sig_y_out,sig_z_out);

	sig_clk <= not(sig_clk) after  20 ns; --50Mhz
	sig_resetn <= '1' after 2 us; 
      process 
    begin
        
	end process;
	
 LECTURE: process
	 variable L: line;
	 file ENTREES : text open write_mode is "echantillon_sinus.dat";
     variable A: std_logic_vector(7 downto 0);	 -- variables à lire
     variable Fe: real := 1.2*1000000.0; --1.2M
     variable fsin : real := 300000.0; --300K
     variable Te : real := 1.0/Fe;
     variable t : real := -0.01;
     variable periode : integer := 126;
 
  begin
     while(true) loop
     for i in 1 to periode loop
	     wait until ADC_rdb = '0' and ADC_csb='0';
         A := conv_std_logic_vector( integer(50.0*SIN(2.0*MATH_PI*fsin*t)),8 ); -- calcul su sinus
         
         write(L, A);	-- ecriture des valeur dans le fichier
	     writeline(ENTREES, L);	 
	     
		 Filter_in <= A;	-- utilisation pour la simulation
	     t := t+Te;
	     report ">>>>>>>>>>>>>>>>>>>>>>>>> <<<<<<<<<<<<<<<<<" & integer'image(i);
		 if i = periode then
			 fsin := fsin - 1000.0;
	         fsin := fsin*0.5;
	         periode:=periode*2;
	         report "  >>>>>>>>>>>" & real'image(fsin) &" "& real'image(t);
	     end if;
     end loop; --for
    end loop; --while
  end process LECTURE;
  
end test1;
