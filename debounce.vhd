library IEEE;
use ieee.std_logic_1164.all;

entity debounce is
	port(
	clk, d : in std_logic;
	q : out std_logic);
end entity debounce;		

architecture behavioral of debounce is	

signal q1 : std_logic := '1';

begin
	
	process(clk)
	begin 
		if rising_edge(clk) then
			q1 <= d;
			q <= q1;
		end if;
		
	end process;
end architecture;