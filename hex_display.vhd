LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY hex_display IS
 	PORT ( number : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
 		   display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END hex_display;
ARCHITECTURE Behavior OF hex_display IS  
	BEGIN
	   
display <= not "0111111" when number = x"0" else
 	       not "0000110" when number = x"1" else
 	       not "1011011" when number = x"2" else
 	       not "1001111" when number = x"3" else
 	       not "1100110" when number = x"4" else
 	       not "1101101" when number = x"5" else
 	       not "1111101" when number = x"6" else
 	       not "0000111" when number = x"7" else
 	       not "1111111" when number = x"8" else
 	       not "1100111" when number = x"9" else
 	       not "1110111" when number = x"a" else
 	       not "1111100" when number = x"b" else
 	       not "0111001" when number = x"c" else
 	       not "1011110" when number = x"d" else
 	       not "1111001" when number = x"e" else
 	       not "1110001" when number = x"f" else
	       not "0000000";	
		   
END Behavior;