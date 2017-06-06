
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_CORDIC_top is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_CORDIC_top;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CORDIC_top.all;

entity CORDIC_top is

   port( clk, reset_n : in std_logic;  X, Y : in std_logic_vector (7 downto 0);
         Z : out std_logic_vector (7 downto 0));

end CORDIC_top;

architecture SYN_A of CORDIC_top is

   component OAI212
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI222
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI211
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND41
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI2111
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR40
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI221
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component XNR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component BUF2
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND22
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR31
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component DF3
      port( D, C : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component ADD32
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   component ADD22
      port( A, B : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal X1_7_port, X1_6_port, X1_5_port, X1_4_port, X1_3_port, X1_2_port, 
      X1_1_port, X1_0_port, Y1_7_port, Y1_6_port, Y1_5_port, Y1_4_port, 
      Y1_3_port, Y1_2_port, Y1_1_port, Y1_0_port, Z1_7_port, Z1_6_port, 
      Z1_5_port, Z1_4_port, Z1_3_port, Z1_2_port, Z1_1_port, X2_7_port, 
      X2_6_port, X2_5_port, X2_4_port, X2_3_port, X2_2_port, X2_1_port, 
      X2_0_port, Y2_7_port, Y2_6_port, Y2_5_port, Y2_4_port, Y2_3_port, 
      Y2_2_port, Y2_1_port, Y2_0_port, Z2_7_port, Z2_6_port, Z2_5_port, 
      Z2_4_port, Z2_3_port, Z2_2_port, Z2_1_port, X3_7_port, X3_6_port, 
      X3_5_port, X3_4_port, X3_3_port, X3_2_port, X3_1_port, X3_0_port, 
      Y3_7_port, Y3_6_port, Y3_5_port, Y3_4_port, Y3_3_port, Y3_2_port, 
      Y3_1_port, Y3_0_port, Z3_7_port, Z3_6_port, Z3_5_port, Z3_4_port, 
      Z3_3_port, Z3_2_port, Z3_1_port, Z3_0_port, X4_7_port, X4_6_port, 
      X4_5_port, X4_4_port, Y4_7_port, Y4_6_port, Y4_5_port, Y4_4_port, 
      Y4_3_port, Y4_2_port, Y4_1_port, Y4_0_port, Z4_7_port, Z4_6_port, 
      Z4_5_port, Z4_4_port, Z4_3_port, Z4_2_port, Z4_1_port, Z4_0_port, 
      Y5_7_port, Z5_7_port, Z5_6_port, Z5_5_port, Z5_4_port, Z5_3_port, 
      Z5_2_port, Z5_1_port, Z5_0_port, cell1_n63, cell1_n60, cell1_n59, 
      cell1_n58, cell1_n57, cell1_n56, cell1_n55, cell1_n54, cell1_n53, 
      cell1_n52, cell1_n51, cell1_n50, cell1_n49, cell1_n48, cell1_n47, 
      cell1_n46, cell1_n45, cell1_n44, cell1_n39, cell1_N68, cell1_N67, 
      cell1_N66, cell1_N65, cell1_N64, cell1_N63_port, cell1_N62, cell1_N61, 
      cell1_N52_port, cell1_N51_port, cell1_N50_port, cell1_N49_port, 
      cell1_N48_port, cell1_N47_port, cell1_N46_port, cell1_N45_port, 
      cell1_N44_port, cell1_N43, cell1_N42, cell1_N41, cell1_N40, 
      cell1_N39_port, cell1_N38, cell1_N37, cell2_n64, cell2_n63, cell2_n62, 
      cell2_n61, cell2_n60, cell2_n59, cell2_n58, cell2_n57, cell2_n56, 
      cell2_n55, cell2_n54, cell2_n53, cell2_n52, cell2_n51, cell2_n50, 
      cell2_n49, cell2_n48, cell2_n47, cell2_n46, cell2_n45, cell2_n44, 
      cell2_n43, cell2_n42, cell2_n41, cell2_n40, cell2_n39, cell2_N76, 
      cell2_N75, cell2_N74, cell2_N73, cell2_N72, cell2_N71, cell2_N70, 
      cell2_N69, cell2_N68, cell2_N67, cell2_N66, cell2_N65, cell2_N64_port, 
      cell2_N63_port, cell2_N62_port, cell2_N61_port, cell2_N60_port, 
      cell2_N59_port, cell2_N58_port, cell2_N57_port, cell2_N56_port, 
      cell2_N55_port, cell2_N53_port, cell2_N52_port, cell2_N51_port, 
      cell2_N50_port, cell2_N49_port, cell2_N48_port, cell2_N47_port, 
      cell2_N46_port, cell2_N45_port, cell2_N44_port, cell2_N43_port, 
      cell2_N42_port, cell2_N41_port, cell2_N40_port, cell2_N39_port, cell2_N38
      , cell2_N37, cell2_N36, cell2_N35, cell2_N34, cell2_N33, cell2_N32, 
      cell2_N31, cell3_n64, cell3_n63, cell3_n62, cell3_n61, cell3_n60, 
      cell3_n59, cell3_n58, cell3_n57, cell3_n56, cell3_n55, cell3_n54, 
      cell3_n53, cell3_n52, cell3_n51, cell3_n50, cell3_n49, cell3_n48, 
      cell3_n47, cell3_n46, cell3_n45, cell3_n44, cell3_n43, cell3_n42, 
      cell3_n40, cell3_n39, cell3_N76, cell3_N75, cell3_N74, cell3_N73, 
      cell3_N72, cell3_N71, cell3_N70, cell3_N69, cell3_N68, cell3_N67, 
      cell3_N66, cell3_N65, cell3_N64_port, cell3_N63_port, cell3_N62_port, 
      cell3_N61_port, cell3_N60_port, cell3_N59_port, cell3_N58_port, 
      cell3_N57_port, cell3_N56_port, cell3_N55_port, cell3_N53_port, 
      cell3_N52_port, cell3_N51_port, cell3_N50_port, cell3_N49_port, 
      cell3_N48_port, cell3_N47_port, cell3_N46_port, cell3_N45_port, 
      cell3_N44_port, cell3_N43_port, cell3_N42_port, cell3_N41, cell3_N40_port
      , cell3_N39_port, cell3_N38, cell3_N37, cell3_N36, cell3_N35, cell3_N34, 
      cell3_N33, cell3_N32, cell3_N31, cell4_n64, cell4_n63, cell4_n58, 
      cell4_n57, cell4_n56, cell4_n55, cell4_n54, cell4_n53, cell4_n52, 
      cell4_n51, cell4_n50, cell4_n49, cell4_n48, cell4_n47, cell4_n46, 
      cell4_n45, cell4_n44, cell4_n43, cell4_n42, cell4_n41, cell4_n40, 
      cell4_n39, cell4_N76, cell4_N75, cell4_N74, cell4_N73, cell4_N72, 
      cell4_N71, cell4_N70, cell4_N69, cell4_N68, cell4_N67, cell4_N66, 
      cell4_N65, cell4_N60, cell4_N59, cell4_N58_port, cell4_N57_port, 
      cell4_N56_port, cell4_N55_port, cell4_N54_port, cell4_N52_port, 
      cell4_N51_port, cell4_N50_port, cell4_N49_port, cell4_N48_port, 
      cell4_N47_port, cell4_N46_port, cell4_N45_port, cell4_N44_port, 
      cell4_N43_port, cell4_N42_port, cell4_N41_port, cell4_N36, cell4_N35, 
      cell4_N34, cell4_N33, cell4_N32, cell4_N31, cell4_N30, cell5_n64, 
      cell5_n63, cell5_n47, cell5_n46, cell5_n45, cell5_n44, cell5_n43, 
      cell5_n42, cell5_n41, cell5_n40, cell5_n39, cell5_N76, cell5_N60, 
      cell5_N59, cell5_N58, cell5_N57, cell5_N56, cell5_N55, cell5_N54, 
      cell5_N52, cell5_N36, cell5_N35, cell5_N34, cell5_N33, cell5_N32, 
      cell5_N31, cell5_N30, cell6_n60, cell6_n59, cell6_n42, cell6_n41, 
      cell6_n40, cell6_n39, cell6_n38, cell6_n37, cell6_n36, cell6_n35, 
      cell6_N60_port, cell6_N59_port, cell6_N58, cell6_N56, cell6_N55, 
      cell6_N54, cell6_N36_port, cell6_N35_port, cell6_N34, cell6_N33, 
      cell6_N32, cell6_N31, cell6_N30, cell6_add_64_carry_2_port, 
      cell6_add_64_carry_3_port, cell6_add_64_carry_4_port, 
      cell6_add_64_carry_5_port, cell6_add_64_carry_6_port, 
      cell6_add_64_carry_7_port, cell5_add_64_carry_2_port, 
      cell5_add_64_carry_3_port, cell5_add_64_carry_4_port, 
      cell5_add_64_carry_5_port, cell5_add_64_carry_6_port, 
      cell5_add_64_carry_7_port, cell5_sub_68_carry_2_port, 
      cell5_sub_68_carry_3_port, cell5_sub_68_carry_4_port, 
      cell5_sub_68_carry_5_port, cell5_sub_68_carry_6_port, 
      cell5_sub_68_carry_7_port, cell4_add_64_carry_2_port, 
      cell4_add_64_carry_3_port, cell4_add_64_carry_4_port, 
      cell4_add_64_carry_5_port, cell4_add_64_carry_6_port, 
      cell4_add_64_carry_7_port, cell4_add_65_carry_5_port, 
      cell4_add_65_carry_6_port, cell4_add_65_carry_7_port, 
      cell4_sub_66_carry_1_port, cell4_sub_66_carry_2_port, 
      cell4_sub_66_carry_3_port, cell4_sub_66_carry_4_port, 
      cell4_sub_66_carry_5_port, cell4_sub_66_carry_6_port, 
      cell4_sub_66_carry_7_port, cell4_sub_68_carry_2_port, 
      cell4_sub_68_carry_3_port, cell4_sub_68_carry_4_port, 
      cell4_sub_68_carry_5_port, cell4_sub_68_carry_6_port, 
      cell4_sub_68_carry_7_port, cell4_sub_69_carry_4_port, 
      cell4_sub_69_carry_5_port, cell4_sub_69_carry_6_port, 
      cell4_sub_69_carry_7_port, cell4_add_70_carry_1_port, 
      cell4_add_70_carry_2_port, cell4_add_70_carry_3_port, 
      cell4_add_70_carry_4_port, cell4_add_70_carry_5_port, 
      cell4_add_70_carry_6_port, cell4_add_70_carry_7_port, 
      cell3_add_64_carry_3_port, cell3_add_64_carry_4_port, 
      cell3_add_64_carry_5_port, cell3_add_64_carry_6_port, 
      cell3_add_64_carry_7_port, cell3_add_65_carry_1_port, 
      cell3_add_65_carry_2_port, cell3_add_65_carry_3_port, 
      cell3_add_65_carry_4_port, cell3_add_65_carry_5_port, 
      cell3_add_65_carry_6_port, cell3_add_65_carry_7_port, 
      cell3_sub_66_carry_1_port, cell3_sub_66_carry_2_port, 
      cell3_sub_66_carry_3_port, cell3_sub_66_carry_4_port, 
      cell3_sub_66_carry_5_port, cell3_sub_66_carry_6_port, 
      cell3_sub_66_carry_7_port, cell3_sub_68_carry_3_port, 
      cell3_sub_68_carry_4_port, cell3_sub_68_carry_5_port, 
      cell3_sub_68_carry_6_port, cell3_sub_68_carry_7_port, 
      cell3_sub_69_carry_1_port, cell3_sub_69_carry_2_port, 
      cell3_sub_69_carry_3_port, cell3_sub_69_carry_4_port, 
      cell3_sub_69_carry_5_port, cell3_sub_69_carry_6_port, 
      cell3_sub_69_carry_7_port, cell3_add_70_carry_1_port, 
      cell3_add_70_carry_2_port, cell3_add_70_carry_3_port, 
      cell3_add_70_carry_4_port, cell3_add_70_carry_5_port, 
      cell3_add_70_carry_6_port, cell3_add_70_carry_7_port, 
      cell2_add_64_carry_3_port, cell2_add_64_carry_4_port, 
      cell2_add_64_carry_5_port, cell2_add_64_carry_6_port, 
      cell2_add_64_carry_7_port, cell2_add_65_carry_1_port, 
      cell2_add_65_carry_2_port, cell2_add_65_carry_3_port, 
      cell2_add_65_carry_4_port, cell2_add_65_carry_5_port, 
      cell2_add_65_carry_6_port, cell2_add_65_carry_7_port, 
      cell2_sub_66_carry_1_port, cell2_sub_66_carry_2_port, 
      cell2_sub_66_carry_3_port, cell2_sub_66_carry_4_port, 
      cell2_sub_66_carry_5_port, cell2_sub_66_carry_6_port, 
      cell2_sub_66_carry_7_port, cell2_sub_68_carry_3_port, 
      cell2_sub_68_carry_4_port, cell2_sub_68_carry_5_port, 
      cell2_sub_68_carry_6_port, cell2_sub_68_carry_7_port, 
      cell2_sub_69_carry_1_port, cell2_sub_69_carry_2_port, 
      cell2_sub_69_carry_3_port, cell2_sub_69_carry_4_port, 
      cell2_sub_69_carry_5_port, cell2_sub_69_carry_6_port, 
      cell2_sub_69_carry_7_port, cell2_add_70_carry_1_port, 
      cell2_add_70_carry_2_port, cell2_add_70_carry_3_port, 
      cell2_add_70_carry_4_port, cell2_add_70_carry_5_port, 
      cell2_add_70_carry_6_port, cell2_add_70_carry_7_port, 
      cell1_r68_carry_1_port, cell1_r68_carry_2_port, cell1_r68_carry_3_port, 
      cell1_r68_carry_4_port, cell1_r68_carry_5_port, cell1_r68_carry_6_port, 
      cell1_r68_carry_7_port, cell1_sub_66_carry_1_port, 
      cell1_sub_66_carry_2_port, cell1_sub_66_carry_3_port, 
      cell1_sub_66_carry_4_port, cell1_sub_66_carry_5_port, 
      cell1_sub_66_carry_6_port, cell1_sub_66_carry_7_port, 
      cell1_sub_69_carry_1_port, cell1_sub_69_carry_2_port, 
      cell1_sub_69_carry_3_port, cell1_sub_69_carry_4_port, 
      cell1_sub_69_carry_5_port, cell1_sub_69_carry_6_port, 
      cell1_sub_69_carry_7_port, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, 
      n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26
      , n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, 
      n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55
      , n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, 
      n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84
      , n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, 
      n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, 
      n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, 
      n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, 
      n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, 
      n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, 
      n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, 
      n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, 
      n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, 
      n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, 
      n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, 
      n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, 
      n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, 
      n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, 
      n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, 
      n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, 
      n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, 
      n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, 
      n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, 
      n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, 
      n327, n328, n329, n330, n331, n_1000, n_1001, n_1002, n_1003, n_1004, 
      n_1005, n_1006, n_1007, n_1008, n_1009, n_1010, n_1011, n_1012, n_1013, 
      n_1014, n_1015, n_1016, n_1017, n_1018, n_1019, n_1020, n_1021, n_1022, 
      n_1023, n_1024, n_1025, n_1026, n_1027, n_1028, n_1029 : std_logic;

begin
   
   cell6_add_64_U1_1_1 : ADD22 port map( A => Z5_1_port, B => Z5_0_port, CO => 
                           cell6_add_64_carry_2_port, S => cell6_N30);
   cell6_add_64_U1_1_2 : ADD22 port map( A => Z5_2_port, B => 
                           cell6_add_64_carry_2_port, CO => 
                           cell6_add_64_carry_3_port, S => cell6_N31);
   cell6_add_64_U1_1_3 : ADD22 port map( A => Z5_3_port, B => 
                           cell6_add_64_carry_3_port, CO => 
                           cell6_add_64_carry_4_port, S => cell6_N32);
   cell6_add_64_U1_1_4 : ADD22 port map( A => Z5_4_port, B => 
                           cell6_add_64_carry_4_port, CO => 
                           cell6_add_64_carry_5_port, S => cell6_N33);
   cell6_add_64_U1_1_5 : ADD22 port map( A => Z5_5_port, B => 
                           cell6_add_64_carry_5_port, CO => 
                           cell6_add_64_carry_6_port, S => cell6_N34);
   cell6_add_64_U1_1_6 : ADD22 port map( A => Z5_6_port, B => 
                           cell6_add_64_carry_6_port, CO => 
                           cell6_add_64_carry_7_port, S => cell6_N35_port);
   cell4_add_65_U1_4 : ADD32 port map( A => X3_4_port, B => Y3_7_port, CI => 
                           n281, CO => cell4_add_65_carry_5_port, S => 
                           cell4_N41_port);
   cell4_sub_66_U2_1 : ADD32 port map( A => Y3_1_port, B => n21, CI => 
                           cell4_sub_66_carry_1_port, CO => 
                           cell4_sub_66_carry_2_port, S => cell4_N46_port);
   cell4_sub_66_U2_2 : ADD32 port map( A => Y3_2_port, B => n47, CI => 
                           cell4_sub_66_carry_2_port, CO => 
                           cell4_sub_66_carry_3_port, S => cell4_N47_port);
   cell4_sub_66_U2_3 : ADD32 port map( A => Y3_3_port, B => n71, CI => 
                           cell4_sub_66_carry_3_port, CO => 
                           cell4_sub_66_carry_4_port, S => cell4_N48_port);
   cell4_sub_66_U2_4 : ADD32 port map( A => Y3_4_port, B => n44, CI => 
                           cell4_sub_66_carry_4_port, CO => 
                           cell4_sub_66_carry_5_port, S => cell4_N49_port);
   cell4_sub_69_U2_4 : ADD32 port map( A => X3_4_port, B => n38, CI => 
                           cell4_sub_69_carry_4_port, CO => 
                           cell4_sub_69_carry_5_port, S => cell4_N65);
   cell4_add_70_U1_1 : ADD32 port map( A => Y3_1_port, B => X3_4_port, CI => 
                           cell4_add_70_carry_1_port, CO => 
                           cell4_add_70_carry_2_port, S => cell4_N70);
   cell4_add_70_U1_2 : ADD32 port map( A => Y3_2_port, B => X3_5_port, CI => 
                           cell4_add_70_carry_2_port, CO => 
                           cell4_add_70_carry_3_port, S => cell4_N71);
   cell4_add_70_U1_3 : ADD32 port map( A => Y3_3_port, B => X3_6_port, CI => 
                           cell4_add_70_carry_3_port, CO => 
                           cell4_add_70_carry_4_port, S => cell4_N72);
   cell4_add_70_U1_4 : ADD32 port map( A => Y3_4_port, B => X3_7_port, CI => 
                           cell4_add_70_carry_4_port, CO => 
                           cell4_add_70_carry_5_port, S => cell4_N73);
   cell3_add_65_U1_1 : ADD32 port map( A => X2_1_port, B => Y2_3_port, CI => 
                           cell3_add_65_carry_1_port, CO => 
                           cell3_add_65_carry_2_port, S => cell3_N38);
   cell3_add_65_U1_2 : ADD32 port map( A => X2_2_port, B => Y2_4_port, CI => 
                           cell3_add_65_carry_2_port, CO => 
                           cell3_add_65_carry_3_port, S => cell3_N39_port);
   cell3_add_65_U1_3 : ADD32 port map( A => X2_3_port, B => Y2_5_port, CI => 
                           cell3_add_65_carry_3_port, CO => 
                           cell3_add_65_carry_4_port, S => cell3_N40_port);
   cell3_add_65_U1_4 : ADD32 port map( A => X2_4_port, B => Y2_6_port, CI => 
                           cell3_add_65_carry_4_port, CO => 
                           cell3_add_65_carry_5_port, S => cell3_N41);
   cell3_add_65_U1_5 : ADD32 port map( A => X2_5_port, B => Y2_7_port, CI => 
                           cell3_add_65_carry_5_port, CO => 
                           cell3_add_65_carry_6_port, S => cell3_N42_port);
   cell3_sub_66_U2_1 : ADD32 port map( A => Y2_1_port, B => n20, CI => 
                           cell3_sub_66_carry_1_port, CO => 
                           cell3_sub_66_carry_2_port, S => cell3_N46_port);
   cell3_sub_66_U2_2 : ADD32 port map( A => Y2_2_port, B => n19, CI => 
                           cell3_sub_66_carry_2_port, CO => 
                           cell3_sub_66_carry_3_port, S => cell3_N47_port);
   cell3_sub_66_U2_3 : ADD32 port map( A => Y2_3_port, B => n18, CI => 
                           cell3_sub_66_carry_3_port, CO => 
                           cell3_sub_66_carry_4_port, S => cell3_N48_port);
   cell3_sub_66_U2_4 : ADD32 port map( A => Y2_4_port, B => n73, CI => 
                           cell3_sub_66_carry_4_port, CO => 
                           cell3_sub_66_carry_5_port, S => cell3_N49_port);
   cell3_sub_66_U2_5 : ADD32 port map( A => Y2_5_port, B => n43, CI => 
                           cell3_sub_66_carry_5_port, CO => 
                           cell3_sub_66_carry_6_port, S => cell3_N50_port);
   cell3_sub_69_U2_1 : ADD32 port map( A => X2_1_port, B => n17, CI => 
                           cell3_sub_69_carry_1_port, CO => 
                           cell3_sub_69_carry_2_port, S => cell3_N62_port);
   cell3_sub_69_U2_2 : ADD32 port map( A => X2_2_port, B => n16, CI => 
                           cell3_sub_69_carry_2_port, CO => 
                           cell3_sub_69_carry_3_port, S => cell3_N63_port);
   cell3_sub_69_U2_3 : ADD32 port map( A => X2_3_port, B => n15, CI => 
                           cell3_sub_69_carry_3_port, CO => 
                           cell3_sub_69_carry_4_port, S => cell3_N64_port);
   cell3_sub_69_U2_4 : ADD32 port map( A => X2_4_port, B => n72, CI => 
                           cell3_sub_69_carry_4_port, CO => 
                           cell3_sub_69_carry_5_port, S => cell3_N65);
   cell3_sub_69_U2_5 : ADD32 port map( A => X2_5_port, B => n37, CI => 
                           cell3_sub_69_carry_5_port, CO => 
                           cell3_sub_69_carry_6_port, S => cell3_N66);
   cell3_add_70_U1_1 : ADD32 port map( A => Y2_1_port, B => X2_3_port, CI => 
                           cell3_add_70_carry_1_port, CO => 
                           cell3_add_70_carry_2_port, S => cell3_N70);
   cell3_add_70_U1_2 : ADD32 port map( A => Y2_2_port, B => X2_4_port, CI => 
                           cell3_add_70_carry_2_port, CO => 
                           cell3_add_70_carry_3_port, S => cell3_N71);
   cell3_add_70_U1_3 : ADD32 port map( A => Y2_3_port, B => X2_5_port, CI => 
                           cell3_add_70_carry_3_port, CO => 
                           cell3_add_70_carry_4_port, S => cell3_N72);
   cell3_add_70_U1_4 : ADD32 port map( A => Y2_4_port, B => X2_6_port, CI => 
                           cell3_add_70_carry_4_port, CO => 
                           cell3_add_70_carry_5_port, S => cell3_N73);
   cell3_add_70_U1_5 : ADD32 port map( A => Y2_5_port, B => X2_7_port, CI => 
                           cell3_add_70_carry_5_port, CO => 
                           cell3_add_70_carry_6_port, S => cell3_N74);
   cell2_add_65_U1_1 : ADD32 port map( A => X1_1_port, B => Y1_2_port, CI => 
                           cell2_add_65_carry_1_port, CO => 
                           cell2_add_65_carry_2_port, S => cell2_N38);
   cell2_add_65_U1_2 : ADD32 port map( A => X1_2_port, B => Y1_3_port, CI => 
                           cell2_add_65_carry_2_port, CO => 
                           cell2_add_65_carry_3_port, S => cell2_N39_port);
   cell2_add_65_U1_3 : ADD32 port map( A => X1_3_port, B => Y1_4_port, CI => 
                           cell2_add_65_carry_3_port, CO => 
                           cell2_add_65_carry_4_port, S => cell2_N40_port);
   cell2_add_65_U1_4 : ADD32 port map( A => X1_4_port, B => Y1_5_port, CI => 
                           cell2_add_65_carry_4_port, CO => 
                           cell2_add_65_carry_5_port, S => cell2_N41_port);
   cell2_add_65_U1_5 : ADD32 port map( A => X1_5_port, B => Y1_6_port, CI => 
                           cell2_add_65_carry_5_port, CO => 
                           cell2_add_65_carry_6_port, S => cell2_N42_port);
   cell2_add_65_U1_6 : ADD32 port map( A => X1_6_port, B => Y1_7_port, CI => 
                           cell2_add_65_carry_6_port, CO => 
                           cell2_add_65_carry_7_port, S => cell2_N43_port);
   cell2_sub_66_U2_1 : ADD32 port map( A => Y1_1_port, B => n14, CI => 
                           cell2_sub_66_carry_1_port, CO => 
                           cell2_sub_66_carry_2_port, S => cell2_N46_port);
   cell2_sub_66_U2_2 : ADD32 port map( A => Y1_2_port, B => n13, CI => 
                           cell2_sub_66_carry_2_port, CO => 
                           cell2_sub_66_carry_3_port, S => cell2_N47_port);
   cell2_sub_66_U2_3 : ADD32 port map( A => Y1_3_port, B => n12, CI => 
                           cell2_sub_66_carry_3_port, CO => 
                           cell2_sub_66_carry_4_port, S => cell2_N48_port);
   cell2_sub_66_U2_4 : ADD32 port map( A => Y1_4_port, B => n42, CI => 
                           cell2_sub_66_carry_4_port, CO => 
                           cell2_sub_66_carry_5_port, S => cell2_N49_port);
   cell2_sub_66_U2_5 : ADD32 port map( A => Y1_5_port, B => n41, CI => 
                           cell2_sub_66_carry_5_port, CO => 
                           cell2_sub_66_carry_6_port, S => cell2_N50_port);
   cell2_sub_66_U2_6 : ADD32 port map( A => Y1_6_port, B => n63, CI => 
                           cell2_sub_66_carry_6_port, CO => 
                           cell2_sub_66_carry_7_port, S => cell2_N51_port);
   cell2_sub_69_U2_1 : ADD32 port map( A => X1_1_port, B => n11, CI => 
                           cell2_sub_69_carry_1_port, CO => 
                           cell2_sub_69_carry_2_port, S => cell2_N62_port);
   cell2_sub_69_U2_2 : ADD32 port map( A => X1_2_port, B => n10, CI => 
                           cell2_sub_69_carry_2_port, CO => 
                           cell2_sub_69_carry_3_port, S => cell2_N63_port);
   cell2_sub_69_U2_3 : ADD32 port map( A => X1_3_port, B => n9, CI => 
                           cell2_sub_69_carry_3_port, CO => 
                           cell2_sub_69_carry_4_port, S => cell2_N64_port);
   cell2_sub_69_U2_4 : ADD32 port map( A => X1_4_port, B => n40, CI => 
                           cell2_sub_69_carry_4_port, CO => 
                           cell2_sub_69_carry_5_port, S => cell2_N65);
   cell2_sub_69_U2_5 : ADD32 port map( A => X1_5_port, B => n39, CI => 
                           cell2_sub_69_carry_5_port, CO => 
                           cell2_sub_69_carry_6_port, S => cell2_N66);
   cell2_sub_69_U2_6 : ADD32 port map( A => X1_6_port, B => n36, CI => 
                           cell2_sub_69_carry_6_port, CO => 
                           cell2_sub_69_carry_7_port, S => cell2_N67);
   cell2_add_70_U1_1 : ADD32 port map( A => Y1_1_port, B => X1_2_port, CI => 
                           cell2_add_70_carry_1_port, CO => 
                           cell2_add_70_carry_2_port, S => cell2_N70);
   cell2_add_70_U1_2 : ADD32 port map( A => Y1_2_port, B => X1_3_port, CI => 
                           cell2_add_70_carry_2_port, CO => 
                           cell2_add_70_carry_3_port, S => cell2_N71);
   cell2_add_70_U1_3 : ADD32 port map( A => Y1_3_port, B => X1_4_port, CI => 
                           cell2_add_70_carry_3_port, CO => 
                           cell2_add_70_carry_4_port, S => cell2_N72);
   cell2_add_70_U1_4 : ADD32 port map( A => Y1_4_port, B => X1_5_port, CI => 
                           cell2_add_70_carry_4_port, CO => 
                           cell2_add_70_carry_5_port, S => cell2_N73);
   cell2_add_70_U1_5 : ADD32 port map( A => Y1_5_port, B => X1_6_port, CI => 
                           cell2_add_70_carry_5_port, CO => 
                           cell2_add_70_carry_6_port, S => cell2_N74);
   cell2_add_70_U1_6 : ADD32 port map( A => Y1_6_port, B => X1_7_port, CI => 
                           cell2_add_70_carry_6_port, CO => 
                           cell2_add_70_carry_7_port, S => cell2_N75);
   cell1_r68_U1_1 : ADD32 port map( A => X(1), B => Y(1), CI => 
                           cell1_r68_carry_1_port, CO => cell1_r68_carry_2_port
                           , S => cell1_N38);
   cell1_r68_U1_2 : ADD32 port map( A => X(2), B => Y(2), CI => 
                           cell1_r68_carry_2_port, CO => cell1_r68_carry_3_port
                           , S => cell1_N39_port);
   cell1_r68_U1_3 : ADD32 port map( A => X(3), B => Y(3), CI => 
                           cell1_r68_carry_3_port, CO => cell1_r68_carry_4_port
                           , S => cell1_N40);
   cell1_r68_U1_4 : ADD32 port map( A => X(4), B => Y(4), CI => 
                           cell1_r68_carry_4_port, CO => cell1_r68_carry_5_port
                           , S => cell1_N41);
   cell1_r68_U1_5 : ADD32 port map( A => X(5), B => Y(5), CI => 
                           cell1_r68_carry_5_port, CO => cell1_r68_carry_6_port
                           , S => cell1_N42);
   cell1_r68_U1_6 : ADD32 port map( A => X(6), B => Y(6), CI => 
                           cell1_r68_carry_6_port, CO => cell1_r68_carry_7_port
                           , S => cell1_N43);
   cell1_r68_U1_7 : ADD32 port map( A => X(7), B => Y(7), CI => 
                           cell1_r68_carry_7_port, CO => n_1000, S => 
                           cell1_N44_port);
   cell1_sub_66_U2_1 : ADD32 port map( A => Y(1), B => n269, CI => 
                           cell1_sub_66_carry_1_port, CO => 
                           cell1_sub_66_carry_2_port, S => cell1_N46_port);
   cell1_sub_66_U2_2 : ADD32 port map( A => Y(2), B => n268, CI => 
                           cell1_sub_66_carry_2_port, CO => 
                           cell1_sub_66_carry_3_port, S => cell1_N47_port);
   cell1_sub_66_U2_3 : ADD32 port map( A => Y(3), B => n267, CI => 
                           cell1_sub_66_carry_3_port, CO => 
                           cell1_sub_66_carry_4_port, S => cell1_N48_port);
   cell1_sub_66_U2_4 : ADD32 port map( A => Y(4), B => n266, CI => 
                           cell1_sub_66_carry_4_port, CO => 
                           cell1_sub_66_carry_5_port, S => cell1_N49_port);
   cell1_sub_66_U2_5 : ADD32 port map( A => Y(5), B => n265, CI => 
                           cell1_sub_66_carry_5_port, CO => 
                           cell1_sub_66_carry_6_port, S => cell1_N50_port);
   cell1_sub_66_U2_6 : ADD32 port map( A => Y(6), B => n264, CI => 
                           cell1_sub_66_carry_6_port, CO => 
                           cell1_sub_66_carry_7_port, S => cell1_N51_port);
   cell1_sub_69_U2_1 : ADD32 port map( A => X(1), B => n276, CI => 
                           cell1_sub_69_carry_1_port, CO => 
                           cell1_sub_69_carry_2_port, S => cell1_N62);
   cell1_sub_69_U2_2 : ADD32 port map( A => X(2), B => n275, CI => 
                           cell1_sub_69_carry_2_port, CO => 
                           cell1_sub_69_carry_3_port, S => cell1_N63_port);
   cell1_sub_69_U2_3 : ADD32 port map( A => X(3), B => n274, CI => 
                           cell1_sub_69_carry_3_port, CO => 
                           cell1_sub_69_carry_4_port, S => cell1_N64);
   cell1_sub_69_U2_4 : ADD32 port map( A => X(4), B => n273, CI => 
                           cell1_sub_69_carry_4_port, CO => 
                           cell1_sub_69_carry_5_port, S => cell1_N65);
   cell1_sub_69_U2_5 : ADD32 port map( A => X(5), B => n272, CI => 
                           cell1_sub_69_carry_5_port, CO => 
                           cell1_sub_69_carry_6_port, S => cell1_N66);
   cell1_sub_69_U2_6 : ADD32 port map( A => X(6), B => n271, CI => 
                           cell1_sub_69_carry_6_port, CO => 
                           cell1_sub_69_carry_7_port, S => cell1_N67);
   cell1_x_out_reg_0_inst : DF3 port map( D => n245, C => clk, Q => X1_0_port, 
                           QN => n27);
   cell1_x_out_reg_1_inst : DF3 port map( D => n246, C => clk, Q => X1_1_port, 
                           QN => n4);
   cell1_x_out_reg_2_inst : DF3 port map( D => n247, C => clk, Q => X1_2_port, 
                           QN => n14);
   cell1_x_out_reg_3_inst : DF3 port map( D => n248, C => clk, Q => X1_3_port, 
                           QN => n13);
   cell1_x_out_reg_4_inst : DF3 port map( D => n249, C => clk, Q => X1_4_port, 
                           QN => n12);
   cell1_x_out_reg_5_inst : DF3 port map( D => n250, C => clk, Q => X1_5_port, 
                           QN => n42);
   cell1_x_out_reg_6_inst : DF3 port map( D => n251, C => clk, Q => X1_6_port, 
                           QN => n41);
   cell1_x_out_reg_7_inst : DF3 port map( D => n252, C => clk, Q => X1_7_port, 
                           QN => n63);
   cell1_z_out_reg_0_inst : DF3 port map( D => n244, C => clk, Q => 
                           cell2_N53_port, QN => n_1001);
   cell1_z_out_reg_1_inst : DF3 port map( D => n262, C => clk, Q => Z1_1_port, 
                           QN => n66);
   cell1_z_out_reg_2_inst : DF3 port map( D => n157, C => clk, Q => Z1_2_port, 
                           QN => n31);
   cell1_z_out_reg_3_inst : DF3 port map( D => n158, C => clk, Q => Z1_3_port, 
                           QN => n51);
   cell1_z_out_reg_4_inst : DF3 port map( D => n262, C => clk, Q => Z1_4_port, 
                           QN => n58);
   cell1_z_out_reg_5_inst : DF3 port map( D => cell1_n39, C => clk, Q => 
                           Z1_5_port, QN => n50);
   cell1_z_out_reg_6_inst : DF3 port map( D => n262, C => clk, Q => Z1_6_port, 
                           QN => n78);
   cell1_z_out_reg_7_inst : DF3 port map( D => n262, C => clk, Q => Z1_7_port, 
                           QN => n_1002);
   cell1_y_out_reg_0_inst : DF3 port map( D => n253, C => clk, Q => Y1_0_port, 
                           QN => n26);
   cell1_y_out_reg_1_inst : DF3 port map( D => n254, C => clk, Q => Y1_1_port, 
                           QN => n5);
   cell1_y_out_reg_2_inst : DF3 port map( D => n255, C => clk, Q => Y1_2_port, 
                           QN => n11);
   cell1_y_out_reg_3_inst : DF3 port map( D => n256, C => clk, Q => Y1_3_port, 
                           QN => n10);
   cell1_y_out_reg_4_inst : DF3 port map( D => n257, C => clk, Q => Y1_4_port, 
                           QN => n9);
   cell1_y_out_reg_5_inst : DF3 port map( D => n258, C => clk, Q => Y1_5_port, 
                           QN => n40);
   cell1_y_out_reg_6_inst : DF3 port map( D => n259, C => clk, Q => Y1_6_port, 
                           QN => n39);
   cell1_y_out_reg_7_inst : DF3 port map( D => n260, C => clk, Q => Y1_7_port, 
                           QN => n36);
   cell2_x_out_reg_0_inst : DF3 port map( D => n222, C => clk, Q => X2_0_port, 
                           QN => n29);
   cell2_x_out_reg_1_inst : DF3 port map( D => n223, C => clk, Q => X2_1_port, 
                           QN => n_1003);
   cell2_x_out_reg_2_inst : DF3 port map( D => n224, C => clk, Q => X2_2_port, 
                           QN => n6);
   cell2_x_out_reg_3_inst : DF3 port map( D => n225, C => clk, Q => X2_3_port, 
                           QN => n20);
   cell2_x_out_reg_4_inst : DF3 port map( D => n226, C => clk, Q => X2_4_port, 
                           QN => n19);
   cell2_x_out_reg_5_inst : DF3 port map( D => n227, C => clk, Q => X2_5_port, 
                           QN => n18);
   cell2_x_out_reg_6_inst : DF3 port map( D => n228, C => clk, Q => X2_6_port, 
                           QN => n73);
   cell2_x_out_reg_7_inst : DF3 port map( D => n229, C => clk, Q => X2_7_port, 
                           QN => n43);
   cell2_z_out_reg_0_inst : DF3 port map( D => n238, C => clk, Q => 
                           cell3_N53_port, QN => n_1004);
   cell2_z_out_reg_1_inst : DF3 port map( D => n239, C => clk, Q => Z2_1_port, 
                           QN => n65);
   cell2_z_out_reg_2_inst : DF3 port map( D => n240, C => clk, Q => Z2_2_port, 
                           QN => n33);
   cell2_z_out_reg_3_inst : DF3 port map( D => n241, C => clk, Q => Z2_3_port, 
                           QN => n52);
   cell2_z_out_reg_4_inst : DF3 port map( D => n242, C => clk, Q => Z2_4_port, 
                           QN => n60);
   cell2_z_out_reg_5_inst : DF3 port map( D => n243, C => clk, Q => Z2_5_port, 
                           QN => n57);
   cell2_z_out_reg_6_inst : DF3 port map( D => n220, C => clk, Q => Z2_6_port, 
                           QN => n77);
   cell2_z_out_reg_7_inst : DF3 port map( D => n221, C => clk, Q => Z2_7_port, 
                           QN => n_1005);
   cell2_y_out_reg_0_inst : DF3 port map( D => n230, C => clk, Q => Y2_0_port, 
                           QN => n28);
   cell2_y_out_reg_1_inst : DF3 port map( D => n231, C => clk, Q => Y2_1_port, 
                           QN => n_1006);
   cell2_y_out_reg_2_inst : DF3 port map( D => n232, C => clk, Q => Y2_2_port, 
                           QN => n7);
   cell2_y_out_reg_3_inst : DF3 port map( D => n233, C => clk, Q => Y2_3_port, 
                           QN => n17);
   cell2_y_out_reg_4_inst : DF3 port map( D => n234, C => clk, Q => Y2_4_port, 
                           QN => n16);
   cell2_y_out_reg_5_inst : DF3 port map( D => n235, C => clk, Q => Y2_5_port, 
                           QN => n15);
   cell2_y_out_reg_6_inst : DF3 port map( D => n236, C => clk, Q => Y2_6_port, 
                           QN => n72);
   cell2_y_out_reg_7_inst : DF3 port map( D => n237, C => clk, Q => Y2_7_port, 
                           QN => n37);
   cell3_x_out_reg_0_inst : DF3 port map( D => n198, C => clk, Q => X3_0_port, 
                           QN => n_1007);
   cell3_x_out_reg_1_inst : DF3 port map( D => n199, C => clk, Q => X3_1_port, 
                           QN => n23);
   cell3_x_out_reg_2_inst : DF3 port map( D => n200, C => clk, Q => X3_2_port, 
                           QN => n22);
   cell3_x_out_reg_3_inst : DF3 port map( D => n201, C => clk, Q => X3_3_port, 
                           QN => n3);
   cell3_x_out_reg_4_inst : DF3 port map( D => n202, C => clk, Q => X3_4_port, 
                           QN => n21);
   cell3_x_out_reg_5_inst : DF3 port map( D => n203, C => clk, Q => X3_5_port, 
                           QN => n47);
   cell3_x_out_reg_6_inst : DF3 port map( D => n204, C => clk, Q => X3_6_port, 
                           QN => n71);
   cell3_x_out_reg_7_inst : DF3 port map( D => n205, C => clk, Q => X3_7_port, 
                           QN => n44);
   cell3_z_out_reg_0_inst : DF3 port map( D => n214, C => clk, Q => Z3_0_port, 
                           QN => n64);
   cell3_z_out_reg_1_inst : DF3 port map( D => n215, C => clk, Q => Z3_1_port, 
                           QN => n32);
   cell3_z_out_reg_2_inst : DF3 port map( D => n216, C => clk, Q => Z3_2_port, 
                           QN => n34);
   cell3_z_out_reg_3_inst : DF3 port map( D => n217, C => clk, Q => Z3_3_port, 
                           QN => n59);
   cell3_z_out_reg_4_inst : DF3 port map( D => n218, C => clk, Q => Z3_4_port, 
                           QN => n56);
   cell3_z_out_reg_5_inst : DF3 port map( D => n219, C => clk, Q => Z3_5_port, 
                           QN => n54);
   cell3_z_out_reg_6_inst : DF3 port map( D => n196, C => clk, Q => Z3_6_port, 
                           QN => n76);
   cell3_z_out_reg_7_inst : DF3 port map( D => n197, C => clk, Q => Z3_7_port, 
                           QN => n_1008);
   cell3_y_out_reg_0_inst : DF3 port map( D => n206, C => clk, Q => Y3_0_port, 
                           QN => n25);
   cell3_y_out_reg_1_inst : DF3 port map( D => n207, C => clk, Q => Y3_1_port, 
                           QN => n_1009);
   cell3_y_out_reg_2_inst : DF3 port map( D => n208, C => clk, Q => Y3_2_port, 
                           QN => n_1010);
   cell3_y_out_reg_3_inst : DF3 port map( D => n209, C => clk, Q => Y3_3_port, 
                           QN => n8);
   cell3_y_out_reg_4_inst : DF3 port map( D => n210, C => clk, Q => Y3_4_port, 
                           QN => n_1011);
   cell3_y_out_reg_5_inst : DF3 port map( D => n211, C => clk, Q => Y3_5_port, 
                           QN => n48);
   cell3_y_out_reg_6_inst : DF3 port map( D => n212, C => clk, Q => Y3_6_port, 
                           QN => n74);
   cell3_y_out_reg_7_inst : DF3 port map( D => n213, C => clk, Q => Y3_7_port, 
                           QN => n38);
   cell4_x_out_reg_4_inst : DF3 port map( D => n178, C => clk, Q => X4_4_port, 
                           QN => n35);
   cell4_x_out_reg_5_inst : DF3 port map( D => n179, C => clk, Q => X4_5_port, 
                           QN => n_1012);
   cell4_x_out_reg_6_inst : DF3 port map( D => n180, C => clk, Q => X4_6_port, 
                           QN => n61);
   cell4_x_out_reg_7_inst : DF3 port map( D => n181, C => clk, Q => X4_7_port, 
                           QN => n_1013);
   cell4_z_out_reg_0_inst : DF3 port map( D => n190, C => clk, Q => Z4_0_port, 
                           QN => n67);
   cell4_z_out_reg_1_inst : DF3 port map( D => n191, C => clk, Q => Z4_1_port, 
                           QN => n30);
   cell4_z_out_reg_2_inst : DF3 port map( D => n192, C => clk, Q => Z4_2_port, 
                           QN => n1);
   cell4_z_out_reg_3_inst : DF3 port map( D => n193, C => clk, Q => Z4_3_port, 
                           QN => n55);
   cell4_z_out_reg_4_inst : DF3 port map( D => n194, C => clk, Q => Z4_4_port, 
                           QN => n53);
   cell4_z_out_reg_5_inst : DF3 port map( D => n195, C => clk, Q => Z4_5_port, 
                           QN => n49);
   cell4_z_out_reg_6_inst : DF3 port map( D => n176, C => clk, Q => Z4_6_port, 
                           QN => n75);
   cell4_z_out_reg_7_inst : DF3 port map( D => n177, C => clk, Q => Z4_7_port, 
                           QN => n_1014);
   cell4_y_out_reg_0_inst : DF3 port map( D => n182, C => clk, Q => Y4_0_port, 
                           QN => n_1015);
   cell4_y_out_reg_1_inst : DF3 port map( D => n183, C => clk, Q => Y4_1_port, 
                           QN => n24);
   cell4_y_out_reg_2_inst : DF3 port map( D => n184, C => clk, Q => Y4_2_port, 
                           QN => n45);
   cell4_y_out_reg_3_inst : DF3 port map( D => n185, C => clk, Q => Y4_3_port, 
                           QN => n46);
   cell4_y_out_reg_4_inst : DF3 port map( D => n186, C => clk, Q => Y4_4_port, 
                           QN => n_1016);
   cell4_y_out_reg_5_inst : DF3 port map( D => n187, C => clk, Q => Y4_5_port, 
                           QN => n_1017);
   cell4_y_out_reg_6_inst : DF3 port map( D => n188, C => clk, Q => Y4_6_port, 
                           QN => n_1018);
   cell4_y_out_reg_7_inst : DF3 port map( D => n189, C => clk, Q => Y4_7_port, 
                           QN => n79);
   cell5_z_out_reg_0_inst : DF3 port map( D => n170, C => clk, Q => Z5_0_port, 
                           QN => n2);
   cell5_z_out_reg_1_inst : DF3 port map( D => n171, C => clk, Q => Z5_1_port, 
                           QN => n70);
   cell5_z_out_reg_2_inst : DF3 port map( D => n172, C => clk, Q => Z5_2_port, 
                           QN => n68);
   cell5_z_out_reg_3_inst : DF3 port map( D => n173, C => clk, Q => Z5_3_port, 
                           QN => n69);
   cell5_z_out_reg_4_inst : DF3 port map( D => n174, C => clk, Q => Z5_4_port, 
                           QN => n_1019);
   cell5_z_out_reg_5_inst : DF3 port map( D => n175, C => clk, Q => Z5_5_port, 
                           QN => n62);
   cell5_z_out_reg_6_inst : DF3 port map( D => n167, C => clk, Q => Z5_6_port, 
                           QN => n_1020);
   cell5_z_out_reg_7_inst : DF3 port map( D => n168, C => clk, Q => Z5_7_port, 
                           QN => n_1021);
   cell5_y_out_reg_7_inst : DF3 port map( D => n169, C => clk, Q => Y5_7_port, 
                           QN => n80);
   cell6_z_out_reg_0_inst : DF3 port map( D => n161, C => clk, Q => Z(0), QN =>
                           n_1022);
   cell6_z_out_reg_1_inst : DF3 port map( D => n162, C => clk, Q => Z(1), QN =>
                           n_1023);
   cell6_z_out_reg_2_inst : DF3 port map( D => n163, C => clk, Q => Z(2), QN =>
                           n_1024);
   cell6_z_out_reg_3_inst : DF3 port map( D => n164, C => clk, Q => Z(3), QN =>
                           n_1025);
   cell6_z_out_reg_4_inst : DF3 port map( D => n165, C => clk, Q => Z(4), QN =>
                           n_1026);
   cell6_z_out_reg_5_inst : DF3 port map( D => n166, C => clk, Q => Z(5), QN =>
                           n_1027);
   cell6_z_out_reg_6_inst : DF3 port map( D => n159, C => clk, Q => Z(6), QN =>
                           n_1028);
   cell6_z_out_reg_7_inst : DF3 port map( D => n160, C => clk, Q => Z(7), QN =>
                           n_1029);
   cell1_sub_69_U2_7 : XOR31 port map( A => X(7), B => n270, C => 
                           cell1_sub_69_carry_7_port, Q => cell1_N68);
   cell1_sub_66_U2_7 : XOR31 port map( A => Y(7), B => n263, C => 
                           cell1_sub_66_carry_7_port, Q => cell1_N52_port);
   U2 : INV3 port map( A => n143, Q => n145);
   U3 : INV3 port map( A => n143, Q => n144);
   U4 : INV3 port map( A => n147, Q => n149);
   U5 : INV3 port map( A => n147, Q => n148);
   U6 : INV3 port map( A => n143, Q => n146);
   U7 : INV3 port map( A => n147, Q => n150);
   U8 : INV3 port map( A => cell1_n46, Q => n259);
   U9 : AOI221 port map( A => n262, B => cell1_N43, C => cell1_n39, D => 
                           cell1_N51_port, Q => cell1_n46);
   U10 : INV3 port map( A => cell1_n47, Q => n258);
   U11 : AOI221 port map( A => n262, B => cell1_N42, C => n158, D => 
                           cell1_N50_port, Q => cell1_n47);
   U12 : INV3 port map( A => cell1_n48, Q => n257);
   U13 : AOI221 port map( A => n262, B => cell1_N41, C => n157, D => 
                           cell1_N49_port, Q => cell1_n48);
   U14 : INV3 port map( A => cell1_n54, Q => n251);
   U15 : AOI221 port map( A => n262, B => cell1_N67, C => n157, D => cell1_N43,
                           Q => cell1_n54);
   U16 : INV3 port map( A => cell1_n55, Q => n250);
   U17 : AOI221 port map( A => n262, B => cell1_N66, C => cell1_n39, D => 
                           cell1_N42, Q => cell1_n55);
   U18 : INV3 port map( A => cell1_n56, Q => n249);
   U19 : AOI221 port map( A => n262, B => cell1_N65, C => n158, D => cell1_N41,
                           Q => cell1_n56);
   U20 : BUF2 port map( A => cell4_n40, Q => n140);
   U21 : BUF2 port map( A => cell4_n40, Q => n139);
   U22 : INV3 port map( A => n151, Q => n152);
   U23 : INV3 port map( A => n155, Q => n156);
   U24 : INV3 port map( A => cell1_n49, Q => n256);
   U25 : AOI221 port map( A => n262, B => cell1_N40, C => cell1_n39, D => 
                           cell1_N48_port, Q => cell1_n49);
   U26 : INV3 port map( A => cell1_n50, Q => n255);
   U27 : AOI221 port map( A => n262, B => cell1_N39_port, C => n158, D => 
                           cell1_N47_port, Q => cell1_n50);
   U28 : INV3 port map( A => cell1_n57, Q => n248);
   U29 : AOI221 port map( A => n262, B => cell1_N64, C => n157, D => cell1_N40,
                           Q => cell1_n57);
   U30 : INV3 port map( A => cell1_n58, Q => n247);
   U31 : AOI221 port map( A => n262, B => cell1_N63_port, C => cell1_n39, D => 
                           cell1_N39_port, Q => cell1_n58);
   U32 : INV3 port map( A => cell1_n59, Q => n246);
   U33 : AOI221 port map( A => n262, B => cell1_N62, C => n158, D => cell1_N38,
                           Q => cell1_n59);
   U34 : INV3 port map( A => cell3_n52, Q => n208);
   U35 : AOI221 port map( A => cell3_N47_port, B => n152, C => cell3_N71, D => 
                           n144, Q => cell3_n52);
   U36 : INV3 port map( A => cell3_n60, Q => n200);
   U37 : AOI221 port map( A => cell3_N39_port, B => cell3_n40, C => 
                           cell3_N63_port, D => n150, Q => cell3_n60);
   U38 : INV3 port map( A => cell2_n53, Q => n231);
   U39 : AOI221 port map( A => cell2_N46_port, B => n156, C => cell2_N70, D => 
                           cell2_n41, Q => cell2_n53);
   U40 : INV3 port map( A => cell2_n61, Q => n223);
   U41 : AOI221 port map( A => cell2_N38, B => n156, C => cell2_N62_port, D => 
                           n153, Q => cell2_n61);
   U42 : INV3 port map( A => cell4_n58, Q => n178);
   U43 : AOI221 port map( A => cell4_N41_port, B => n139, C => cell4_N65, D => 
                           cell4_n41, Q => cell4_n58);
   U44 : INV3 port map( A => cell3_n49, Q => n211);
   U45 : AOI221 port map( A => cell3_N50_port, B => n152, C => cell3_N74, D => 
                           n148, Q => cell3_n49);
   U46 : INV3 port map( A => cell3_n50, Q => n210);
   U47 : AOI221 port map( A => cell3_N49_port, B => n152, C => cell3_N73, D => 
                           n146, Q => cell3_n50);
   U48 : INV3 port map( A => cell3_n51, Q => n209);
   U49 : AOI221 port map( A => cell3_N48_port, B => cell3_n40, C => cell3_N72, 
                           D => n145, Q => cell3_n51);
   U50 : INV3 port map( A => cell3_n57, Q => n203);
   U51 : AOI221 port map( A => cell3_N42_port, B => cell3_n40, C => cell3_N66, 
                           D => n145, Q => cell3_n57);
   U52 : INV3 port map( A => cell3_n58, Q => n202);
   U53 : AOI221 port map( A => cell3_N41, B => n152, C => cell3_N65, D => n144,
                           Q => cell3_n58);
   U54 : INV3 port map( A => cell3_n59, Q => n201);
   U55 : AOI221 port map( A => cell3_N40_port, B => n152, C => cell3_N64_port, 
                           D => n149, Q => cell3_n59);
   U56 : INV3 port map( A => cell2_n48, Q => n236);
   U57 : AOI221 port map( A => cell2_N51_port, B => cell2_n40, C => cell2_N75, 
                           D => n154, Q => cell2_n48);
   U58 : INV3 port map( A => cell2_n49, Q => n235);
   U59 : AOI221 port map( A => cell2_N50_port, B => n156, C => cell2_N74, D => 
                           n153, Q => cell2_n49);
   U60 : INV3 port map( A => cell2_n50, Q => n234);
   U61 : AOI221 port map( A => cell2_N49_port, B => n156, C => cell2_N73, D => 
                           cell2_n41, Q => cell2_n50);
   U62 : INV3 port map( A => cell2_n51, Q => n233);
   U63 : AOI221 port map( A => cell2_N48_port, B => cell2_n40, C => cell2_N72, 
                           D => n154, Q => cell2_n51);
   U64 : INV3 port map( A => cell2_n52, Q => n232);
   U65 : AOI221 port map( A => cell2_N47_port, B => n156, C => cell2_N71, D => 
                           n153, Q => cell2_n52);
   U66 : INV3 port map( A => cell2_n56, Q => n228);
   U67 : AOI221 port map( A => cell2_N43_port, B => n156, C => cell2_N67, D => 
                           cell2_n41, Q => cell2_n56);
   U68 : INV3 port map( A => cell2_n57, Q => n227);
   U69 : AOI221 port map( A => cell2_N42_port, B => cell2_n40, C => cell2_N66, 
                           D => n154, Q => cell2_n57);
   U70 : INV3 port map( A => cell2_n58, Q => n226);
   U71 : AOI221 port map( A => cell2_N41_port, B => n156, C => cell2_N65, D => 
                           n153, Q => cell2_n58);
   U72 : INV3 port map( A => cell2_n59, Q => n225);
   U73 : AOI221 port map( A => cell2_N40_port, B => n156, C => cell2_N64_port, 
                           D => cell2_n41, Q => cell2_n59);
   U74 : INV3 port map( A => cell2_n60, Q => n224);
   U75 : AOI221 port map( A => cell2_N39_port, B => cell2_n40, C => 
                           cell2_N63_port, D => n154, Q => cell2_n60);
   U76 : INV3 port map( A => cell4_n50, Q => n186);
   U77 : AOI221 port map( A => cell4_N49_port, B => n139, C => cell4_N73, D => 
                           n138, Q => cell4_n50);
   U78 : INV3 port map( A => cell4_n51, Q => n185);
   U79 : AOI221 port map( A => cell4_N48_port, B => n140, C => cell4_N72, D => 
                           n137, Q => cell4_n51);
   U80 : INV3 port map( A => cell4_n52, Q => n184);
   U81 : AOI221 port map( A => cell4_N47_port, B => n139, C => cell4_N71, D => 
                           cell4_n41, Q => cell4_n52);
   U82 : INV3 port map( A => cell4_n53, Q => n183);
   U83 : AOI221 port map( A => cell4_N46_port, B => n140, C => cell4_N70, D => 
                           n138, Q => cell4_n53);
   U84 : INV3 port map( A => cell3_n53, Q => n207);
   U85 : AOI221 port map( A => cell3_N46_port, B => n152, C => cell3_N70, D => 
                           n150, Q => cell3_n53);
   U86 : INV3 port map( A => cell3_n61, Q => n199);
   U87 : AOI221 port map( A => cell3_N38, B => n152, C => cell3_N62_port, D => 
                           n148, Q => cell3_n61);
   U88 : NOR21 port map( A => n36, B => n261, Q => n154);
   U89 : NOR21 port map( A => n36, B => n261, Q => n153);
   U90 : NOR21 port map( A => n36, B => n261, Q => cell2_n41);
   U91 : NOR21 port map( A => n38, B => n261, Q => n138);
   U92 : NOR21 port map( A => n38, B => n261, Q => n137);
   U93 : NOR21 port map( A => n38, B => n261, Q => cell4_n41);
   U94 : INV3 port map( A => n142, Q => n147);
   U95 : NOR21 port map( A => n37, B => n261, Q => n142);
   U96 : INV3 port map( A => n141, Q => n143);
   U97 : NOR21 port map( A => n37, B => n261, Q => n141);
   U98 : INV3 port map( A => cell6_n35, Q => n166);
   U99 : AOI221 port map( A => cell6_N34, B => cell6_n36, C => cell6_N58, D => 
                           cell6_n37, Q => cell6_n35);
   U100 : INV3 port map( A => cell6_n42, Q => n161);
   U101 : AOI221 port map( A => n2, B => cell6_n36, C => n2, D => cell6_n37, Q 
                           => cell6_n42);
   U102 : INV3 port map( A => cell1_n51, Q => n254);
   U103 : AOI221 port map( A => n262, B => cell1_N38, C => n157, D => 
                           cell1_N46_port, Q => cell1_n51);
   U104 : INV3 port map( A => cell1_n44, Q => n244);
   U105 : NOR21 port map( A => n158, B => n262, Q => cell1_n44);
   U106 : NAND22 port map( A => n329, B => n62, Q => n330);
   U107 : INV3 port map( A => n325, Q => n297);
   U108 : INV3 port map( A => n327, Q => n296);
   U109 : INV3 port map( A => X(4), Q => n266);
   U110 : INV3 port map( A => Y(4), Q => n273);
   U111 : INV3 port map( A => X(5), Q => n265);
   U112 : INV3 port map( A => Y(5), Q => n272);
   U113 : INV3 port map( A => X(6), Q => n264);
   U114 : INV3 port map( A => Y(6), Q => n271);
   U115 : INV3 port map( A => X(3), Q => n267);
   U116 : INV3 port map( A => Y(3), Q => n274);
   U117 : INV3 port map( A => X(2), Q => n268);
   U118 : INV3 port map( A => Y(2), Q => n275);
   U119 : INV3 port map( A => Y(1), Q => n276);
   U120 : INV3 port map( A => n115, Q => cell1_sub_69_carry_1_port);
   U121 : NOR21 port map( A => n277, B => X(0), Q => n115);
   U122 : NOR21 port map( A => n277, B => n135, Q => cell1_r68_carry_1_port);
   U123 : INV3 port map( A => X(0), Q => n135);
   U124 : INV3 port map( A => Y(0), Q => n277);
   U125 : INV3 port map( A => X(1), Q => n269);
   U126 : INV3 port map( A => n114, Q => cell1_sub_66_carry_1_port);
   U127 : NOR21 port map( A => n135, B => Y(0), Q => n114);
   U128 : INV3 port map( A => cell1_n45, Q => n260);
   U129 : AOI221 port map( A => n262, B => cell1_N44_port, C => n157, D => 
                           cell1_N52_port, Q => cell1_n45);
   U130 : INV3 port map( A => X(7), Q => n263);
   U131 : INV3 port map( A => cell1_n53, Q => n252);
   U132 : AOI221 port map( A => n262, B => cell1_N68, C => n158, D => 
                           cell1_N44_port, Q => cell1_n53);
   U133 : INV3 port map( A => Y(7), Q => n270);
   U134 : INV3 port map( A => reset_n, Q => n261);
   U135 : NOR21 port map( A => n261, B => Y3_7_port, Q => cell4_n40);
   U136 : INV3 port map( A => cell3_n40, Q => n151);
   U137 : NOR21 port map( A => n261, B => Y2_7_port, Q => cell3_n40);
   U138 : INV3 port map( A => cell2_n40, Q => n155);
   U139 : NOR21 port map( A => n261, B => Y1_7_port, Q => cell2_n40);
   U140 : INV3 port map( A => cell4_n56, Q => n180);
   U141 : AOI221 port map( A => cell4_N43_port, B => n139, C => cell4_N67, D =>
                           n138, Q => cell4_n56);
   U142 : XNR21 port map( A => X3_6_port, B => cell4_sub_69_carry_6_port, Q => 
                           cell4_N67);
   U143 : XOR21 port map( A => X3_6_port, B => cell4_add_65_carry_6_port, Q => 
                           cell4_N43_port);
   U144 : INV3 port map( A => cell4_n57, Q => n179);
   U145 : AOI221 port map( A => cell4_N42_port, B => n140, C => cell4_N66, D =>
                           n137, Q => cell4_n57);
   U146 : XNR21 port map( A => X3_5_port, B => cell4_sub_69_carry_5_port, Q => 
                           cell4_N66);
   U147 : XOR21 port map( A => X3_5_port, B => cell4_add_65_carry_5_port, Q => 
                           cell4_N42_port);
   U148 : INV3 port map( A => cell3_n56, Q => n204);
   U149 : AOI221 port map( A => cell3_N43_port, B => n152, C => cell3_N67, D =>
                           n146, Q => cell3_n56);
   U150 : XOR21 port map( A => X2_6_port, B => cell3_add_65_carry_6_port, Q => 
                           cell3_N43_port);
   U151 : XNR21 port map( A => X2_6_port, B => cell3_sub_69_carry_6_port, Q => 
                           cell3_N67);
   U152 : INV3 port map( A => cell4_n64, Q => n176);
   U153 : AOI221 port map( A => cell4_N35, B => n139, C => cell4_N59, D => n137
                           , Q => cell4_n64);
   U154 : XNR21 port map( A => Z3_6_port, B => cell4_sub_68_carry_6_port, Q => 
                           cell4_N59);
   U155 : XOR21 port map( A => Z3_6_port, B => cell4_add_64_carry_6_port, Q => 
                           cell4_N35);
   U156 : INV3 port map( A => cell4_n39, Q => n195);
   U157 : AOI221 port map( A => cell4_N34, B => n140, C => cell4_N58_port, D =>
                           n138, Q => cell4_n39);
   U158 : XNR21 port map( A => Z3_5_port, B => cell4_sub_68_carry_5_port, Q => 
                           cell4_N58_port);
   U159 : XOR21 port map( A => Z3_5_port, B => cell4_add_64_carry_5_port, Q => 
                           cell4_N34);
   U160 : INV3 port map( A => cell4_n42, Q => n194);
   U161 : AOI221 port map( A => cell4_N33, B => n139, C => cell4_N57_port, D =>
                           n137, Q => cell4_n42);
   U162 : XNR21 port map( A => Z3_4_port, B => cell4_sub_68_carry_4_port, Q => 
                           cell4_N57_port);
   U163 : XOR21 port map( A => Z3_4_port, B => cell4_add_64_carry_4_port, Q => 
                           cell4_N33);
   U164 : INV3 port map( A => cell4_n43, Q => n193);
   U165 : AOI221 port map( A => cell4_N32, B => n140, C => cell4_N56_port, D =>
                           cell4_n41, Q => cell4_n43);
   U166 : XNR21 port map( A => Z3_3_port, B => cell4_sub_68_carry_3_port, Q => 
                           cell4_N56_port);
   U167 : XOR21 port map( A => Z3_3_port, B => cell4_add_64_carry_3_port, Q => 
                           cell4_N32);
   U168 : INV3 port map( A => cell3_n64, Q => n196);
   U169 : AOI221 port map( A => cell3_N35, B => n152, C => cell3_N59_port, D =>
                           n144, Q => cell3_n64);
   U170 : XNR21 port map( A => Z2_6_port, B => cell3_sub_68_carry_6_port, Q => 
                           cell3_N59_port);
   U171 : XOR21 port map( A => Z2_6_port, B => cell3_add_64_carry_6_port, Q => 
                           cell3_N35);
   U172 : INV3 port map( A => cell3_n39, Q => n219);
   U173 : AOI221 port map( A => cell3_N34, B => n152, C => cell3_N58_port, D =>
                           n150, Q => cell3_n39);
   U174 : XNR21 port map( A => Z2_5_port, B => cell3_sub_68_carry_5_port, Q => 
                           cell3_N58_port);
   U175 : XOR21 port map( A => Z2_5_port, B => cell3_add_64_carry_5_port, Q => 
                           cell3_N34);
   U176 : INV3 port map( A => cell3_n42, Q => n218);
   U177 : AOI221 port map( A => cell3_N33, B => cell3_n40, C => cell3_N57_port,
                           D => n145, Q => cell3_n42);
   U178 : XNR21 port map( A => Z2_4_port, B => cell3_sub_68_carry_4_port, Q => 
                           cell3_N57_port);
   U179 : XOR21 port map( A => Z2_4_port, B => cell3_add_64_carry_4_port, Q => 
                           cell3_N33);
   U180 : INV3 port map( A => cell3_n62, Q => n198);
   U181 : AOI221 port map( A => cell3_N37, B => n152, C => cell3_N61_port, D =>
                           n146, Q => cell3_n62);
   U182 : XOR21 port map( A => X2_0_port, B => Y2_2_port, Q => cell3_N37);
   U183 : XNR21 port map( A => X2_0_port, B => n7, Q => cell3_N61_port);
   U184 : INV3 port map( A => cell2_n64, Q => n220);
   U185 : AOI221 port map( A => cell2_N35, B => n156, C => cell2_N59_port, D =>
                           n153, Q => cell2_n64);
   U186 : XNR21 port map( A => Z1_6_port, B => cell2_sub_68_carry_6_port, Q => 
                           cell2_N59_port);
   U187 : XOR21 port map( A => Z1_6_port, B => cell2_add_64_carry_6_port, Q => 
                           cell2_N35);
   U188 : INV3 port map( A => cell2_n39, Q => n243);
   U189 : AOI221 port map( A => cell2_N34, B => n156, C => cell2_N58_port, D =>
                           cell2_n41, Q => cell2_n39);
   U190 : XOR21 port map( A => Z1_5_port, B => cell2_add_64_carry_5_port, Q => 
                           cell2_N34);
   U191 : XNR21 port map( A => Z1_5_port, B => cell2_sub_68_carry_5_port, Q => 
                           cell2_N58_port);
   U192 : INV3 port map( A => cell2_n44, Q => n240);
   U193 : AOI221 port map( A => cell2_N31, B => n156, C => cell2_N55_port, D =>
                           cell2_n41, Q => cell2_n44);
   U194 : XNR21 port map( A => Z1_2_port, B => Z1_1_port, Q => cell2_N55_port);
   U195 : XOR21 port map( A => Z1_2_port, B => Z1_1_port, Q => cell2_N31);
   U196 : INV3 port map( A => cell2_n62, Q => n222);
   U197 : AOI221 port map( A => cell2_N37, B => n156, C => cell2_N61_port, D =>
                           cell2_n41, Q => cell2_n62);
   U198 : XOR21 port map( A => X1_0_port, B => Y1_1_port, Q => cell2_N37);
   U199 : XNR21 port map( A => X1_0_port, B => n5, Q => cell2_N61_port);
   U200 : INV3 port map( A => cell2_n55, Q => n229);
   U201 : AOI221 port map( A => cell2_N44_port, B => n156, C => cell2_N68, D =>
                           n153, Q => cell2_n55);
   U202 : XOR21 port map( A => cell2_add_65_carry_7_port, B => X1_7_port, Q => 
                           cell2_N44_port);
   U203 : XNR21 port map( A => cell2_sub_69_carry_7_port, B => X1_7_port, Q => 
                           cell2_N68);
   U204 : INV3 port map( A => cell4_n63, Q => n177);
   U205 : AOI221 port map( A => cell4_N36, B => n140, C => cell4_N60, D => n138
                           , Q => cell4_n63);
   U206 : XNR21 port map( A => cell4_sub_68_carry_7_port, B => Z3_7_port, Q => 
                           cell4_N60);
   U207 : XOR21 port map( A => cell4_add_64_carry_7_port, B => Z3_7_port, Q => 
                           cell4_N36);
   U208 : INV3 port map( A => cell4_n55, Q => n181);
   U209 : AOI221 port map( A => cell4_N44_port, B => n140, C => cell4_N68, D =>
                           cell4_n41, Q => cell4_n55);
   U210 : XNR21 port map( A => cell4_sub_69_carry_7_port, B => X3_7_port, Q => 
                           cell4_N68);
   U211 : XOR21 port map( A => cell4_add_65_carry_7_port, B => X3_7_port, Q => 
                           cell4_N44_port);
   U212 : INV3 port map( A => cell3_n63, Q => n197);
   U213 : AOI221 port map( A => cell3_N36, B => cell3_n40, C => cell3_N60_port,
                           D => n145, Q => cell3_n63);
   U214 : XNR21 port map( A => cell3_sub_68_carry_7_port, B => Z2_7_port, Q => 
                           cell3_N60_port);
   U215 : XOR21 port map( A => cell3_add_64_carry_7_port, B => Z2_7_port, Q => 
                           cell3_N36);
   U216 : INV3 port map( A => cell3_n55, Q => n205);
   U217 : AOI221 port map( A => cell3_N44_port, B => n152, C => cell3_N68, D =>
                           n146, Q => cell3_n55);
   U218 : XOR21 port map( A => cell3_add_65_carry_7_port, B => X2_7_port, Q => 
                           cell3_N44_port);
   U219 : XNR21 port map( A => cell3_sub_69_carry_7_port, B => X2_7_port, Q => 
                           cell3_N68);
   U220 : INV3 port map( A => cell2_n63, Q => n221);
   U221 : AOI221 port map( A => cell2_N36, B => cell2_n40, C => cell2_N60_port,
                           D => n154, Q => cell2_n63);
   U222 : XNR21 port map( A => cell2_sub_68_carry_7_port, B => Z1_7_port, Q => 
                           cell2_N60_port);
   U223 : XOR21 port map( A => cell2_add_64_carry_7_port, B => Z1_7_port, Q => 
                           cell2_N36);
   U224 : INV3 port map( A => cell4_n47, Q => n189);
   U225 : AOI221 port map( A => cell4_N52_port, B => n140, C => cell4_N76, D =>
                           n138, Q => cell4_n47);
   U226 : XOR21 port map( A => cell4_add_70_carry_7_port, B => Y3_7_port, Q => 
                           cell4_N76);
   U227 : XNR21 port map( A => cell4_sub_66_carry_7_port, B => Y3_7_port, Q => 
                           cell4_N52_port);
   U228 : INV3 port map( A => cell3_n47, Q => n213);
   U229 : AOI221 port map( A => cell3_N52_port, B => n152, C => cell3_N76, D =>
                           n149, Q => cell3_n47);
   U230 : XOR21 port map( A => cell3_add_70_carry_7_port, B => Y2_7_port, Q => 
                           cell3_N76);
   U231 : XNR21 port map( A => cell3_sub_66_carry_7_port, B => Y2_7_port, Q => 
                           cell3_N52_port);
   U232 : INV3 port map( A => cell2_n47, Q => n237);
   U233 : AOI221 port map( A => cell2_N52_port, B => n156, C => cell2_N76, D =>
                           cell2_n41, Q => cell2_n47);
   U234 : XOR21 port map( A => cell2_add_70_carry_7_port, B => Y1_7_port, Q => 
                           cell2_N76);
   U235 : XNR21 port map( A => cell2_sub_66_carry_7_port, B => Y1_7_port, Q => 
                           cell2_N52_port);
   U236 : INV3 port map( A => cell4_n45, Q => n191);
   U237 : AOI221 port map( A => cell4_N30, B => n140, C => cell4_N54_port, D =>
                           n137, Q => cell4_n45);
   U238 : XOR21 port map( A => Z3_1_port, B => Z3_0_port, Q => cell4_N54_port);
   U239 : XNR21 port map( A => Z3_1_port, B => Z3_0_port, Q => cell4_N30);
   U240 : INV3 port map( A => cell3_n44, Q => n216);
   U241 : AOI221 port map( A => cell3_N31, B => n152, C => cell3_N55_port, D =>
                           n149, Q => cell3_n44);
   U242 : XOR21 port map( A => Z2_2_port, B => Z2_1_port, Q => cell3_N55_port);
   U243 : XNR21 port map( A => Z2_2_port, B => Z2_1_port, Q => cell3_N31);
   U244 : INV3 port map( A => cell4_n49, Q => n187);
   U245 : AOI221 port map( A => cell4_N50_port, B => n140, C => cell4_N74, D =>
                           cell4_n41, Q => cell4_n49);
   U246 : XOR21 port map( A => Y3_5_port, B => cell4_add_70_carry_5_port, Q => 
                           cell4_N74);
   U247 : XNR21 port map( A => Y3_5_port, B => cell4_sub_66_carry_5_port, Q => 
                           cell4_N50_port);
   U248 : INV3 port map( A => cell3_n48, Q => n212);
   U249 : AOI221 port map( A => cell3_N51_port, B => cell3_n40, C => cell3_N75,
                           D => n148, Q => cell3_n48);
   U250 : XOR21 port map( A => Y2_6_port, B => cell3_add_70_carry_6_port, Q => 
                           cell3_N75);
   U251 : XNR21 port map( A => Y2_6_port, B => cell3_sub_66_carry_6_port, Q => 
                           cell3_N51_port);
   U252 : INV3 port map( A => cell2_n43, Q => n241);
   U253 : AOI221 port map( A => cell2_N32, B => cell2_n40, C => cell2_N56_port,
                           D => n153, Q => cell2_n43);
   U254 : XOR21 port map( A => Z1_3_port, B => cell2_sub_68_carry_3_port, Q => 
                           cell2_N56_port);
   U255 : XNR21 port map( A => Z1_3_port, B => cell2_add_64_carry_3_port, Q => 
                           cell2_N32);
   U256 : INV3 port map( A => cell4_n54, Q => n182);
   U257 : AOI221 port map( A => cell4_N45_port, B => n139, C => cell4_N69, D =>
                           n137, Q => cell4_n54);
   U258 : XOR21 port map( A => Y3_0_port, B => X3_3_port, Q => cell4_N69);
   U259 : XNR21 port map( A => Y3_0_port, B => n3, Q => cell4_N45_port);
   U260 : INV3 port map( A => cell4_n48, Q => n188);
   U261 : AOI221 port map( A => cell4_N51_port, B => n139, C => cell4_N75, D =>
                           n137, Q => cell4_n48);
   U262 : XOR21 port map( A => Y3_6_port, B => cell4_add_70_carry_6_port, Q => 
                           cell4_N75);
   U263 : XNR21 port map( A => Y3_6_port, B => cell4_sub_66_carry_6_port, Q => 
                           cell4_N51_port);
   U264 : INV3 port map( A => cell3_n54, Q => n206);
   U265 : AOI221 port map( A => cell3_N45_port, B => cell3_n40, C => cell3_N69,
                           D => n144, Q => cell3_n54);
   U266 : XOR21 port map( A => Y2_0_port, B => X2_2_port, Q => cell3_N69);
   U267 : XNR21 port map( A => Y2_0_port, B => n6, Q => cell3_N45_port);
   U268 : INV3 port map( A => cell2_n54, Q => n230);
   U269 : AOI221 port map( A => cell2_N45_port, B => cell2_n40, C => cell2_N69,
                           D => n154, Q => cell2_n54);
   U270 : XOR21 port map( A => Y1_0_port, B => X1_1_port, Q => cell2_N69);
   U271 : XNR21 port map( A => Y1_0_port, B => n4, Q => cell2_N45_port);
   U272 : INV3 port map( A => cell4_n44, Q => n192);
   U273 : AOI221 port map( A => cell4_N31, B => n139, C => cell4_N55_port, D =>
                           n138, Q => cell4_n44);
   U274 : XOR21 port map( A => Z3_2_port, B => cell4_sub_68_carry_2_port, Q => 
                           cell4_N55_port);
   U275 : XNR21 port map( A => Z3_2_port, B => cell4_add_64_carry_2_port, Q => 
                           cell4_N31);
   U276 : INV3 port map( A => cell3_n43, Q => n217);
   U277 : AOI221 port map( A => cell3_N32, B => cell3_n40, C => cell3_N56_port,
                           D => n150, Q => cell3_n43);
   U278 : XOR21 port map( A => Z2_3_port, B => cell3_sub_68_carry_3_port, Q => 
                           cell3_N56_port);
   U279 : XNR21 port map( A => Z2_3_port, B => cell3_add_64_carry_3_port, Q => 
                           cell3_N32);
   U280 : INV3 port map( A => cell2_n42, Q => n242);
   U281 : AOI221 port map( A => cell2_N33, B => cell2_n40, C => cell2_N57_port,
                           D => n154, Q => cell2_n42);
   U282 : XOR21 port map( A => Z1_4_port, B => cell2_sub_68_carry_4_port, Q => 
                           cell2_N57_port);
   U283 : XNR21 port map( A => Z1_4_port, B => cell2_add_64_carry_4_port, Q => 
                           cell2_N33);
   U284 : INV3 port map( A => cell3_n46, Q => n214);
   U285 : AOI221 port map( A => cell3_N53_port, B => cell3_n40, C => 
                           cell3_N53_port, D => n148, Q => cell3_n46);
   U286 : INV3 port map( A => cell2_n46, Q => n238);
   U287 : AOI221 port map( A => cell2_N53_port, B => cell2_n40, C => 
                           cell2_N53_port, D => n153, Q => cell2_n46);
   U288 : INV3 port map( A => cell4_n46, Q => n190);
   U289 : AOI221 port map( A => n64, B => n139, C => n64, D => cell4_n41, Q => 
                           cell4_n46);
   U290 : INV3 port map( A => cell3_n45, Q => n215);
   U291 : AOI221 port map( A => n65, B => cell3_n40, C => n65, D => n149, Q => 
                           cell3_n45);
   U292 : INV3 port map( A => cell2_n45, Q => n239);
   U293 : AOI221 port map( A => n66, B => cell2_n40, C => n66, D => n154, Q => 
                           cell2_n45);
   U294 : NOR21 port map( A => n80, B => n261, Q => cell6_n37);
   U295 : NOR21 port map( A => n261, B => Y5_7_port, Q => cell6_n36);
   U296 : NOR21 port map( A => n261, B => Y(7), Q => n158);
   U297 : NOR21 port map( A => n261, B => Y(7), Q => n157);
   U298 : NOR21 port map( A => n261, B => Y(7), Q => cell1_n39);
   U299 : XOR21 port map( A => X(0), B => Y(0), Q => cell1_N37);
   U300 : INV3 port map( A => cell1_n60, Q => n245);
   U301 : AOI221 port map( A => n262, B => cell1_N61, C => n157, D => cell1_N37
                           , Q => cell1_n60);
   U302 : XNR21 port map( A => X(0), B => n277, Q => cell1_N61);
   U303 : INV3 port map( A => cell1_n63, Q => n262);
   U304 : NAND22 port map( A => Y(7), B => reset_n, Q => cell1_n63);
   U305 : BUF2 port map( A => cell5_n41, Q => n136);
   U306 : NOR21 port map( A => n79, B => n261, Q => cell5_n41);
   U307 : NOR21 port map( A => n261, B => Y4_7_port, Q => cell5_n40);
   U308 : INV3 port map( A => cell6_n59, Q => n160);
   U309 : AOI221 port map( A => cell6_N36_port, B => cell6_n36, C => 
                           cell6_N60_port, D => cell6_n37, Q => cell6_n59);
   U310 : XOR21 port map( A => n331, B => Z5_7_port, Q => cell6_N60_port);
   U311 : XOR21 port map( A => cell6_add_64_carry_7_port, B => Z5_7_port, Q => 
                           cell6_N36_port);
   U312 : INV3 port map( A => cell6_n60, Q => n159);
   U313 : AOI221 port map( A => cell6_N35_port, B => cell6_n36, C => 
                           cell6_N59_port, D => cell6_n37, Q => cell6_n60);
   U314 : XNR21 port map( A => Z5_6_port, B => n330, Q => cell6_N59_port);
   U315 : INV3 port map( A => cell6_n38, Q => n165);
   U316 : AOI221 port map( A => cell6_N33, B => cell6_n36, C => n294, D => 
                           cell6_n37, Q => cell6_n38);
   U317 : INV3 port map( A => n328, Q => n294);
   U318 : AOI211 port map( A => n295, B => Z5_4_port, C => n329, Q => n328);
   U319 : INV3 port map( A => cell6_n39, Q => n164);
   U320 : AOI221 port map( A => cell6_N32, B => cell6_n36, C => cell6_N56, D =>
                           cell6_n37, Q => cell6_n39);
   U321 : INV3 port map( A => cell6_n40, Q => n163);
   U322 : AOI221 port map( A => cell6_N31, B => cell6_n36, C => cell6_N55, D =>
                           cell6_n37, Q => cell6_n40);
   U323 : INV3 port map( A => cell6_n41, Q => n162);
   U324 : AOI221 port map( A => cell6_N30, B => cell6_n36, C => cell6_N54, D =>
                           cell6_n37, Q => cell6_n41);
   U325 : INV3 port map( A => cell1_n52, Q => n253);
   U326 : AOI221 port map( A => n262, B => cell1_N37, C => cell1_n39, D => 
                           cell1_N45_port, Q => cell1_n52);
   U327 : XNR21 port map( A => Y(0), B => n135, Q => cell1_N45_port);
   U328 : INV3 port map( A => cell5_n64, Q => n167);
   U329 : AOI221 port map( A => cell5_N35, B => cell5_n40, C => cell5_N59, D =>
                           n136, Q => cell5_n64);
   U330 : XNR21 port map( A => Z4_6_port, B => cell5_sub_68_carry_6_port, Q => 
                           cell5_N59);
   U331 : XOR21 port map( A => Z4_6_port, B => cell5_add_64_carry_6_port, Q => 
                           cell5_N35);
   U332 : INV3 port map( A => cell5_n39, Q => n175);
   U333 : AOI221 port map( A => cell5_N34, B => cell5_n40, C => cell5_N58, D =>
                           n136, Q => cell5_n39);
   U334 : XNR21 port map( A => Z4_5_port, B => cell5_sub_68_carry_5_port, Q => 
                           cell5_N58);
   U335 : XOR21 port map( A => Z4_5_port, B => cell5_add_64_carry_5_port, Q => 
                           cell5_N34);
   U336 : INV3 port map( A => cell5_n42, Q => n174);
   U337 : AOI221 port map( A => cell5_N33, B => cell5_n40, C => cell5_N57, D =>
                           n136, Q => cell5_n42);
   U338 : XNR21 port map( A => Z4_4_port, B => cell5_sub_68_carry_4_port, Q => 
                           cell5_N57);
   U339 : XOR21 port map( A => Z4_4_port, B => cell5_add_64_carry_4_port, Q => 
                           cell5_N33);
   U340 : INV3 port map( A => cell5_n43, Q => n173);
   U341 : AOI221 port map( A => cell5_N32, B => cell5_n40, C => cell5_N56, D =>
                           n136, Q => cell5_n43);
   U342 : XNR21 port map( A => Z4_3_port, B => cell5_sub_68_carry_3_port, Q => 
                           cell5_N56);
   U343 : XOR21 port map( A => Z4_3_port, B => cell5_add_64_carry_3_port, Q => 
                           cell5_N32);
   U344 : INV3 port map( A => cell5_n44, Q => n172);
   U345 : AOI221 port map( A => cell5_N31, B => cell5_n40, C => cell5_N55, D =>
                           n136, Q => cell5_n44);
   U346 : XNR21 port map( A => Z4_2_port, B => cell5_sub_68_carry_2_port, Q => 
                           cell5_N55);
   U347 : XOR21 port map( A => Z4_2_port, B => cell5_add_64_carry_2_port, Q => 
                           cell5_N31);
   U348 : INV3 port map( A => cell5_n63, Q => n168);
   U349 : AOI221 port map( A => cell5_N36, B => cell5_n40, C => cell5_N60, D =>
                           n136, Q => cell5_n63);
   U350 : XNR21 port map( A => cell5_sub_68_carry_7_port, B => Z4_7_port, Q => 
                           cell5_N60);
   U351 : XOR21 port map( A => cell5_add_64_carry_7_port, B => Z4_7_port, Q => 
                           cell5_N36);
   U352 : INV3 port map( A => cell5_n45, Q => n171);
   U353 : AOI221 port map( A => cell5_N30, B => cell5_n40, C => cell5_N54, D =>
                           n136, Q => cell5_n45);
   U354 : XOR21 port map( A => Z4_1_port, B => Z4_0_port, Q => cell5_N54);
   U355 : XNR21 port map( A => Z4_1_port, B => Z4_0_port, Q => cell5_N30);
   U356 : INV3 port map( A => cell5_n47, Q => n169);
   U357 : AOI221 port map( A => cell5_N52, B => cell5_n40, C => cell5_N76, D =>
                           n136, Q => cell5_n47);
   U358 : XOR21 port map( A => n285, B => Y4_7_port, Q => cell5_N76);
   U359 : XNR21 port map( A => n290, B => Y4_7_port, Q => cell5_N52);
   U360 : INV3 port map( A => cell5_n46, Q => n170);
   U361 : AOI221 port map( A => n67, B => cell5_n40, C => n67, D => n136, Q => 
                           cell5_n46);
   U362 : INV3 port map( A => n109, Q => cell2_sub_66_carry_1_port);
   U363 : NOR21 port map( A => n4, B => Y1_0_port, Q => n109);
   U364 : INV3 port map( A => n113, Q => cell2_sub_69_carry_1_port);
   U365 : NOR21 port map( A => n5, B => X1_0_port, Q => n113);
   U366 : NOR21 port map( A => Y4_1_port, B => n293, Q => n317);
   U367 : INV3 port map( A => n318, Q => n293);
   U368 : NOR21 port map( A => X3_3_port, B => n278, Q => n302);
   U369 : INV3 port map( A => n303, Q => n278);
   U370 : AOI211 port map( A => X3_1_port, B => Y3_4_port, C => n284, Q => n306
                           );
   U371 : INV3 port map( A => n304, Q => n284);
   U372 : OAI2111 port map( A => X3_1_port, B => Y3_4_port, C => X3_0_port, D 
                           => Y3_3_port, Q => n304);
   U373 : INV3 port map( A => n309, Q => n281);
   U374 : AOI211 port map( A => n308, B => X3_3_port, C => n282, Q => n309);
   U375 : INV3 port map( A => n307, Q => n282);
   U376 : AOI221 port map( A => n301, B => X3_2_port, C => n48, D => n279, Q =>
                           n303);
   U377 : INV3 port map( A => n300, Q => n279);
   U378 : NOR21 port map( A => X3_2_port, B => n301, Q => n300);
   U379 : AOI221 port map( A => n320, B => Y4_2_port, C => n61, D => n292, Q =>
                           n322);
   U380 : INV3 port map( A => n319, Q => n292);
   U381 : NOR21 port map( A => Y4_2_port, B => n320, Q => n319);
   U382 : INV3 port map( A => n306, Q => n283);
   U383 : NOR21 port map( A => n3, B => n25, Q => cell4_add_70_carry_1_port);
   U384 : NOR21 port map( A => n123, B => n47, Q => cell4_add_65_carry_6_port);
   U385 : INV3 port map( A => cell4_add_65_carry_5_port, Q => n123);
   U386 : INV3 port map( A => n101, Q => cell3_sub_66_carry_1_port);
   U387 : NOR21 port map( A => n6, B => Y2_0_port, Q => n101);
   U388 : INV3 port map( A => n106, Q => cell3_sub_69_carry_1_port);
   U389 : NOR21 port map( A => n7, B => X2_0_port, Q => n106);
   U390 : INV3 port map( A => n91, Q => cell4_sub_66_carry_1_port);
   U391 : NOR21 port map( A => n3, B => Y3_0_port, Q => n91);
   U392 : NOR21 port map( A => n126, B => n48, Q => cell4_add_70_carry_6_port);
   U393 : INV3 port map( A => cell4_add_70_carry_5_port, Q => n126);
   U394 : NOR21 port map( A => n8, B => X3_0_port, Q => n299);
   U395 : NOR21 port map( A => n35, B => Y4_0_port, Q => n318);
   U396 : NOR21 port map( A => n4, B => n26, Q => cell2_add_70_carry_1_port);
   U397 : NOR21 port map( A => n5, B => n27, Q => cell2_add_65_carry_1_port);
   U398 : NOR21 port map( A => n6, B => n28, Q => cell3_add_70_carry_1_port);
   U399 : NOR21 port map( A => n7, B => n29, Q => cell3_add_65_carry_1_port);
   U400 : NOR21 port map( A => n124, B => n71, Q => cell4_add_65_carry_7_port);
   U401 : INV3 port map( A => cell4_add_65_carry_6_port, Q => n124);
   U402 : NOR21 port map( A => n132, B => n72, Q => cell3_add_70_carry_7_port);
   U403 : INV3 port map( A => cell3_add_70_carry_6_port, Q => n132);
   U404 : NOR21 port map( A => n130, B => n73, Q => cell3_add_65_carry_7_port);
   U405 : INV3 port map( A => cell3_add_65_carry_6_port, Q => n130);
   U406 : NOR21 port map( A => n127, B => n74, Q => cell4_add_70_carry_7_port);
   U407 : INV3 port map( A => cell4_add_70_carry_6_port, Q => n127);
   U408 : INV3 port map( A => n96, Q => cell4_sub_69_carry_6_port);
   U409 : NOR21 port map( A => cell4_sub_69_carry_5_port, B => X3_5_port, Q => 
                           n96);
   U410 : INV3 port map( A => n89, Q => cell4_sub_66_carry_6_port);
   U411 : NOR21 port map( A => cell4_sub_66_carry_5_port, B => Y3_5_port, Q => 
                           n89);
   U412 : NOR21 port map( A => Y4_3_port, B => n291, Q => n321);
   U413 : INV3 port map( A => n322, Q => n291);
   U414 : INV3 port map( A => n324, Q => n290);
   U415 : NOR40 port map( A => n323, B => Y4_4_port, C => Y4_6_port, D => 
                           Y4_5_port, Q => n324);
   U416 : INV3 port map( A => n97, Q => cell4_sub_69_carry_7_port);
   U417 : NOR21 port map( A => cell4_sub_69_carry_6_port, B => X3_6_port, Q => 
                           n97);
   U418 : INV3 port map( A => n100, Q => cell3_sub_66_carry_7_port);
   U419 : NOR21 port map( A => cell3_sub_66_carry_6_port, B => Y2_6_port, Q => 
                           n100);
   U420 : INV3 port map( A => n105, Q => cell3_sub_69_carry_7_port);
   U421 : NOR21 port map( A => cell3_sub_69_carry_6_port, B => X2_6_port, Q => 
                           n105);
   U422 : INV3 port map( A => n90, Q => cell4_sub_66_carry_7_port);
   U423 : NOR21 port map( A => cell4_sub_66_carry_6_port, B => Y3_6_port, Q => 
                           n90);
   U424 : NOR21 port map( A => X3_1_port, B => n280, Q => n298);
   U425 : INV3 port map( A => n299, Q => n280);
   U426 : AOI211 port map( A => Y4_1_port, B => X4_5_port, C => n289, Q => n312
                           );
   U427 : INV3 port map( A => n310, Q => n289);
   U428 : OAI2111 port map( A => Y4_1_port, B => X4_5_port, C => Y4_0_port, D 
                           => X4_4_port, Q => n310);
   U429 : NOR21 port map( A => n295, B => Z5_4_port, Q => n329);
   U430 : NOR21 port map( A => n67, B => n30, Q => cell5_sub_68_carry_2_port);
   U431 : NOR21 port map( A => n66, B => n31, Q => cell2_add_64_carry_3_port);
   U432 : INV3 port map( A => n312, Q => n288);
   U433 : NOR21 port map( A => n118, B => n49, Q => cell5_add_64_carry_6_port);
   U434 : INV3 port map( A => cell5_add_64_carry_5_port, Q => n118);
   U435 : NOR21 port map( A => n81, B => n1, Q => cell5_add_64_carry_3_port);
   U436 : NOR21 port map( A => n64, B => n32, Q => cell4_sub_68_carry_2_port);
   U437 : NOR21 port map( A => n65, B => n33, Q => cell3_sub_68_carry_3_port);
   U438 : NOR21 port map( A => n108, B => n50, Q => cell2_add_64_carry_6_port);
   U439 : NOR21 port map( A => n110, B => n51, Q => cell2_sub_68_carry_4_port);
   U440 : NOR21 port map( A => Z5_1_port, B => Z5_0_port, Q => n325);
   U441 : NOR21 port map( A => n297, B => Z5_2_port, Q => n327);
   U442 : NOR21 port map( A => n330, B => Z5_6_port, Q => n331);
   U443 : INV3 port map( A => n87, Q => cell4_add_64_carry_2_port);
   U444 : NOR21 port map( A => Z3_0_port, B => Z3_1_port, Q => n87);
   U445 : INV3 port map( A => n98, Q => cell3_add_64_carry_3_port);
   U446 : NOR21 port map( A => Z2_1_port, B => Z2_2_port, Q => n98);
   U447 : NOR21 port map( A => n119, B => n75, Q => cell5_add_64_carry_7_port);
   U448 : INV3 port map( A => cell5_add_64_carry_6_port, Q => n119);
   U449 : NOR21 port map( A => n122, B => n76, Q => cell4_add_64_carry_7_port);
   U450 : INV3 port map( A => cell4_add_64_carry_6_port, Q => n122);
   U451 : NOR21 port map( A => n129, B => n77, Q => cell3_add_64_carry_7_port);
   U452 : INV3 port map( A => cell3_add_64_carry_6_port, Q => n129);
   U453 : NOR21 port map( A => n133, B => n78, Q => cell2_add_64_carry_7_port);
   U454 : INV3 port map( A => cell2_add_64_carry_6_port, Q => n133);
   U455 : INV3 port map( A => n85, Q => cell5_sub_68_carry_6_port);
   U456 : NOR21 port map( A => cell5_sub_68_carry_5_port, B => Z4_5_port, Q => 
                           n85);
   U457 : INV3 port map( A => n84, Q => cell5_sub_68_carry_5_port);
   U458 : NOR21 port map( A => cell5_sub_68_carry_4_port, B => Z4_4_port, Q => 
                           n84);
   U459 : INV3 port map( A => n83, Q => cell5_sub_68_carry_4_port);
   U460 : NOR21 port map( A => cell5_sub_68_carry_3_port, B => Z4_3_port, Q => 
                           n83);
   U461 : INV3 port map( A => n82, Q => cell5_sub_68_carry_3_port);
   U462 : NOR21 port map( A => cell5_sub_68_carry_2_port, B => Z4_2_port, Q => 
                           n82);
   U463 : INV3 port map( A => n94, Q => cell4_sub_68_carry_6_port);
   U464 : NOR21 port map( A => cell4_sub_68_carry_5_port, B => Z3_5_port, Q => 
                           n94);
   U465 : INV3 port map( A => n93, Q => cell4_sub_68_carry_5_port);
   U466 : NOR21 port map( A => cell4_sub_68_carry_4_port, B => Z3_4_port, Q => 
                           n93);
   U467 : INV3 port map( A => n92, Q => cell4_sub_68_carry_4_port);
   U468 : NOR21 port map( A => cell4_sub_68_carry_3_port, B => Z3_3_port, Q => 
                           n92);
   U469 : INV3 port map( A => n103, Q => cell3_sub_68_carry_6_port);
   U470 : NOR21 port map( A => cell3_sub_68_carry_5_port, B => Z2_5_port, Q => 
                           n103);
   U471 : INV3 port map( A => n102, Q => cell3_sub_68_carry_5_port);
   U472 : NOR21 port map( A => cell3_sub_68_carry_4_port, B => Z2_4_port, Q => 
                           n102);
   U473 : INV3 port map( A => n111, Q => cell2_sub_68_carry_6_port);
   U474 : NOR21 port map( A => cell2_sub_68_carry_5_port, B => Z1_5_port, Q => 
                           n111);
   U475 : INV3 port map( A => n107, Q => cell2_add_64_carry_4_port);
   U476 : NOR21 port map( A => cell2_add_64_carry_3_port, B => Z1_3_port, Q => 
                           n107);
   U477 : INV3 port map( A => n326, Q => n295);
   U478 : NOR21 port map( A => n296, B => Z5_3_port, Q => n326);
   U479 : INV3 port map( A => n81, Q => cell5_add_64_carry_2_port);
   U480 : NOR21 port map( A => Z4_0_port, B => Z4_1_port, Q => n81);
   U481 : INV3 port map( A => n110, Q => cell2_sub_68_carry_3_port);
   U482 : NOR21 port map( A => Z1_1_port, B => Z1_2_port, Q => n110);
   U483 : INV3 port map( A => n88, Q => cell4_add_64_carry_3_port);
   U484 : NOR21 port map( A => cell4_add_64_carry_2_port, B => Z3_2_port, Q => 
                           n88);
   U485 : INV3 port map( A => n99, Q => cell3_add_64_carry_4_port);
   U486 : NOR21 port map( A => cell3_add_64_carry_3_port, B => Z2_3_port, Q => 
                           n99);
   U487 : INV3 port map( A => n108, Q => cell2_add_64_carry_5_port);
   U488 : NOR21 port map( A => cell2_add_64_carry_4_port, B => Z1_4_port, Q => 
                           n108);
   U489 : INV3 port map( A => n316, Q => n285);
   U490 : NAND41 port map( A => Y4_6_port, B => Y4_5_port, C => Y4_4_port, D =>
                           n286, Q => n316);
   U491 : INV3 port map( A => n315, Q => n286);
   U492 : AOI211 port map( A => n314, B => Y4_3_port, C => n287, Q => n315);
   U493 : NOR21 port map( A => n125, B => n34, Q => cell4_sub_68_carry_3_port);
   U494 : INV3 port map( A => cell4_sub_68_carry_2_port, Q => n125);
   U495 : NOR21 port map( A => n131, B => n52, Q => cell3_sub_68_carry_4_port);
   U496 : INV3 port map( A => cell3_sub_68_carry_3_port, Q => n131);
   U497 : NOR21 port map( A => n117, B => n53, Q => cell5_add_64_carry_5_port);
   U498 : INV3 port map( A => cell5_add_64_carry_4_port, Q => n117);
   U499 : NOR21 port map( A => n121, B => n54, Q => cell4_add_64_carry_6_port);
   U500 : INV3 port map( A => cell4_add_64_carry_5_port, Q => n121);
   U501 : NOR21 port map( A => n116, B => n55, Q => cell5_add_64_carry_4_port);
   U502 : INV3 port map( A => cell5_add_64_carry_3_port, Q => n116);
   U503 : NOR21 port map( A => n120, B => n56, Q => cell4_add_64_carry_5_port);
   U504 : INV3 port map( A => cell4_add_64_carry_4_port, Q => n120);
   U505 : NOR21 port map( A => n128, B => n57, Q => cell3_add_64_carry_6_port);
   U506 : INV3 port map( A => cell3_add_64_carry_5_port, Q => n128);
   U507 : NOR21 port map( A => n134, B => n58, Q => cell2_sub_68_carry_5_port);
   U508 : INV3 port map( A => cell2_sub_68_carry_4_port, Q => n134);
   U509 : INV3 port map( A => n86, Q => cell5_sub_68_carry_7_port);
   U510 : NOR21 port map( A => cell5_sub_68_carry_6_port, B => Z4_6_port, Q => 
                           n86);
   U511 : INV3 port map( A => n95, Q => cell4_sub_68_carry_7_port);
   U512 : NOR21 port map( A => cell4_sub_68_carry_6_port, B => Z3_6_port, Q => 
                           n95);
   U513 : INV3 port map( A => n104, Q => cell3_sub_68_carry_7_port);
   U514 : NOR21 port map( A => cell3_sub_68_carry_6_port, B => Z2_6_port, Q => 
                           n104);
   U515 : INV3 port map( A => n112, Q => cell2_sub_68_carry_7_port);
   U516 : NOR21 port map( A => cell2_sub_68_carry_6_port, B => Z1_6_port, Q => 
                           n112);
   U517 : NOR21 port map( A => n88, B => n59, Q => cell4_add_64_carry_4_port);
   U518 : NOR21 port map( A => n99, B => n60, Q => cell3_add_64_carry_5_port);
   U519 : INV3 port map( A => n313, Q => n287);
   U520 : OAI222 port map( A => n299, B => n23, C => Y3_4_port, D => n298, Q =>
                           n301);
   U521 : OAI222 port map( A => n303, B => n3, C => Y3_6_port, D => n302, Q => 
                           cell4_sub_69_carry_4_port);
   U522 : OAI212 port map( A => X3_2_port, B => n283, C => Y3_5_port, Q => n305
                           );
   U523 : OAI212 port map( A => n306, B => n22, C => n305, Q => n308);
   U524 : OAI212 port map( A => X3_3_port, B => n308, C => Y3_6_port, Q => n307
                           );
   U525 : OAI212 port map( A => Y4_2_port, B => n288, C => X4_6_port, Q => n311
                           );
   U526 : OAI212 port map( A => n312, B => n45, C => n311, Q => n314);
   U527 : OAI212 port map( A => Y4_3_port, B => n314, C => X4_7_port, Q => n313
                           );
   U528 : OAI222 port map( A => n318, B => n24, C => X4_5_port, D => n317, Q =>
                           n320);
   U529 : OAI222 port map( A => n322, B => n46, C => X4_7_port, D => n321, Q =>
                           n323);
   U530 : OAI212 port map( A => n2, B => n70, C => n297, Q => cell6_N54);
   U531 : OAI212 port map( A => n325, B => n68, C => n296, Q => cell6_N55);
   U532 : OAI212 port map( A => n327, B => n69, C => n295, Q => cell6_N56);
   U533 : OAI212 port map( A => n329, B => n62, C => n330, Q => cell6_N58);

end SYN_A;
