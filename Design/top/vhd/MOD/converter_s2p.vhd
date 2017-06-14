-- Simple XOR gate design

library ieee;
use ieee.std_logic_1164.all;

entity converter_s2p is port (  i_hclk    : in std_logic;
                                i_rstn    : in std_logic;
                                i_data    : in std_logic;
                                i_cnt     : in std_logic_vector(5 downto 0);
                                o_i_even  : out std_logic; 
                                o_i_odd   : out std_logic);
end converter_s2p;

architecture converter_behaviour of converter_s2p is
  begin  
    CONVERTER_PROCESS:process(i_hclk)   
    begin  
      --synchronisation du bloc sur le front montant de l'horloge
      if (i_hclk'event and i_hclk = '1') then 
        if i_rstn='0' then    
          o_i_even <= '0';
          o_i_odd <= '0';     
        ---affecter a even_out les bits pairs et a odd_out les bits impairs
        elsif (i_cnt = "000001") then  
          o_i_even <= i_data;
        elsif (i_cnt = "011010") then 
          o_i_odd <= i_data;
        end if;
      end if;    
    end process CONVERTER_PROCESS;  

    ---XOR_PROCESS:process (data_in,data_out)
    --begin
    --  xor_out_reg_i <= data_in xor data_out;
    --end process XOR_PROCESS;	
end converter_behaviour;

