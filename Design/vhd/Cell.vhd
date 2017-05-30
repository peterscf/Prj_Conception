------------------------------cell.vhd-----------------------------------------
--Author: Floriant PETERSCHMITT
--Version: 11/05/2017
------------------------------cell.vhd-----------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

entity CELL is
    port(   clk: in std_logic;
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

architecture A of CELL is
    --signal sig_shift: signed (2 downto 0);
    signal sig_z_out: signed (7 downto 0);
    signal sig_x_out: signed (7 downto 0);
    signal sig_y_out: signed (7 downto 0);
    signal sig_int_z_out:std_logic_vector  (7 downto 0);
    signal sig_int_x_out: std_logic_vector (7 downto 0);
    signal sig_int_y_out:std_logic_vector(7 downto 0);
begin

synchro: process (clk,reset_n)
 
 begin
   

    if(reset_n = '0')then 
        z_out<="00000000";
        x_out<="00000000";
        y_out<="00000000";
    elsif clk'event and clk ='1' then
 	z_out<=sig_int_z_out;
    	x_out<=sig_int_x_out;
    	y_out<=sig_int_y_out;

end if;

end process synchro;


compute:process(x_in,y_in,z_in,tan_i,shift)
	variable var_y_shift:signed(7 downto 0);
begin
	var_y_shift:=shift_right(signed(y_in),to_integer(signed(shift))); --calcul du shift 
	
        case y_in(7) is
            when '0' =>     sig_z_out<=signed(z_in) + signed('0'&tan_i); --concatenation pour signed
                            sig_x_out<=signed(x_in) + var_y_shift;
                            sig_y_out<=signed(y_in) - var_y_shift;

            when '1' =>     sig_z_out<=signed(z_in) - signed('0'&tan_i); --concatenation pour signed
                            sig_x_out<=signed(x_in) - var_y_shift;
                            sig_y_out<=signed(y_in) + var_y_shift;
            
            when others =>  sig_z_out<="11111111";
                            sig_x_out<="11111111";
                            sig_y_out<="11111111";
        end case;
end process compute;  
	sig_int_z_out<=std_logic_vector(sig_z_out);
    	sig_int_x_out<=std_logic_vector(sig_x_out);
    	sig_int_y_out<=std_logic_vector(sig_y_out);
end A;
