	-----------------------------FILTRE.vhd----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FILTER_para is
  port( 
	Filter_In    : in  std_logic_vector(9 downto 0);
        CLK         : in  std_logic;
        RESET_n       : in  std_logic;
        Filter_Out  : out std_logic_vector(7 downto 0)) ;
end FILTER_para;

architecture A of FILTER_para is

  constant delay_line_data_size : integer := 9;
  constant rom_data_size : integer := 10;
  constant mult_out_size : integer := 20;
  constant out_size : integer := 7;

  constant accu_out_size : integer := mult_out_size+4;

  component MULT
    port(
		Mult_in_A : in  std_logic_vector(delay_line_data_size downto 0);
                Mult_in_B : in  std_logic_vector(rom_data_size downto 0);
                Mult_out  : out std_logic_vector(mult_out_size downto 0)
	);
  end component;

  component Resize
    port(
		resize_in    : in  std_logic_vector(mult_out_size downto 0);
        	resize_out  : out std_logic_vector(accu_out_size downto 0)

	);
   end component;

-- Après le premier registre, en entrée du multiplieur
  signal reg1_out1			 : std_logic_vector(delay_line_data_size downto 0);
  signal reg1_out2			 : std_logic_vector(delay_line_data_size downto 0);
  signal reg1_out3			 : std_logic_vector(delay_line_data_size downto 0);
  signal reg1_out4			 : std_logic_vector(delay_line_data_size downto 0);
  signal reg1_out5			 : std_logic_vector(delay_line_data_size downto 0);
  signal reg1_out6			 : std_logic_vector(delay_line_data_size downto 0);
  signal reg1_out7			 : std_logic_vector(delay_line_data_size downto 0);
  signal reg1_out8			 : std_logic_vector(delay_line_data_size downto 0);
  signal reg1_out9			 : std_logic_vector(delay_line_data_size downto 0);
  signal reg1_out10			 : std_logic_vector(delay_line_data_size downto 0);


-- Après le MULT et en entrée du RESIZE
  signal mult_out1			 : std_logic_vector(mult_out_size downto 0);
  signal mult_out2			 : std_logic_vector(mult_out_size downto 0);
  signal mult_out3			 : std_logic_vector(mult_out_size downto 0);
  signal mult_out4			 : std_logic_vector(mult_out_size downto 0);
  signal mult_out5			 : std_logic_vector(mult_out_size downto 0);
  signal mult_out6			 : std_logic_vector(mult_out_size downto 0);
  signal mult_out7			 : std_logic_vector(mult_out_size downto 0);
  signal mult_out8			 : std_logic_vector(mult_out_size downto 0);
  signal mult_out9			 : std_logic_vector(mult_out_size downto 0);
  signal mult_out10			 : std_logic_vector(mult_out_size downto 0);


-- Après le RESIZE
  signal resize_out1			 : std_logic_vector(accu_out_size downto 0);
  signal resize_out2			 : std_logic_vector(accu_out_size downto 0);
  signal resize_out3			 : std_logic_vector(accu_out_size downto 0);
  signal resize_out4			 : std_logic_vector(accu_out_size downto 0);
  signal resize_out5			 : std_logic_vector(accu_out_size downto 0);
  signal resize_out6			 : std_logic_vector(accu_out_size downto 0);
  signal resize_out7			 : std_logic_vector(accu_out_size downto 0);
  signal resize_out8			 : std_logic_vector(accu_out_size downto 0);  
  signal resize_out9			 : std_logic_vector(accu_out_size downto 0);
  signal resize_out10			 : std_logic_vector(accu_out_size downto 0);


-- Après le second étage du registre : MULT + RESIZE
  signal reg2_out1			 : std_logic_vector(accu_out_size downto 0);
  signal reg2_out2			 : std_logic_vector(accu_out_size downto 0);
  signal reg2_out3			 : std_logic_vector(accu_out_size downto 0);
  signal reg2_out4			 : std_logic_vector(accu_out_size downto 0);
  signal reg2_out5			 : std_logic_vector(accu_out_size downto 0);
  signal reg2_out6			 : std_logic_vector(accu_out_size downto 0);
  signal reg2_out7			 : std_logic_vector(accu_out_size downto 0);
  signal reg2_out8			 : std_logic_vector(accu_out_size downto 0);
  signal reg2_out9			 : std_logic_vector(accu_out_size downto 0);
  signal reg2_out10			 : std_logic_vector(accu_out_size downto 0);


--24 downto 0 (20+20 -> 21 bits max)
  signal add_out1_1			 : std_logic_vector(accu_out_size downto 0);
  signal add_out1_2			 : std_logic_vector(accu_out_size downto 0);
  signal add_out1_3			 : std_logic_vector(accu_out_size downto 0);
  signal add_out1_4			 : std_logic_vector(accu_out_size downto 0);
  signal add_out1_5			 : std_logic_vector(accu_out_size downto 0);

