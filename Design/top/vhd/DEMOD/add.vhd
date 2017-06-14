------------------------------ADD.vhd-----------------------------------------
-- Creator : Pierre LAMY / Bastien MAHTAL
-- Creation Date : 05/04/17
-- Description : Simple generic ADD/SUB controlled by a bit.
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add_s is 
	generic(
		-- Generic use for operande sizes
		constant size_in : integer := 9;
		constant size_out : integer := 10
	);

	port (
		A : in std_logic_vector (size_in downto 0);
		B : in std_logic_vector (size_in downto 0);
		cmd_sub : in bit; -- to control which operation is used
		S : out std_logic_vector (size_out downto 0)
	);
end;

architecture behaviour of add_s is 

signal A_s : std_logic_vector (size_in+1 downto 0);
signal B_s : std_logic_vector (size_in+1 downto 0);

begin
	-- Concurrential assignation to do signed operation:
		-- A - B if cmd_sub = 1 
		-- else A + B
	process (A, B)
	begin
		if A(size_in) = '1' then 
			A_s <= "1" & A;	
		elsif A(size_in) = '0' then 
			A_s <= "0" & A;		
	 	else
			A_s <= "0" & A;	
	  	end if;

		if B(size_in) = '1' then 
			B_s <= "1" & B;	
		elsif A(size_in) = '0' then 
			B_s <= "0" & B;		
	 	else
			B_s <= "0" & B;	
	  	end if;
	end process;

	S <= std_logic_vector (signed(A_s) - signed (B_s)) when cmd_sub = '1' else
	std_logic_vector (signed(A_s) + signed (B_s));
end;
