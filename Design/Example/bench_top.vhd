library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;



library modelsim_lib;
use modelsim_lib.util.all;

library lib_VHDL_synth;

entity bench3 is --entité vide
end entity;  

architecture arch of bench3 is

  component top
	 generic (
			N_bit	 : integer := 5 );
	 port (
		I_n        : in  std_logic_vector (N_bit-1 downto 0);
		Q_n        : in  std_logic_vector (N_bit-1 downto 0);
		Clk	   : in std_logic;
		Rst	   : in std_logic;
		I_out_n    : out std_logic_vector (N_bit-1 downto 0);
		Q_out_n    : out std_logic_vector (N_bit-1 downto 0);
		Phase_out_n: out std_logic_vector (8 downto 0)
	     );
  end component;



	signal I_n	  : std_logic_vector (4 downto 0);
	signal Q_n        : std_logic_vector (4 downto 0);
	signal Phase_in_n : std_logic_vector (8 downto 0);
	signal clk	  : std_logic:= '0';
	signal rst	  : std_logic;
	signal I_out_n    : std_logic_vector (4 downto 0);
	signal Q_out_n    : std_logic_vector (4 downto 0);
	signal Phase_out_n: std_logic_vector (8 downto 0);

Begin

DUT: top
	generic map (
		N_bit => 5
	)
        port map (
		I_n => I_n,
		Q_n => Q_n,
		Clk => clk,
		Rst => rst,
		I_out_n => I_out_n,
		Q_out_n => Q_out_n,
		Phase_out_n => Phase_out_n	
        ) ;

----------------------------------------------------------------------------------------
rst   <= '1', '0' after 35 ns;
clk   <= not(clk) after 10 ns;
----------------------------------------------------------------------------------------

process_etages2 : process 

	begin
	-- TEST avec un angle de 71°
    	I_n   <= "00101"; --cos(71°)=0.33
    	Q_n   <= "01111"; --sin(71°)=0.94

	wait for 105 ns; --Valeur différente par rapport au bench

	assert (I_out_n = "00101")  report "Erreur : sortie I pour un angle de 71 degres INCORRECT" severity error;
	assert (Q_out_n = "01111")  report "Erreur : sortie Q pour un angle de 71 degres INCORRECT" severity error;
	assert (Phase_out_n = "000000000")  report "Erreur : phase de sortie pour un angle de 0 degres INCORRECT" severity error;

	-- TEST avec un angle de 30°
    	I_n   <= "01101"; --cos(30°)=0.866
    	Q_n   <= "01000"; --sin(30°)=0.500

	wait for 70 ns;

	assert (I_out_n = "00101")  report "Erreur : sortie I pour un angle de 30 degres INCORRECT" severity error;
	assert (Q_out_n = "01111")  report "Erreur : sortie Q pour un angle de 30 degres INCORRECT" severity error;
	assert (Phase_out_n = "000000000")  report "Erreur : phase de sortie pour un angle de 0 degres INCORRECT" severity error;

	-- TEST avec un angle de -25°
    	I_n   <= "01110"; --cos(-25°)= 0.906
    	Q_n   <= "11001"; --sin(-25°)= -0.422

	wait for 70 ns;

	assert (I_out_n = "01110")  report "Erreur : sortie I pour un angle de -25 degres INCORRECT" severity error;
	assert (Q_out_n = "11001")  report "Erreur : sortie Q pour un angle de -25 degres INCORRECT" severity error;
	assert (Phase_out_n = "000000000")  report "Erreur : phase de sortie pour un angle de 0 degres INCORRECT" severity error;


	-- TEST avec un angle de -90°
    	I_n   <= "00000"; --cos(-90°)= 0
    	Q_n   <= "10000"; --sin(-90°)= -1

	wait for 70 ns;

	assert (I_out_n = "01110")  report "Erreur : sortie I pour un angle de -25 degres INCORRECT" severity error;
	assert (Q_out_n = "11001")  report "Erreur : sortie Q pour un angle de -25 degres INCORRECT" severity error;
	assert (Phase_out_n = "000000000")  report "Erreur : phase de sortie pour un angle de 0 degres INCORRECT" severity error;

	-- TEST avec un angle de 88°
    	I_n   <= "00001"; --cos(88°)= 0.035
    	Q_n   <= "01111"; --sin(88°)= 0.999

	wait for 70 ns;

	assert (I_out_n = "01110")  report "Erreur : sortie I pour un angle de -25 degres INCORRECT" severity error;
	assert (Q_out_n = "11001")  report "Erreur : sortie Q pour un angle de -25 degres INCORRECT" severity error;
	assert (Phase_out_n = "000000000")  report "Erreur : phase de sortie pour un angle de 0 degres INCORRECT" severity error;

	-- TEST avec un angle de 0°
    	I_n   <= "00001"; --cos(0°)= 0
    	Q_n   <= "00000"; --sin(0°)= 1

	wait for 70 ns;

	assert (I_out_n = "01110")  report "Erreur : sortie I pour un angle de -25 degres INCORRECT" severity error;
	assert (Q_out_n = "11001")  report "Erreur : sortie Q pour un angle de -25 degres INCORRECT" severity error;
	assert (Phase_out_n = "000000000")  report "Erreur : phase de sortie pour un angle de 0 degres INCORRECT" severity error;

	-- TEST avec un angle de 123°
    	I_n   <= "11000"; --cos(123°)= -0.545
    	Q_n   <= "01101"; --sin(123°)= 0.839

	wait for 70 ns;

	assert (I_out_n = "01110")  report "Erreur : sortie I pour un angle de -25 degres INCORRECT" severity error;
	assert (Q_out_n = "11001")  report "Erreur : sortie Q pour un angle de -25 degres INCORRECT" severity error;
	assert (Phase_out_n = "000000000")  report "Erreur : phase de sortie pour un angle de 0 degres INCORRECT" severity error;

	wait for 70 ns;

	-- TEST avec un angle de -155°
    	I_n   <= "10010"; --cos(-155°)= -0.906
    	Q_n   <= "11010"; --sin(-155°)= -0.423

	wait for 70 ns;

	assert (I_out_n = "01110")  report "Erreur : sortie I pour un angle de -25 degres INCORRECT" severity error;
	assert (Q_out_n = "11001")  report "Erreur : sortie Q pour un angle de -25 degres INCORRECT" severity error;
	assert (Phase_out_n = "000000000")  report "Erreur : phase de sortie pour un angle de 0 degres INCORRECT" severity error;

	wait ;



end process ;


end arch;
