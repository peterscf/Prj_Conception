library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

--library LIB_LUT;
---use LIB_LUT.rom;

entity lut_q is port (	i_hclk		: in  std_logic;                      --Horloge	
			                  i_rstn    : in  std_logic;                      --Reset asynchrone sur 0
			                  i_counter : in  std_logic_vector(5 downto 0);   --Valeur du compteur global
			                  i_i_odd   : in  std_logic;                      --Entrée des bits pairs
			                  o_q       : out std_logic_vector(4 downto 0));  --Sortie Q générée
end lut_q;

architecture a of lut_q is
    component rom
		  port (  i_rom_address	: in  std_logic_vector(2 downto 0);
        		  o_rom_out    	: out std_logic_vector(3 downto 0));
	  end component;

    signal s_rom_address  : std_logic_vector(2 downto 0);
    signal s_rom_out      : std_logic_vector(3 downto 0);

    --signal sig_sign_theo    : std_logic;
    --signal sig_sign_real    : std_logic;
    --signal sig_data         : std_logic_vector(3 downto 0);
    
    --constant c_val_ini : std_logic_vector(5 downto 0) := "000010"; 
    --constant c_val_min : std_logic_vector(5 downto 0) := "000000"; 
    --constant c_val_max : std_logic_vector(5 downto 0) := "110001";
    --constant c_pas : std_logic_vector(5 downto 0) := "000101";

    begin
      --Connection à la ROM de 10 valeurs
      rom1: rom port map (s_rom_address, s_rom_out);     
      --Redirection et traduction de l'entrée i_counter vers la ROM
      --Pour l'état 2 du compteur, on veut la premiere valeur de la ROM,
      --Pour l'état 3 du compteur, on veut la seconde valeur de la ROM ...
      process(i_counter)
        begin
	  --if (i_counter >= c_val_ini and i_counter < c_val_ini+c_pas) then s_rom_address <= "100";
	  --elsif (i_counter >= c_val_ini+c_pas and i_counter < c_val_ini+2*c_pas) then s_rom_address <= "011";
	  --elsif (i_counter >= (c_val_ini+(2*c_pas)) and i_counter < (c_val_ini+(3*c_pas))) then s_rom_address <= "010";
	  --elsif (i_counter >= c_val_ini+3*c_pas and i_counter < c_val_ini+4*c_pas) then s_rom_address <= "001";
	  --elsif (i_counter >= c_val_ini+4*c_pas and i_counter < c_val_ini+5*c_pas) then s_rom_address <= "000";
	  --elsif (i_counter >= c_val_ini+5*c_pas and i_counter < c_val_ini+6*c_pas) then s_rom_address <= "000";
	  --elsif (i_counter >= c_val_ini+6*c_pas and i_counter < c_val_ini+7*c_pas) then s_rom_address <= "001";
	  --elsif (i_counter >= c_val_ini+7*c_pas and i_counter < c_val_ini+8*c_pas) then s_rom_address <= "010";
	  --elsif (i_counter >= c_val_ini+8*c_pas and i_counter < c_val_ini+9*c_pas) then s_rom_address <= "011";
	  --elsif (i_counter >= c_val_ini+9*c_pas and i_counter < c_val_max) then s_rom_address <= "100";
	  --elsif (i_counter >= c_val_min and i_counter < c_val_ini) then s_rom_address <= "100";
          --else s_rom_address <= "000";
          --end if;

          if (i_counter >= "011011" and i_counter < "100000") then s_rom_address <= "000";
          elsif (i_counter >= "100000" and i_counter < "100101" ) then s_rom_address <= "001";
          elsif (i_counter >= "100101" and i_counter < "101010" ) then s_rom_address <= "010";
          elsif (i_counter >= "101010" and i_counter < "101111" ) then s_rom_address <= "011";
          elsif (i_counter >= "101111" and i_counter <= "110001") then s_rom_address <= "100";
	  elsif (i_counter >= "000000" and i_counter < "000010")  then s_rom_address <= "100";
          elsif (i_counter >= "000010" and i_counter < "000111" ) then s_rom_address <= "100";
          elsif (i_counter >= "000111" and i_counter < "001100" ) then s_rom_address <= "011";
          elsif (i_counter >= "001100" and i_counter < "010001" ) then s_rom_address <= "010";
          elsif (i_counter >= "010001" and i_counter < "010110" ) then s_rom_address <= "001";
          elsif (i_counter >= "010110" and i_counter < "011011" ) then s_rom_address <= "000";
          else s_rom_address <= "000";
          end if;
      end process;

      --Calcul de la sortie: sa valeur et son signe
      process(i_hclk, i_rstn)
        variable v_data         : std_logic_vector(3 downto 0);
        variable v_sign_theo    : std_logic;
        variable v_sign_real    : std_logic;
        variable v_begin_generate : std_logic;
        begin
          if (i_hclk'event and i_hclk = '1') then
            if i_rstn = '0' then                            --Reset synchrone sur 0
              v_sign_theo := '1';
              v_sign_real := '0';
              v_data := "0000";
              v_begin_generate := '1';
              o_q <= "00000";
            else
              if i_counter = "011011" then                    --On change le signe théorique quand on arrive à l'étape 2 du compteur
                v_sign_theo := NOT v_sign_theo;             -- -> Etape 2 correspond à un nouveau bit pair donc une autre demi-période
                v_begin_generate := '0';
              end if;
              v_sign_real := v_sign_theo XOR i_i_odd;       --Signe réel en fonction du bit en entrée: 0 = identique au théorique, 1 = différent
              if v_sign_real = '1' then                     --Complément à 2 si signe négatif              
                v_data(0) := NOT s_rom_out(0);
                v_data(1) := NOT s_rom_out(1);
                v_data(2) := NOT s_rom_out(2);
                v_data(3) := NOT s_rom_out(3);
                v_data := v_data + "0001";
              else 
                v_data := s_rom_out;
              end if;
              if v_begin_generate = '0' then                --On ne genere qu'a partir du troisieme cycle du compteur
                o_q(4) <= v_sign_real;                      --Affectation du bit de signe de la sortie
                o_q(3 downto 0) <= v_data;                  --Affectation de la data en sortie
              else
                o_q <= "00000";
              end if;
            end if;
          end if;
        end process;
end a;
