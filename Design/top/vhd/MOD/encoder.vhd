-- Simple XOR gate design

library ieee;
use ieee.std_logic_1164.all;

entity encoder is port (  i_hclk    : in std_logic; 
                          i_rstn    : in std_logic; 
                          i_data    : in std_logic ;
                          i_cnt     : in std_logic_vector(5 downto 0);
                          o_data    : out std_logic);
end encoder;

architecture encoder_behaviour of encoder is
  --signal xor_out_reg_i : std_logic;
  begin
    REG_PROCESS:process(i_hclk)
    variable v_xor : std_logic;   
    begin
      --mettre à zero la sortie si reset= 0
      --synchronisation du bloc sur le front montant de l'horloge
      if (i_hclk'event and i_hclk = '1') then 
        if i_rstn = '0' then
          v_xor := '1';
        elsif (i_cnt = "000000" or i_cnt = "011001" ) then  
          v_xor := v_xor xor i_data;
        end if;
        o_data <= v_xor;
      end if;    
    end process REG_PROCESS;	
end encoder_behaviour;

