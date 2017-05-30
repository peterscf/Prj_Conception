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

 
  signal Xk1 	: std_logic_vector(7 downto 0);
  signal Yk1	: std_logic_vector(7 downto 0);
  signal Zk1	: std_logic_vector(7 downto 0);
 
  signal Xk2 	: std_logic_vector(7 downto 0);
  signal Yk2	: std_logic_vector(7 downto 0);
  signal Zk2	: std_logic_vector(7 downto 0);

  signal Xk3 	: std_logic_vector(7 downto 0);
  signal Yk3	: std_logic_vector(7 downto 0);
  signal Zk3	: std_logic_vector(7 downto 0);

  signal Xk4 	: std_logic_vector(7 downto 0);
  signal Yk4	: std_logic_vector(7 downto 0);
  signal Zk4	: std_logic_vector(7 downto 0);

  signal Xk5 	: std_logic_vector(7 downto 0);
  signal Yk5	: std_logic_vector(7 downto 0);
  signal Zk5	: std_logic_vector(7 downto 0);

  signal Xk6 	: std_logic_vector(7 downto 0);
  signal Yk6	: std_logic_vector(7 downto 0);


begin

  cell1 : CELL port map (
  	clk,
    	reset_n,
    	X,
   	Y,
    	Z,
    	"101101", --45
    	"000",
    	Xk1,
    	Yk1,
    	Zk1);
    
  cell2 : CELL port map (
  	clk,
    	reset_n,
   	Xk1,
    	Yk1,
    	Zk1,
    	"011010", -- 26
	"001",
    	Xk2,
    	Yk2,
    	Zk2);
    
  cell3 : CELL port map (
  	clk
    	reset_n
   	Xk2
    	Yk2
    	Zk2
    	"001110", -- 14
    	"010"
    	Xk3
    	Yk3
    	Zk3);
    
  cell4 : CELL port map (
  	clk
    	reset_n
    	Xk3
    	Yk3
    	Zk3
    	"000111", -- 7
    	"011"
    	Xk4
    	Yk4
    	Zk4);
    
  cell5 : CELL port map (
  	clk
    	reset_n
    	Xk4
    	Yk4
    	Zk4
    	"000011", -- 3
    	"100"
    	Xk5
    	Yk5
    	Zk5);
    
  cell6 : CELL port map (
  	clk
    	reset_n
    	Xk5
    	Yk5
   	Zk5
    	"000001", -- 1
    	"101"
    	Xk6
    	Yk6
    	Z);
end A;