--24 downto 0
  signal add_out2_1			 : std_logic_vector(accu_out_size downto 0);
  signal add_out2_2			 : std_logic_vector(accu_out_size downto 0);

--24 downto 0
  signal add_out3_1			 : std_logic_vector(accu_out_size downto 0);

--24 downto 0
  signal add_out4_1			 : std_logic_vector(accu_out_size downto 0);

  signal output : std_logic_vector(out_size downto 0);

begin

    P_Sync: process(clk) begin
    
    if (clk'event and clk = '1') then
		if reset_n = '0' then
			reg1_out1 <= "0000000000";
			reg1_out2 <= "0000000000";
			reg1_out3 <= "0000000000";
			reg1_out4 <= "0000000000";
			reg1_out5 <= "0000000000";
			reg1_out6 <= "0000000000";
			reg1_out7 <= "0000000000";
			reg1_out8 <= "0000000000";
			reg1_out9 <= "0000000000";
			reg1_out10 <= "0000000000";

		else 
			--Affectation synchrone de l'entrée devant tout les multiplieurs (delay_line)
			reg1_out1 <= Filter_in;
			reg1_out2 <= reg1_out1;
			reg1_out3 <= reg1_out2;
			reg1_out4 <= reg1_out3;
			reg1_out5 <= reg1_out4;
			reg1_out6 <= reg1_out5;
			reg1_out7 <= reg1_out6;
			reg1_out8 <= reg1_out7;
			reg1_out9 <= reg1_out8;
			reg1_out10 <= reg1_out9;

			--Affectation synchrone de la sortie des multipliers au premier étage des add
			reg2_out1 <= resize_out1;
			reg2_out2 <= resize_out2;
			reg2_out3 <= resize_out3;
			reg2_out4 <= resize_out4;
			reg2_out5 <= resize_out5;
			reg2_out6 <= resize_out6;
			reg2_out7 <= resize_out7;
			reg2_out8 <= resize_out8;
			reg2_out9 <= resize_out9;
			reg2_out10 <= resize_out10;

		--Affectation synchrone de la sortie des adds au buffer de sortie
		output <= add_out4_1(accu_out_size) & add_out4_1(accu_out_size-7 downto 11);		

		end if;
	end if;
	end process P_Sync ;

  U1 : MULT port map (reg1_out1, "01100110101", mult_out1);
  U2 : MULT port map (reg1_out2, "00101100000", mult_out2);
  U3 : MULT port map (reg1_out3, "00110010010", mult_out3);
  U4 : MULT port map (reg1_out4, "00110110110", mult_out4);
  U5 : MULT port map (reg1_out5, "00111001000", mult_out5);
  U6 : MULT port map (reg1_out6, "00111001000", mult_out6);
  U7 : MULT port map (reg1_out7, "00110110110", mult_out7);
  U8 : MULT port map (reg1_out8, "00110010010", mult_out8);
  U9 : MULT port map (reg1_out9, "00101100000", mult_out9);
  U10 : MULT port map (reg1_out10, "01100110101", mult_out10);

  U30 : Resize port map(mult_out1, resize_out1);
  U31 : Resize port map(mult_out2, resize_out2);
  U32 : Resize port map(mult_out3, resize_out3);
  U33 : Resize port map(mult_out4, resize_out4);
  U34 : Resize port map(mult_out5, resize_out5);
  U35 : Resize port map(mult_out6, resize_out6);
  U36 : Resize port map(mult_out7, resize_out7);
  U37 : Resize port map(mult_out8, resize_out8);
  U38 : Resize port map(mult_out9, resize_out9);
  U39 : Resize port map(mult_out10, resize_out10);

  add_out1_1 <= std_logic_vector(signed(reg2_out1) + signed(reg2_out2));
  add_out1_2 <= std_logic_vector(signed(reg2_out3) + signed(reg2_out4));
  add_out1_3 <= std_logic_vector(signed(reg2_out5) + signed(reg2_out6));
  add_out1_4 <= std_logic_vector(signed(reg2_out7) + signed(reg2_out8));
  add_out1_5 <= std_logic_vector(signed(reg2_out9) + signed(reg2_out10));

  add_out2_1 <= std_logic_vector(signed(add_out1_1) + signed(add_out1_2));
  add_out2_2 <= std_logic_vector(signed(add_out1_3) + signed(add_out1_4));

  add_out3_1 <= std_logic_vector(signed(add_out2_1) + signed(add_out2_2));

  add_out4_1 <= std_logic_vector(signed(add_out3_1) + signed(add_out1_5));


  Filter_Out <= output;


end A;

