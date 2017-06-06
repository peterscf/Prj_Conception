library IEEE ;
use IEEE.std_logic_1164.ALL ;
use ieee.numeric_std.all;

entity ShiftRegister11b is 
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

end ShiftRegister11b;

architecture SR11b of ShiftRegister11b is 

begin 

process(clk,rst)
	
variable reg: std_logic_vector(10 downto 0);

	begin 
	
	if rst='0' then 
		reg:="00000000000";
		serial_out<='0';
		data_out<="00000000000";
	elsif  clk'event and clk='1' then 
			
			if load ='1' then 
				data_out<= reg; 
				reg := data_in;
			else
				if sr = '1'then
					serial_out<= reg(0);
					reg:=serial_in & reg(10 downto 1);
				else
					serial_out<= reg(10);
					reg:= reg(9 downto 0) & serial_in;
	
				end if;
			end if;
	end if;


end process;
end SR11b;
