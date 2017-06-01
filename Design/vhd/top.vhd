-----------------------------etages2.vhd----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Entity top is
 generic ( N_bit: integer:=5 );

 port (
	I_n, Q_n      	 : in  std_logic_vector (N_bit-1 downto 0);
	test_mode      	 : in  std_logic;
	Clk, Clk_test	 : in std_logic;
	Rst	  	 : in std_logic;
	Phase_out_n	 : out std_logic_vector (8 downto 0)
     );
end top;

Architecture Arch of top is

	component romCordic
		port(	clk 	: in std_logic;
			rst	: in std_logic;
			viaI	: out std_logic_vector(4 downto 0);
			viaQ	: out std_logic_vector(4 downto 0));
	end component;

	component mux
	generic (   
			N_bit	 :  integer
		);
	port (	test_mode : in  std_logic;
		In1        : in  std_logic_vector (N_bit-1 downto 0);
		In2        : in  std_logic_vector (N_bit-1 downto 0);
		Out1       : out  std_logic_vector (N_bit-1 downto 0)
	     );
	end component;

	component etage

		generic ( k      : integer ; --Correspond au k ième étage pipeline
			  N_bit	 : integer ; -- Correspond au nombre de bit sur lequel sont codés les signaux entrées/sortis
			  Alpha  : integer   -- Correspond à l'angle de l'étage * 4
			);


		port (	I        : in  std_logic_vector (N_bit-1 downto 0);
			Q        : in  std_logic_vector (N_bit-1 downto 0);
			Phase_in : in  std_logic_vector (8 downto 0);
			c1_in, c2_in	 : in std_logic;
			c1_out, c2_out	 : out std_logic;
			I_out    : out std_logic_vector (N_bit-1 downto 0);
			Q_out    : out std_logic_vector (N_bit-1 downto 0);
			Phase_out: out std_logic_vector (8 downto 0)
		     );

	end component;


	component registre
		generic (   
			N_bit	 :  integer
		);

		port (	I        : in  std_logic_vector (N_bit-1 downto 0);
			Q        : in  std_logic_vector (N_bit-1 downto 0);
			Phase_in : in  std_logic_vector (8 downto 0);
			Clk	 : in  std_logic;
			Rst	 : in  std_logic;
			c1_in, c2_in	 : in std_logic;
			c1_out, c2_out	 : out std_logic;
			I_out    : out std_logic_vector (N_bit-1 downto 0);
			Q_out    : out std_logic_vector (N_bit-1 downto 0);
			Phase_out: out std_logic_vector (8 downto 0)
	     	   );
		end component;
	
	component check_signe_input
	generic (N_bit	 : integer -- Correspond au nombre de bit sur lequel sont codés les signaux entrées/sortis
		);


	port (	I        : in  std_logic_vector (N_bit-1 downto 0);
		Q        : in  std_logic_vector (N_bit-1 downto 0);
		I_out    : out std_logic_vector (N_bit-1 downto 0);
		Q_out    : out std_logic_vector (N_bit-1 downto 0);
		c1       : out std_logic ;
		c2       : out std_logic 
	     );

	end component ;


	component finalisation_phase
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

	end  component;


