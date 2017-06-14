library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

--library LIB_MSK_MODULATOR;
--use LIB_MSK_MODULATOR.counter;
--use LIB_MSK_MODULATOR.encoder;
--use LIB_MSK_MODULATOR.converter_s2p;
--use LIB_MSK_MODULATOR.lut_i;
--use LIB_MSK_MODULATOR.lut_q;

entity msk_modulator is port (	i_hclk		: in  std_logic;                      
			                          i_rstn    : in  std_logic;                     
			                          i_data    : in  std_logic;   
			                          o_i       : out std_logic_vector(4 downto 0);  
			                          o_q       : out std_logic_vector(4 downto 0));  
end msk_modulator;

architecture a of msk_modulator is
  component counter port (  i_hclk  : in std_logic;
                            i_rstn	: in std_logic;
			                      o_count : out std_logic_vector(5 downto 0));	
  end component;
  component encoder port (  i_hclk    : in std_logic; 
                            i_rstn    : in std_logic; 
                            i_data    : in std_logic ;
                            i_cnt     : in std_logic_vector(5 downto 0);
                            o_data    : out std_logic);
  end component;
  component converter_s2p port (  i_hclk    : in std_logic;
                                  i_rstn    : in std_logic;
                                  i_data    : in std_logic;
                                  i_cnt     : in std_logic_vector(5 downto 0);
                                  o_i_even  : out std_logic; 
                                  o_i_odd   : out std_logic);
  end component;
  component lut_i port (	i_hclk		: in  std_logic;                     
			                    i_rstn    : in  std_logic;                     
			                    i_counter : in  std_logic_vector(5 downto 0);  
			                    i_i_even  : in  std_logic;                      
			                    o_i       : out std_logic_vector(4 downto 0));  
  end component;
  component lut_q port (	i_hclk		: in  std_logic;                      
			                    i_rstn    : in  std_logic;                      
			                    i_counter : in  std_logic_vector(5 downto 0);  
			                    i_i_odd   : in  std_logic;                      
			                    o_q       : out std_logic_vector(4 downto 0));  
  end component;

  signal s_in_hclk : std_logic;
  signal s_in_rstn : std_logic;
  signal s_in_data : std_logic;
  signal s_data_converter : std_logic;
  signal s_count  : std_logic_vector(5 downto 0);
  signal s_i_even : std_logic;
  signal s_i_odd  : std_logic;
  signal s_out_i  : std_logic_vector(4 downto 0);
  signal s_out_q  : std_logic_vector(4 downto 0);
  

  begin
    counter_1 : counter port map (s_in_hclk, s_in_rstn, s_count);
    encoder_1 : encoder port map (s_in_hclk, s_in_rstn, s_in_data, s_count, s_data_converter);
    converter_s2p_1 : converter_s2p port map (s_in_hclk, s_in_rstn, s_data_converter, s_count, s_i_even, s_i_odd);
    lut_i_1 : lut_i port map (s_in_hclk, s_in_rstn, s_count, s_i_even, s_out_i);
    lut_q_1 : lut_q port map (s_in_hclk, s_in_rstn, s_count, s_i_odd, s_out_q);

    s_in_hclk <= i_hclk;
    s_in_rstn <= i_rstn;
    s_in_data <= i_data;
    o_i <= s_out_i;
    o_q <= s_out_q;

end a;
