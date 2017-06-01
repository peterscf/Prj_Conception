--https://www.hdlworks.com/hdl_corner/vhdl_ref/VHDLContents/TEXTIOPackage.htm
library IEEE ;
use IEEE.std_logic_1164.ALL ;
--use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use std.textio.all;
library lib_VHD ;
use lib_VHD.CORDIC_top;


entity test_TOP is end test_TOP;

architecture test1 of test_TOP is
--Test fonctionel !!!
	component CORDIC_top is
	generic (Nb: integer);
	port( 	clk  : in std_logic;
		reset_n  : in std_logic;
	  	X  : in  std_logic_vector(7 downto 0);
		Y  : in  std_logic_vector(7 downto 0);
		Z  : out std_logic_vector(7 downto 0));
	end component;


signal sig_clk : std_logic := '0';
signal sig_resetn : std_logic := '0';
signal sig_x_in: std_logic_vector(7 downto 0);
signal sig_y_in:  std_logic_vector(7 downto 0); 
signal sig_z_out:  std_logic_vector(7 downto 0);
signal i: integer := 0;

type     tab_x is array (0 to 179) of std_logic_vector(7 downto 0);
type     tab_y is array (0 to 179) of std_logic_vector(7 downto 0);
constant in_x : tab_x := (0=>X"00",	1=>X"02",	2=>X"04",	3=>X"06",	4=>X"08",	5=>X"0B",	6=>X"0D",	7=>X"0F",	8=>X"11",	9=>X"14",	10=>X"16",	11=>X"18",	12=>X"1A",	13=>X"1C",	14=>X"1E",	15=>X"21",	16=>X"23",	17=>X"25",	18=>X"27",	19=>X"29",	20=>X"2B",	21=>X"2D",	22=>X"2F",	23=>X"32",	24=>X"34",	25=>X"36",	26=>X"38",	27=>X"3A",	28=>X"3C",	29=>X"3E",	30=>X"40",	31=>X"41",	32=>X"43",	33=>X"45",	34=>X"47",	35=>X"49",	36=>X"4B",	37=>X"4D",	38=>X"4E",	39=>X"50",	40=>X"52",	41=>X"53",	42=>X"55",	43=>X"57",	44=>X"58",	45=>X"5A",	46=>X"5C",	47=>X"5D",	48=>X"5F",	49=>X"60",	50=>X"62",	51=>X"63",	52=>X"64",	53=>X"66",	54=>X"67",	55=>X"68",	56=>X"6A",	57=>X"6B",	58=>X"6C",	59=>X"6D",	60=>X"6E",	61=>X"6F",	62=>X"71",	63=>X"72",	64=>X"73",	65=>X"74",	66=>X"74",	67=>X"75",	68=>X"76",	69=>X"77",	70=>X"78",	71=>X"79",	72=>X"79",	73=>X"7A",	74=>X"7B",	75=>X"7B",	76=>X"7C",	77=>X"7C",	78=>X"7D",	79=>X"7D",	80=>X"7E",	81=>X"7E",	82=>X"7E",	83=>X"7F",	84=>X"7F",	85=>X"7F",	86=>X"7F",	87=>X"7F",	88=>X"7F",	89=>X"7F",	90=>X"80",	91=>X"7F",	92=>X"7F",	93=>X"7F",	94=>X"7F",	95=>X"7F",	96=>X"7F",	97=>X"7F",	98=>X"7E",	99=>X"7E",	100=>X"7E",	101=>X"7D",	102=>X"7D",	103=>X"7C",	104=>X"7C",	105=>X"7B",	106=>X"7B",	107=>X"7A",	108=>X"79",	109=>X"79",	110=>X"78",	111=>X"77",	112=>X"76",	113=>X"75",	114=>X"74",	115=>X"74",	116=>X"73",	117=>X"72",	118=>X"71",	119=>X"6F",	120=>X"6E",	121=>X"6D",	122=>X"6C",	123=>X"6B",	124=>X"6A",	125=>X"68",	126=>X"67",	127=>X"66",	128=>X"64",	129=>X"63",	130=>X"62",	131=>X"60",	132=>X"5F",	133=>X"5D",	134=>X"5C",	135=>X"5A",	136=>X"58",	137=>X"57",	138=>X"55",	139=>X"53",	140=>X"52",	141=>X"50",	142=>X"4E",	143=>X"4D",	144=>X"4B",	145=>X"49",	146=>X"47",	147=>X"45",	148=>X"43",	149=>X"41",	150=>X"40",	151=>X"3E",	152=>X"3C",	153=>X"3A",	154=>X"38",	155=>X"36",	156=>X"34",	157=>X"32",	158=>X"2F",	159=>X"2D",	160=>X"2B",	161=>X"29",	162=>X"27",	163=>X"25",	164=>X"23",	165=>X"21",	166=>X"1E",	167=>X"1C",	168=>X"1A",	169=>X"18",	170=>X"16",	171=>X"14",	172=>X"11",	173=>X"0F",	174=>X"0D",	175=>X"0B",	176=>X"08",	177=>X"06",	178=>X"04",	179=>X"02");

