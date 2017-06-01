library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



Entity Etage is
generic ( k      : integer ; --Correspond au k ième étage pipeline
	  N_bit	 : integer ; -- Correspond au nombre de bit sur lequel sont codés les signaux entrées/sortis
	  Alpha  : integer   -- Correspond à l'angle de l'étage * 4
	);


port (	I        : in  std_logic_vector (N_bit-1 downto 0);
	Q        : in  std_logic_vector (N_bit-1 downto 0);
	Phase_in : in  std_logic_vector (8 downto 0);
	c1_in, c2_in	 : in std_logic;
	c1_out, c2_out	 : out std_logic;
	I_out    : out std_logic_vector (N_bit-1 downto 0);
	Q_out    : out std_logic_vector (N_bit-1 downto 0);
	Phase_out: out std_logic_vector (8 downto 0)
     );
end Etage;



Architecture Arch_etage of Etage is 

signal I_signed 	: signed (N_bit downto 0);
signal Q_signed 	: signed (N_bit downto 0);
signal Phase_in_signed  : signed (8 downto 0);
signal Phase_out_signed : signed (8 downto 0);
signal tout_zero 	: signed (N_bit downto 0); -- Sert à l'égalisation Q_signed = tout_zero
signal alpha_in		: signed (8 downto 0);

signal I_out_signed : signed (N_bit downto 0);
signal Q_out_signed : signed (N_bit downto 0);

begin
-- Conversion en Signed
I_signed <= signed (I(N_bit-1) & I);
Q_signed <= signed (Q(N_bit-1) & Q);

Phase_in_signed <= signed (Phase_in);

alpha_in <= to_signed (alpha, 9);
tout_zero <= (others => '0') ;



process_interne : process (I_signed, Q_signed, Phase_in_signed)

begin

	if Q_signed(N_bit) = '1' then  -- Angle négatif
		Q_out_signed <= Q_signed + (I_signed srl k);
		I_out_signed <= I_signed - (Q_signed srl k);
		Phase_out_signed <= (Phase_in_signed - alpha_in);
	
	else			-- angle positif ou nul
	
		if (Q_signed = tout_zero) then -- angle nul
			Q_out_signed <= Q_signed; --On garde les mêmes valeurs pour I, Q et Phase_out
			I_out_signed <= I_signed;
			Phase_out_signed <= Phase_in_signed;
	
		else			-- Angle positif
			Q_out_signed <= Q_signed - (I_signed srl k);
			I_out_signed <= I_signed + (Q_signed srl k);
			Phase_out_signed <= (Phase_in_signed + alpha_in);				
	
		end if;
	
	end if;

end process process_interne ;

c1_out <= c1_in;
c2_out <= c2_in;

Q_out <= std_logic_vector (Q_out_signed(N_bit downto 1)) ;
I_out <= std_logic_vector (I_out_signed(N_bit downto 1)) ;
Phase_out <= std_logic_vector (Phase_out_signed);

end Arch_etage;



 