-- Signaux internes
signal I_out_compt		: std_logic_vector (4 downto 0);
signal Q_out_compt		: std_logic_vector (4 downto 0);
signal I_out_mux		: std_logic_vector (4 downto 0);
signal Q_out_mux		: std_logic_vector (4 downto 0);

 signal I0, Q0			: std_logic_vector (N_bit-1 downto 0);
 -- signal Phase0	 		: std_logic_vector (8 downto 0);
  signal c1_0, c2_0		: std_logic;

 signal I1, Q1			: std_logic_vector (N_bit-1 downto 0);
 signal Phase1	 		: std_logic_vector (8 downto 0);
 signal c1_1, c2_1		: std_logic;

 signal I2, Q2			: std_logic_vector (N_bit-1 downto 0);
 signal Phase2	 		: std_logic_vector (8 downto 0);
 signal c1_2, c2_2		: std_logic;

 signal I3, Q3			: std_logic_vector (N_bit-1 downto 0);
 signal Phase3	 		: std_logic_vector (8 downto 0);
 signal c1_3, c2_3		: std_logic;

 signal I4, Q4			: std_logic_vector (N_bit-1 downto 0);
 signal Phase4	 		: std_logic_vector (8 downto 0);
 signal c1_4, c2_4		: std_logic;

 signal I5, Q5			: std_logic_vector (N_bit-1 downto 0);
 signal Phase5	 		: std_logic_vector (8 downto 0);
 signal c1_5, c2_5		: std_logic;

 signal I6, Q6			: std_logic_vector (N_bit-1 downto 0);
 signal Phase6	 		: std_logic_vector (8 downto 0);
 signal c1_6, c2_6		: std_logic;

 signal I7, Q7			: std_logic_vector (N_bit-1 downto 0);
 signal Phase7	 		: std_logic_vector (8 downto 0);
 signal c1_7, c2_7		: std_logic;

 signal I8, Q8			: std_logic_vector (N_bit-1 downto 0);
 signal Phase8	 		: std_logic_vector (8 downto 0);
 signal c1_8, c2_8		: std_logic;

 signal I9, Q9			: std_logic_vector (N_bit-1 downto 0);
 signal Phase9	 		: std_logic_vector (8 downto 0);
 signal c1_9, c2_9		: std_logic;

 signal I10, Q10		: std_logic_vector (N_bit-1 downto 0);
 signal Phase10	 		: std_logic_vector (8 downto 0);
 signal c1_10, c2_10		: std_logic;

 signal I11, Q11		: std_logic_vector (N_bit-1 downto 0);
 signal Phase11	 		: std_logic_vector (8 downto 0);
 signal c1_11, c2_11		: std_logic;

signal	I_out_n   	 	:  std_logic_vector (N_bit-1 downto 0);
signal	Q_out_n   	 	:  std_logic_vector (N_bit-1 downto 0);

Begin
------------------- Compteur de test------------------------------------------------------------------
U0:  romCordic port map(	
		clk 	=> Clk_test,
		rst	=> rst,
		viaI	=> I_out_compt,
		viaQ	=> Q_out_compt
	);

------------------- MUX I----------------------------------------------------------------------
MUX_I: mux generic map (   
		N_bit	=> 5 )
port map (	test_mode  => test_mode,
	In1        => I_n,
	In2        => I_out_compt,
	Out1       => I_out_mux
     );

------------------- MUX Q----------------------------------------------------------------------
MUX_Q: mux generic map (   
		N_bit	=> 5 )
port map (	test_mode  => test_mode,
	In1        => Q_n,
	In2        => Q_out_compt,
	Out1       => Q_out_mux
     );

------------------- Registre ----------------------------------------------------------------------
U1 : registre generic map (
		N_bit => 5 )
	port map (
		I => I_out_mux,
		Q => Q_out_mux,
		Phase_in => "000000000",
		Clk => clk,
		Rst => rst,
		c1_in => '0',
		c2_in => '0',
		c1_out => c1_0,
		c2_out => c2_0,
		I_out => I0,
		Q_out => Q0,
		Phase_out => Phase1	
	) ;

------------------- Check Signe Input----------------------------------------------------------------

U2 : check_signe_input generic map (
		N_bit => 5 )
	port map (
		I   	=> I0,     
		Q   	=> Q0,     
		I_out   => I1, 
		Q_out   => Q1,
		c1      => C1_1,
		c2      => C2_1
	     );
------------------- Registre ----------------------------------------------------------------------
U3 : registre generic map (
		N_bit => 5 )
	port map (
		I => I1,
		Q => Q1,
		Phase_in => Phase1,
		Clk => clk,
		Rst => rst,
		c1_in => c1_1,
		c2_in => c2_1,
		c1_out => c1_2,
		c2_out => c2_2,
		I_out => I2,
		Q_out => Q2,
		Phase_out => Phase2	
	) ;

------------------- Etage 1-----------------------------------------------------------------------
U4 : etage generic map (
		k => 0,
		N_bit => 5,
		Alpha => 64 )

	port map (
		I => I2,
		Q => Q2,
		Phase_in => Phase2,
		c1_in => c1_2,
		c2_in => c2_2,
		c1_out => c1_3,
		c2_out => c2_3,
		I_out => I3,
		Q_out => Q3,
		Phase_out => Phase3	
	) ;