constant in_y : tab_y := (0=>X"80",	1=>X"81",	2=>X"81",	3=>X"81",	4=>X"81",	5=>X"81",	6=>X"81",	7=>X"81",	8=>X"82",	9=>X"82",	10=>X"82",	11=>X"83",	12=>X"83",	13=>X"84",	14=>X"84",	15=>X"85",	16=>X"85",	17=>X"86",	18=>X"87",	19=>X"87",	20=>X"88",	21=>X"89",	22=>X"8A",	23=>X"8B",	24=>X"8C",	25=>X"8C",	26=>X"8D",	27=>X"8E",	28=>X"8F",	29=>X"91",	30=>X"92",	31=>X"93",	32=>X"94",	33=>X"95",	34=>X"96",	35=>X"98",	36=>X"99",	37=>X"9A",	38=>X"9C",	39=>X"9D",	40=>X"9E",	41=>X"A0",	42=>X"A1",	43=>X"A3",	44=>X"A4",	45=>X"A6",	46=>X"A8",	47=>X"A9",	48=>X"AB",	49=>X"AD",	50=>X"AE",	51=>X"B0",	52=>X"B2",	53=>X"B3",	54=>X"B5",	55=>X"B7",	56=>X"B9",	57=>X"BB",	58=>X"BD",	59=>X"BF",	60=>X"C1",	61=>X"C2",	62=>X"C4",	63=>X"C6",	64=>X"C8",	65=>X"CA",	66=>X"CC",	67=>X"CE",	68=>X"D1",	69=>X"D3",	70=>X"D5",	71=>X"D7",	72=>X"D9",	73=>X"DB",	74=>X"DD",	75=>X"DF",	76=>X"E2",	77=>X"E4",	78=>X"E6",	79=>X"E8",	80=>X"EA",	81=>X"EC",	82=>X"EF",	83=>X"F1",	84=>X"F3",	85=>X"F5",	86=>X"F8",	87=>X"FA",	88=>X"FC",	89=>X"FE",	90=>X"00",	91=>X"02",	92=>X"04",	93=>X"06",	94=>X"08",	95=>X"0B",	96=>X"0D",	97=>X"0F",	98=>X"11",	99=>X"14",	100=>X"16",	101=>X"18",	102=>X"1A",	103=>X"1C",	104=>X"1E",	105=>X"21",	106=>X"23",	107=>X"25",	108=>X"27",	109=>X"29",	110=>X"2B",	111=>X"2D",	112=>X"2F",	113=>X"32",	114=>X"34",	115=>X"36",	116=>X"38",	117=>X"3A",	118=>X"3C",	119=>X"3E",	120=>X"3F",	121=>X"41",	122=>X"43",	123=>X"45",	124=>X"47",	125=>X"49",	126=>X"4B",	127=>X"4D",	128=>X"4E",	129=>X"50",	130=>X"52",	131=>X"53",	132=>X"55",	133=>X"57",	134=>X"58",	135=>X"5A",	136=>X"5C",	137=>X"5D",	138=>X"5F",	139=>X"60",	140=>X"62",	141=>X"63",	142=>X"64",	143=>X"66",	144=>X"67",	145=>X"68",	146=>X"6A",	147=>X"6B",	148=>X"6C",	149=>X"6D",	150=>X"6E",	151=>X"6F",	152=>X"71",	153=>X"72",	154=>X"73",	155=>X"74",	156=>X"74",	157=>X"75",	158=>X"76",	159=>X"77",	160=>X"78",	161=>X"79",	162=>X"79",	163=>X"7A",	164=>X"7B",	165=>X"7B",	166=>X"7C",	167=>X"7C",	168=>X"7D",	169=>X"7D",	170=>X"7E",	171=>X"7E",	172=>X"7E",	173=>X"7F",	174=>X"7F",	175=>X"7F",	176=>X"7F",	177=>X"7F",	178=>X"7F",	179=>X"7F"); 

--signal period: natural;
begin
	C1: CORDIC_top
       	generic map(Nb=>8)	
	port map(sig_clk,sig_resetn,sig_x_in,sig_y_in,sig_z_out);
	sig_clk <= not(sig_clk) after  10 ns; --50Mhz
	sig_resetn <= '1' after 60 ns; 
	process 
   	begin	
		wait for 60 ns;
		while i<179 loop
			sig_x_in <= in_x(i);  
			sig_y_in <= in_y(i);  
			wait for 20 ns ;		
			i<=i+1;
		end loop;
		wait for 80 ns;

	end process; 
end test1;
