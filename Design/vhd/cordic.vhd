-----------------------------CORDIC.vhd----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CORDIC is
	port( clk  : in std_logic;
		  reset_n  : in std_logic;
	  	  X  : in  std_logic_vector(7 downto 0);
		  Y  : in  std_logic_vector(7 downto 0);
		  Z  : out std_logic_vector(7 downto 0));
end CORDIC;

architecture A of CORDIC is

  component CELL
    port( 	clk: in std_logic;
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
  signal Zk6	: std_logic_vector(7 downto 0);


begin

  cell1 : CELL port map (
  	clk,
    	reset_n,
    	X,
   	Y,
    	Z,
    	"", --45
    	"000",
    	Xk1,
    	Yk1,
    	Zk1);
    
  U3 : CELL port map (
  	clk,
    reset_n,
    X,
    Y,
    Z,
    "", -- 26
    Xk2,
    Yk2,
    Zk2
    );
    
  U4 : CELL port map (
  	clk
    reset_n
    X
    Y
    Z
    Rom_out(Rom_Address("010"))
    "010"
    Xk
    Yk
    Zk
    );
    
  U5 : CELL port map (
  	clk
    reset_n
    X
    Y
    Z
    Rom_out(Rom_Address("011"))
    "011"
    Xk
    Yk
    Zk
    );
    
  U6 : CELL port map (
  	clk
    reset_n
    X
    Y
    Z
    Rom_out(Rom_Address("100"))
    "100"
    Xk
    Yk
    Zk
    );
    
  U7 : CELL port map (
  	clk
    reset_n
    X
    Y
    Z
    Rom_out(Rom_Address("101"))
    "101"
    Xk
    Yk
    Zk
    );
    

end A;

