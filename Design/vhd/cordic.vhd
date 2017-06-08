-----------------------------CORDIC.vhd----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CORDIC_top is
	generic(Nb: integer := 8);

	port( 	clk  : in std_logic;
		reset_n  : in std_logic;
	  	X  : in  std_logic_vector(Nb-1 downto 0);
		Y  : in  std_logic_vector(Nb-1 downto 0);
		Z  : out std_logic_vector(8 downto 0));
end CORDIC_top;

architecture A of CORDIC_top is
component PRE_PROCESS
	generic(  Nb: integer );
  	
	port( 	clk : in std_logic;
			reset_n : in std_logic;
			Iin  : in std_logic_vector(Nb-1 downto 0);
			Qin  : in std_logic_vector(Nb-1 downto 0);
	  		Iout : out  std_logic_vector(Nb-1 downto 0);
			Qout : out  std_logic_vector(Nb-1 downto 0);
			Z : out std_logic_vector(8 downto 0));
  end component;
  
  component CELL
	  generic( Nb:integer; --Nb bits du bus en entrée 
	  tan_i: integer; --angle
	  shift: integer --etage du pipe
  	);

    port(   clk: in std_logic;
            reset_n : in std_logic;
            x_in: in std_logic_vector(Nb-1 downto 0);
            y_in: in std_logic_vector(Nb-1 downto 0);
            z_in: in std_logic_vector(8 downto 0);
            x_out: out std_logic_vector(Nb-1 downto 0);         
            y_out: out std_logic_vector(Nb-1 downto 0);
            z_out: out std_logic_vector(8 downto 0));
  end component;

  signal X0	: std_logic_vector(Nb-1 downto 0);
  signal Y0 	: std_logic_vector(Nb-1 downto 0);
  signal Z0	: std_logic_vector(8 downto 0);

  signal X1 	: std_logic_vector(Nb-1 downto 0);
  signal Y1	: std_logic_vector(Nb-1 downto 0);
  signal Z1	: std_logic_vector(8 downto 0);
 
  signal X2 	: std_logic_vector(Nb-1 downto 0);
  signal Y2	: std_logic_vector(Nb-1 downto 0);
  signal Z2	: std_logic_vector(8 downto 0);

  signal X3 	: std_logic_vector(Nb-1 downto 0);
  signal Y3	: std_logic_vector(Nb-1 downto 0);
  signal Z3	: std_logic_vector(8 downto 0);

  signal X4 	: std_logic_vector(Nb-1 downto 0);
  signal Y4	: std_logic_vector(Nb-1 downto 0);
  signal Z4	: std_logic_vector(8 downto 0);

  signal X5 	: std_logic_vector(Nb-1 downto 0);
  signal Y5	: std_logic_vector(Nb-1 downto 0);
  signal Z5	: std_logic_vector(8 downto 0);

  signal X6 	: std_logic_vector(Nb-1 downto 0);
  signal Y6	: std_logic_vector(Nb-1 downto 0);
  signal Z6	: std_logic_vector(8 downto 0);


begin

	Z <= Z6;

pp1: PRE_PROCESS generic map ( Nb => 8)
  port map (
  	clk,
    	reset_n,
    	X,
   	Y,
       	X0,
    	Y0,
    	Z0);	
	
  cell1 : CELL generic map ( Nb => 8,
		tan_i => 45,
		shift => 0 )
  port map (
  	clk,
    	reset_n,
    	X0,
   	Y0,
	Z0,
       	X1,
    	Y1,
    	Z1);
    
  cell2 : CELL generic map ( Nb => 8,
		 tan_i=> 26,
		shift => 1)
  port map (
  	clk,
    	reset_n,
   	X1,
    	Y1,
    	Z1,
	X2,
    	Y2,
    	Z2);
    
  cell3 : CELL generic map ( Nb => 8,
		tan_i=> 14,
		shift => 2)
  port map (
  	clk,
    	reset_n,
   	X2,
    	Y2,
    	Z2,
	X3,
    	Y3,
    	Z3);
    
  cell4 : CELL generic map ( Nb => 8,
		tan_i=> 7,
		shift => 3)
 port map (
  	clk,
    	reset_n,
    	X3,
    	Y3,
    	Z3,
    	X4,
    	Y4,
    	Z4);
    
  cell5 : CELL generic map ( Nb => 8,
		tan_i=> 3,
		shift => 4)
  port map (
  	clk,
    	reset_n,
    	X4,
    	Y4,
    	Z4,
    	X5,
    	Y5,
    	Z5);
    
  cell6 : CELL generic map ( Nb => 8,
		tan_i=> 1,
		shift => 5)
  port map (
  	clk,
    	reset_n,
    	X5,
    	Y5,
   	Z5,
    	X6,
    	Y6,
    	Z6);
end A;

