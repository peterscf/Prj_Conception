library IEEE ;
use IEEE.std_logic_1164.ALL ;
use ieee.numeric_std.all;
library lib_COMP ;
use lib_COMP.ShiftRegister11b;

entity test_SR11b is end test_SR11b;

architecture test1 of test_SR11b is

	component ShiftRegister11b is 
	port(--in 
		clk: 	in std_logic;	
		rst: 	in std_logic;	
		sr:  	in std_logic;	
		load:	in std_logic;	
		serial_in: in std_logic;
		data_in: in std_logic_vector(10 downto 0);
		--out
		serial_out: out std_logic;
		data_out: out std_logic_vector(10 downto 0));

end component;
--signal declaration
--in
signal reset: std_logic:='0';
signal clock: std_logic :='0';
signal sign_sr: std_logic:='1';	
signal sign_load:std_logic:='0';	
signal sign_serial_in:std_logic:='1';
signal sign_data_in:std_logic_vector(10 downto 0):="00000000000";
--out
signal sign_serial_out:std_logic;
signal sign_data_out:std_logic_vector(10 downto 0);


begin 

 ShiftRegister11b1: ShiftRegister11b port map(clock,reset,sign_sr,sign_load,sign_serial_in,sign_data_in,sign_serial_out,sign_data_out);

clock<=not(clock) after 2 ns;

process

	constant delay:time := 4 ns;
begin

	wait for delay;
	reset<='1';
	wait for delay/3;
	sign_load<='1';
	wait for delay;
	sign_load<='0';
	sign_sr<='0';
	wait for delay*5;
	reset<='0';
	wait for delay;
	reset<='1';
	sign_data_in<="11111111111";
	sign_serial_in<='0';
	wait for delay/2;
	sign_load<='1';
	wait for delay;
	sign_load<='0';
	sign_sr<='1';
	wait for delay*5;
	
	

--	assert false report " FIN DE LA SIMULATION" severity failure;	
end process;
end test1;
