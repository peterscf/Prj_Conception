------------------------------cell.vhd-----------------------------------------
--Author: Floriant PETERSCHMITT
--Version: 11/05/2017
------------------------------cell.vhd-----------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CELL is
    port(   x_in: in std_logic_vector(7 downto 0);
            y_in: in std_logic_vector(7 downto 0);
            z_in: in std_logic_vector(7 downto 0);
            tan_i: in std_logic_vector(5 downto 0);
            shift: in std_logic_vector(2 downto 0)
            x_out: out std_logic_vector(7 downto 0);         
            y_out: out std_logic_vector(7 downto 0);
            z_out: out std_logic_vector(7 downto 0);
            );
end CELL;

architecture A of CELL is
signal sig_z: signed (7 downto 0);
signal sig_x: signed (7 downto 0);
signal sig_y: signed (7 downto 0);
signal sig_z_out: signed (7 downto 0);
signal sig_x_out: signed (7 downto 0);
signal sig_y_out: signed (7 downto 0);

begin
 process (clk,reset_n)
 begin
    sig_x<=signed(x_in);  
    sig_y<=signed(y_in);
    sig_z<=signed(z_in);
    if(reset_n == 0)then 
        z_out<="00000000";
        x_out<="00000000";
        y_out<="00000000";


    case 
        when '0' => sig_z_out<=sig_z + tan_i;
                    sig_x_out<=sig_x + (sig_y << shift);
                    sig_y_out<=sig_y - (sig_x << shift);

        when '1' =>  sig_z_out<=sig_z - tan_i;
                     sig_x_out<=sig_x - (sig_y << shift);
                     sig_y_out<=sig_y + (sig_x << shift);
end process;  
    z_out<=std_logic_vector(sig_z_out);
    x_out<=std_logic_vector(sig_x_out);
    y_out<=std_logic_vector(sig_y_out);

end A;

--architecture A of CELL is
--
--begin
--process(y[7])
--begin
--    case y[7] is 
--        when '0' => z_out<=z_in + tan_i;
--                    x_out<=x_in + (y_in << shift);
--                    y_out<=y_in - (x_in << shift);
--
--        when '1' =>  z_out<=z_in - tan_i;
--                     x_out<=x_in - (y_in << shift);
--                     y_out<=y_in + (x_in << shift);
--end process;   
--end A;
