-----------------------------CORDIC.vhd----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CORDIC is
	port( 	clk  : in std_logic;
		reset_n  : in std_logic;
	  	X  : in  std_logic_vector(7 downto 0);
		Y  : in  std_logic_vector(7 downto 0);
		Z  : out std_logic_vector(7 downto 0));
end CORDIC;

architecture A of CORDIC is

  component CELL
    port( clk: in std_logic;
          reset_n : in std_logic;
          x_in: in std_logic_vector(7 downto 0);
          y_in: in std_logic_vector(7 downto 0);
          z_in: in std_logic_vector(7 downto 0);
          tan_i: in std_logic_vector(5 downto 0);
          shift: in std_logic_vector(2 downto 0);
          x_out: out std_logic_vector(7 downto 0);         
          y_out: out std_logic_vector(7 downto 0);
          z_out: out std_logic_vector(7 downto 0));
  end CELL;

 
  signal X1 	: std_logic_vector(7 downto 0);
  signal Y1	: std_logic_vector(7 downto 0);
  signal Z1	: std_logic_vector(7 downto 0);
 
  signal X2 	: std_logic_vector(7 downto 0);
  signal Y2	: std_logic_vector(7 downto 0);
  signal Z2	: std_logic_vector(7 downto 0);

  signal X3 	: std_logic_vector(7 downto 0);
  signal Y3	: std_logic_vector(7 downto 0);
  signal Z3	: std_logic_vector(7 downto 0);

  signal X4 	: std_logic_vector(7 downto 0);
  signal Y4	: std_logic_vector(7 downto 0);
  signal Z4	: std_logic_vector(7 downto 0);

  signal X5 	: std_logic_vector(7 downto 0);
  signal Y5	: std_logic_vector(7 downto 0);
  signal Z5	: std_logic_vector(7 downto 0);

  signal X6 	: std_logic_vector(7 downto 0);
  signal Y6	: std_logic_vector(7 downto 0);


begin

  cell1 : CELL port map (
  	clk,
    	reset_n,
    	X,
   	Y,
    	Z,
    	"101101", -- 45
    	"000", 	  -- 0
    	X1,
    	Y1,
    	Z1);
    
  cell2 : CELL port map (
  	clk,
    	reset_n,
   	X1,
    	Y1,
    	Z1,
    	"011010", -- 26
	"001",	  -- 1
    	X2,
    	Y2,
    	Z2);
    
  cell3 : CELL port map (
  	clk,
    	reset_n,
   	X2,
    	Y2,
    	Z2,
    	"001110", -- 14
    	"010", 	  -- 2
    	X3,
    	Y3,
    	Z3);
    
  cell4 : CELL port map (
  	clk,
    	reset_n,
    	X3,
    	Y3,
    	Z3,
    	"000111", -- 7
    	"011",	  -- 3
    	X4,
    	Y4,
    	Z4);
    
  cell5 : CELL port map (
  	clk,
    	reset_n,
    	X4,
    	Y4,
    	Z4,
    	"000011", -- 3
    	"100",	  -- 4
    	X5,
    	Y5,
    	Z5);
    
  cell6 : CELL port map (
  	clk,
    	reset_n,
    	X5,
    	Y5,
   	Z5,
    	"000001", -- 1
    	"101",	  -- 5
    	X6,
    	Y6,
    	Z);
end A;

