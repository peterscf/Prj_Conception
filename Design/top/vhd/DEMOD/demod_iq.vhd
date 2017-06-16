-----------------------------TOP.vhd----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--library lib_VHDL;
--use lib_VHDL.filter;
--use lib_VHDL.filter_para;
--use lib_VHDL.add_s;
--use lib_VHDL.mult_s;

--use lib_VHDL.lut_i;
--use lib_VHDL.lut_q;
--use lib_VHDL.counter;

entity demod_iq is
  port( 
	I    	    : in  std_logic_vector(4 downto 0);
        Q           : in  std_logic_vector(4 downto 0);
        CLK         : in  std_logic;
        RESET_n     : in  std_logic;
        Filter_outI    : out std_logic_vector(7 downto 0);
        Filter_outQ    : out std_logic_vector(7 downto 0)
      );
end demod_iq;

architecture A of demod_iq is

--all sizes are consedered x down to 0, so +1 for each in bus size
  constant mult_size_in : integer := 4; 
  constant mult_size_out : integer := 9; 
    
  constant add_size_in : integer := mult_size_out;
  constant add_size_out : integer := mult_size_out +1;

  constant filter_size_in : integer := 9; 
  constant filter_size_out : integer := 7; 

-- Additionneur signé
component add_s is
	port (
		A : in std_logic_vector (add_size_in downto 0);
		B : in std_logic_vector (add_size_in downto 0);
		cmd_sub : in bit; -- to control which operation is used
		S : out std_logic_vector (add_size_out downto 0)
	);
end component;


-- Multiplieur Signé
component mult_s is 
	port (
		A : in std_logic_vector (mult_size_in downto 0);
		B : in std_logic_vector (mult_size_in downto 0);
		S : out std_logic_vector (mult_size_out downto 0)
	);
end component;


-- Filtre FIR in fin de chaîne du Démodulateur
component FILTER_para is
  port( 
	Filter_In    : in  std_logic_vector(filter_size_in downto 0);
        CLK         : in  std_logic;
        RESET_n       : in  std_logic;
        Filter_Out  : out std_logic_vector(filter_size_out downto 0)) ;
end component;

--Composant compteur du modulateur, permettant de contrôler la création des signaux sin/cos
component counter is 
  port(	
	i_hclk	: in std_logic;
        i_rstn	: in std_logic;
	o_count : out std_logic_vector(3 downto 0)
  );
end component;

--Composant de la LUT in phase, issu du modulateur
component lut_i is 
  port (	
        i_hclk		: in  std_logic;                --Horloge	
	i_rstn    : in  std_logic;                      --Reset asynchrone sur 0
	i_counter : in  std_logic_vector(3 downto 0);   --Valeur du compteur global
	i_i_even  : in  std_logic;                      --Entrée des bits pairs
	o_i       : out std_logic_vector(4 downto 0)    --Sortie I générée
  );
end component;


--Composant de la LUT in quadrature, issu du modulateur
component lut_q is 
  port (
	i_hclk	: in  std_logic;                        --Horloge	
	i_rstn    : in  std_logic;                      --Reset asynchrone sur 0
	i_counter : in  std_logic_vector(3 downto 0);   --Valeur du compteur global
	i_i_odd   : in  std_logic;                      --Entrée des bits pairs
	o_q       : out std_logic_vector(4 downto 0)    --Sortie Q générée
  );
end component;

-- Signaux du Filtre
signal I_s    	     : std_logic_vector(mult_size_in downto 0);
signal Q_s           : std_logic_vector(mult_size_in downto 0);
signal CLK_s         : std_logic;
signal RESET_n_s     : std_logic;
signal Filter_I_s    : std_logic_vector(filter_size_out downto 0);
signal Filter_Q_s    : std_logic_vector(filter_size_out downto 0);

--Signaux des sorties des produits LUTs x I/Q
signal mult1S_s      : std_logic_vector(mult_size_out downto 0);
signal mult2S_s      : std_logic_vector(mult_size_out downto 0);
signal mult3S_s      : std_logic_vector(mult_size_out downto 0);
signal mult4S_s      : std_logic_vector(mult_size_out downto 0);

--Signaux des sorties des additionneurs/ soustracteurs
signal add1S_s       : std_logic_vector(add_size_out downto 0);
signal add2S_s       : std_logic_vector(add_size_out downto 0);

-- Signal de commande des LUTs
signal counter_s     : std_logic_vector(3 downto 0);
-- Signaux Transportant la sortie des LUTs
signal cos : std_logic_vector(mult_size_in downto 0); 
signal sin : std_logic_vector(mult_size_in downto 0);

begin

CLK_s <= CLK;
RESET_n_s <= RESET_n;

process(CLK_s)
  begin
	if CLK_s'event and CLK_s = '1' then
		I_s <= I;
		Q_s <= Q;
		Filter_outI <= Filter_I_s;
		Filter_outQ <= Filter_Q_s;	
	end if;
end process;

  control_lut : counter port map(CLK_s, RESET_n_s, counter_s);
  lut_cos : lut_i port map (CLK_s, RESET_n_s, counter_s, '0', cos);
  lut_sin : lut_q port map (CLK_s, RESET_n_s, counter_s, '1', sin);

  mult1 : mult_s port map (
    A => I_s,
    B => cos,
    S => mult1S_s    
    );
  mult2 : mult_s port map (
    A => I_s,
    B => sin,
    S => mult2S_s    
    );
  mult3 : mult_s port map (
    A => Q_s,
    B => cos,
    S => mult3S_s    
    );
  mult4 : mult_s port map (
    A => Q_s,
    B => sin,
    S => mult4S_s    
    );

  Add1 : add_s port map (
    A => mult1S_s,
    B => mult4S_s,
    cmd_sub => '1',
    S => add1S_s 
    );

  Add2 : add_s port map (
    A => mult2S_s,
    B => mult3S_s,
    cmd_sub => '0',
    S => add2S_s 
    );

  filtre1 : filter_para port map (
    -- Gestion du signe en vhdl non prise en compte, vecteurs trop grands de 1
    -- laissons l'entrée du filtre sur 10b pour l'instant (rapporte trop de modif useless)
    Filter_in => add1S_s(add_size_out downto 1),
    CLK => CLK_s,
    RESET_n => RESET_n_s,
    Filter_out => Filter_I_s
    );

  filtre2 : filter_para port map (
    -- Gestion du signe en vhdl non prise en compte, vecteurs trop grands de 1
    -- laissons l'entrée du filtre sur 10b pour l'instant (rapporte trop de modif useless)
    Filter_in => add2S_s(add_size_out downto 1),
    CLK => CLK_s,
    RESET_n => RESET_n_s,
    Filter_out => Filter_Q_s
    );

end A;
