------------------------------SIGNEDMULT.vhd-----------------------------------
-- Creator : Pierre LAMY / Bastien MAHTAL
-- Creation Date : 11/04/17
-- Description : Simple generic MULT
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mult_s is 
	generic(
		-- Generic use for operande sizes
		constant size_in : integer := 4;
		constant size_out : integer := 9
	);

	port (
		A : in std_logic_vector (size_in downto 0);
		B : in std_logic_vector (size_in downto 0);
		S : out std_logic_vector (size_out downto 0)
	);
end;

architecture behaviour of mult_s is 
begin
	-- Concurrential assignation to do signed operation between A and B
	S <= std_logic_vector (signed(A) * signed (B));
end;
