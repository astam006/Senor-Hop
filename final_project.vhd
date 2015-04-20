library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Top-level entity of the Senor Hop game.
entity final_project is
	port( 
			-- Clock and reset signals
			CLOCK_50 : in std_logic;								-- 50 MHz clock
			RESET 	: in std_logic;								-- Reset signal
			
			-- Buttons and Switches
			SW		: in std_logic_vector(17 downto 0);			-- Switch inputs
			KEY	: in std_logic_vector(3 downto 0);			-- Push button inputs
			
			-- LED outputs
			LEDR	: out std_logic_vector(17 downto 0);		-- Red LED outputs
			LEDG	: out std_logic_vector(7 downto 0);			-- Green LED outputs
			HEX0	: out std_logic_vector(6 downto 0);			-- 7-segment display (active low)
			HEX1	: out std_logic_vector(6 downto 0);			-- 7-segment display (active low)
			HEX2	: out std_logic_vector(6 downto 0);			-- 7-segment display (active low)
			HEX3	: out std_logic_vector(6 downto 0);			-- 7-segment display (active low)
			HEX4	: out std_logic_vector(6 downto 0);			-- 7-segment display (active low)
			HEX5	: out std_logic_vector(6 downto 0);			-- 7-segment display (active low)
			HEX6	: out std_logic_vector(6 downto 0);			-- 7-segment display (active low)
			HEX7	: out std_logic_vector(6 downto 0);			-- 7-segment display (active low)
			
			-- 16 X 2 LCD Module
			LCD_BLON : out std_logic;								-- Back Light ON/OFF
			LCD_EN	: out std_logic;								-- Enable
			LCD_ON	: out std_logic;								-- Power ON/OFF
			LCD_RS	: out std_logic;								-- Command/Data Select, 0 = Command, 1 = Data
			LCD_RW	: out std_logic;								-- Read/Write Select, 0 = Write, 1 = Read
			LCD_DATA : inout std_logic_vector(7 downto 0);	-- Data bus 8 bits
			
			-- Game Logic State
			STATE : out std_logic_vector(0 to 5)				-- Current Game States
	);
end final_project;

architecture game_logic of final_project is
begin
	LEDR <= SW;
end game_logic;