------------------- Registre ----------------------------------------------------------------------
U5 : registre generic map (
		N_bit => 5 )
	port map (
		I => I3,
		Q => Q3,
		Phase_in => Phase3,
		Clk => clk,
		Rst => rst,
		c1_in => c1_3,
		c2_in => c2_3,
		c1_out => c1_4,
		c2_out => c2_4,
		I_out => I4,
		Q_out => Q4,
		Phase_out => Phase4	
	) ;		
------------------- Etage 2-----------------------------------------------------------------------
U6 : etage generic map (
		k => 1,
		N_bit => 5,
		Alpha => 37 )

	port map (
		I => I4,
		Q => Q4,
		Phase_in => Phase4,
		c1_in => c1_4,
		c2_in => c2_4,
		c1_out => c1_5,
		c2_out => c2_5,
		I_out => I5,
		Q_out => Q5,
		Phase_out => Phase5			
	) ;

------------------- Registre ----------------------------------------------------------------------
U7 : registre generic map (
		N_bit => 5 )
	port map (
		I => I5,
		Q => Q5,
		Phase_in => Phase5,
		Clk => clk,
		Rst => rst,
		c1_in => c1_5,
		c2_in => c2_5,
		c1_out => c1_6,
		c2_out => c2_6,
		I_out => I6,
		Q_out => Q6,
		Phase_out => Phase6
	) ;
------------------- Etage 3-----------------------------------------------------------------------
U8 : etage generic map (
		k => 2,
		N_bit => 5,
		Alpha => 20 )

	port map (
		I => I6,
		Q => Q6,
		Phase_in => Phase6,
		c1_in => c1_6,
		c2_in => c2_6,
		c1_out => c1_7,
		c2_out => c2_7,
		I_out => I7,
		Q_out => Q7,
		Phase_out => Phase7
	) ;
------------------- Registre ----------------------------------------------------------------------
U9 : registre generic map (
		N_bit => 5 )
	port map (
		I => I7,
		Q => Q7,
		Phase_in => Phase7,
		Clk => clk,
		Rst => rst,
		c1_in => c1_7,
		c2_in => c2_7,
		c1_out => c1_8,
		c2_out => c2_8,
		I_out => I8,
		Q_out => Q8,
		Phase_out => Phase8
	) ;
------------------- Etage 4-----------------------------------------------------------------------
U10 : etage generic map (
		k => 2,
		N_bit => 5,
		Alpha => 10 )

	port map (
		I => I8,
		Q => Q8,
		Phase_in => Phase8,
		c1_in => c1_8,
		c2_in => c2_8,
		c1_out => c1_9,
		c2_out => c2_9,
		I_out => I9,
		Q_out => Q9,
		Phase_out => Phase9
	) ;

------------------- Registre ----------------------------------------------------------------------
U11 : registre generic map (
		N_bit => 5 )
	port map (
		I => I9,
		Q => Q9,
		Phase_in => Phase9,
		Clk => clk,
		Rst => rst,
		c1_in => c1_9,
		c2_in => c2_9,
		c1_out => c1_10,
		c2_out => c2_10,
		I_out => I10,
		Q_out => Q10,
		Phase_out => Phase10
) ;
------------------- Finalisation Phase----------------------------------------------------------------------
U12 : finalisation_phase generic map (
		N_bit => 5 )
	port map (
		I         => I10,
		Q         => Q10,
		c1        => c1_10,
		c2        => c2_10,
		Phase_in  => Phase10,
		I_out     => I11,
		Q_out     => Q11,
		Phase_out => Phase11
	     );
------------------- Registre ----------------------------------------------------------------------
U13 : registre generic map (
		N_bit => 5 )
	port map (
		I => I11,
		Q => Q11,
		Phase_in => Phase11,
		Clk => clk,
		Rst => rst,
		c1_in => c1_10,
		c2_in => c2_10,
		c1_out => c1_11,
		c2_out => c2_11,
		I_out => I_out_n,
		Q_out => Q_out_n,
		Phase_out => Phase_out_n
) ;

end Arch;
