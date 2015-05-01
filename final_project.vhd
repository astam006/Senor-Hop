
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity final_project is

-------------------------------------------------------------------------------
--							 Port Declarations							 --
-------------------------------------------------------------------------------
port (
	-- Inputs
	CLOCK_50			: in std_logic;
	TD_CLK27			: in std_logic;
	KEY				  	: in std_logic_vector (3 downto 0);
	SW				   	: in std_logic_vector (17 downto 0);


	--  Memory (SRAM)
	SRAM_DQ				: inout std_logic_vector (15 downto 0);
	
	-- Memory (SDRAM)
	DRAM_DQ				: inout std_logic_vector (31 downto 0);

	
	--  Char LCD 16x2
	LCD_DATA			: inout std_logic_vector (7 downto 0);
	
	-- Outputs
	TD_RESET_N			: out std_logic;
	
	--  Simple
	LEDG				: inout std_logic_vector (8 downto 0);
	LEDR				: out std_logic_vector (17 downto 0);
	HEX0				: out std_logic_vector (6 downto 0);
	HEX1				: out std_logic_vector (6 downto 0);
	HEX2				: out std_logic_vector (6 downto 0);
	HEX3				: out std_logic_vector (6 downto 0);
	HEX4				: out std_logic_vector (6 downto 0);
	HEX5				: out std_logic_vector (6 downto 0);
	HEX6				: out std_logic_vector (6 downto 0);
	HEX7				: out std_logic_vector (6 downto 0);

	--  Memory (SRAM)
	SRAM_ADDR			: out std_logic_vector (19 downto 0);
	SRAM_CE_N			: out std_logic;
	SRAM_WE_N			: out std_logic;
	SRAM_OE_N			: out std_logic;
	SRAM_UB_N			: out std_logic;
	SRAM_LB_N			: out std_logic;

	
	-- Memory (SDRAM)
	DRAM_ADDR			: out std_logic_vector (12 downto 0);
	DRAM_BA				: out std_logic_vector (1 downto 0);
	DRAM_CAS_N			: out std_logic;
	DRAM_RAS_N			: out std_logic;
	DRAM_CLK			: out std_logic;
	DRAM_CKE			: out std_logic;
	DRAM_CS_N			: out std_logic;
	DRAM_WE_N			: out std_logic;
	DRAM_DQM			: out std_logic_vector (3 downto 0);

	--  Char LCD 16x2
	LCD_ON				: out std_logic;
	LCD_BLON			: out std_logic;
	LCD_EN				: out std_logic;
	LCD_RS				: out std_logic;
	LCD_RW				: out std_logic
	
		
	);
end final_project;


architecture DE2_115_Media_Computer_rtl of final_project is

-------------------------------------------------------------------------------
--						   Subentity Declarations						  --
-------------------------------------------------------------------------------
		component lcd_display is
		port (
			SRAM_DQ_to_and_from_the_SRAM           : inout std_logic_vector(15 downto 0) := (others => 'X'); -- DQ
			SRAM_ADDR_from_the_SRAM                : out   std_logic_vector(19 downto 0);                    -- ADDR
			SRAM_LB_N_from_the_SRAM                : out   std_logic;                                        -- LB_N
			SRAM_UB_N_from_the_SRAM                : out   std_logic;                                        -- UB_N
			SRAM_CE_N_from_the_SRAM                : out   std_logic;                                        -- CE_N
			SRAM_OE_N_from_the_SRAM                : out   std_logic;                                        -- OE_N
			SRAM_WE_N_from_the_SRAM                : out   std_logic;                                        -- WE_N
			LCD_DATA_to_and_from_the_Char_LCD_16x2 : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- DATA
			LCD_ON_from_the_Char_LCD_16x2          : out   std_logic;                                        -- ON
			LCD_BLON_from_the_Char_LCD_16x2        : out   std_logic;                                        -- BLON
			LCD_EN_from_the_Char_LCD_16x2          : out   std_logic;                                        -- EN
			LCD_RS_from_the_Char_LCD_16x2          : out   std_logic;                                        -- RS
			LCD_RW_from_the_Char_LCD_16x2          : out   std_logic;                                        -- RW
			sys_clk                                : out   std_logic;                                        -- clk
			reset_n                                : in    std_logic                     := 'X';             -- reset_n
			zs_addr_from_the_SDRAM                 : out   std_logic_vector(12 downto 0);                    -- addr
			zs_ba_from_the_SDRAM                   : out   std_logic_vector(1 downto 0);                     -- ba
			zs_cas_n_from_the_SDRAM                : out   std_logic;                                        -- cas_n
			zs_cke_from_the_SDRAM                  : out   std_logic;                                        -- cke
			zs_cs_n_from_the_SDRAM                 : out   std_logic;                                        -- cs_n
			zs_dq_to_and_from_the_SDRAM            : inout std_logic_vector(31 downto 0) := (others => 'X'); -- dq
			zs_dqm_from_the_SDRAM                  : out   std_logic_vector(3 downto 0);                     -- dqm
			zs_ras_n_from_the_SDRAM                : out   std_logic;                                        -- ras_n
			zs_we_n_from_the_SDRAM                 : out   std_logic;                                        -- we_n
			clk                                    : in    std_logic                     := 'X';             -- clk
			clk_27                                 : in    std_logic                     := 'X';             -- clk
			sdram_clk                              : out   std_logic;                                        -- clk
			top_row_export                         : in    std_logic_vector(15 downto 0) := (others => 'X'); -- export
			bottom_row_export                      : in   std_logic_vector(15 downto 0);                    -- export
			location_export                        : in    std_logic                     := 'X'              -- export
		);
	end component lcd_display;

component pll1
	PORT
	(
		inclk0		: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC 
	);
end component;

component hex_display IS
 	PORT ( number : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
 		   display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END component;

component debounce is
	port(
	clk, d : in std_logic;
	q : out std_logic);
end component debounce;		



	signal top_row : std_logic_vector(15 downto 0) := x"1010";
	signal bottom_row : std_logic_vector(15 downto 0) := x"8081";
	signal score : std_logic_vector(15 downto 0) := x"0000";
	signal location : std_logic;
	signal sys_clk1 : std_logic;
	signal control : std_logic;
	signal reset : std_logic := '1';
begin


-- Initialize LED displays
LEDR <= SW(17) & "00000000000000" & SW(2 downto 0);
HEX4 <= "1000000";
HEX5 <= "1000000";
HEX6 <= "1000000";
HEX7 <= "1000000";

hex_0 : hex_display port map (score(3 downto 0),HEX0);
hex_1 : hex_display port map (score(7 downto 4),HEX1);
hex_2 : hex_display port map (score(11 downto 8),HEX2);
hex_3 : hex_display port map (score(15 downto 12),HEX3);

res : debounce port map (CLOCK_50, KEY(0), reset);

pll : pll1 port map(CLOCK_50, sys_clk1);

NiosII : lcd_display
	port map(
		-- 1) global signals:
		clk	   									=> CLOCK_50,
		clk_27 									=> TD_CLK27,
		reset_n									=> KEY(0),
		sdram_clk								=> DRAM_CLK,


		-- the_Char_LCD_16x2
		LCD_DATA_to_and_from_the_Char_LCD_16x2	=> LCD_DATA,
		LCD_ON_from_the_Char_LCD_16x2			=> LCD_ON,
		LCD_BLON_from_the_Char_LCD_16x2			=> LCD_BLON,
		LCD_EN_from_the_Char_LCD_16x2			=> LCD_EN,
		LCD_RS_from_the_Char_LCD_16x2			=> LCD_RS,
		LCD_RW_from_the_Char_LCD_16x2			=> LCD_RW,

		-- the_SDRAM
		zs_addr_from_the_sdram					=> DRAM_ADDR,
		zs_ba_from_the_sdram					=> DRAM_BA,
		zs_cas_n_from_the_sdram					=> DRAM_CAS_N,
		zs_cke_from_the_sdram					=> DRAM_CKE,
		zs_cs_n_from_the_sdram					=> DRAM_CS_N,
		zs_dq_to_and_from_the_sdram				=> DRAM_DQ,
		zs_dqm_from_the_sdram					=> DRAM_DQM,
		zs_ras_n_from_the_sdram					=> DRAM_RAS_N,
		zs_we_n_from_the_sdram					=> DRAM_WE_N,
		
		-- the_SRAM
		SRAM_ADDR_from_the_SRAM					=> SRAM_ADDR,
		SRAM_CE_N_from_the_SRAM					=> SRAM_CE_N,
		SRAM_DQ_to_and_from_the_SRAM			=> SRAM_DQ,
		SRAM_LB_N_from_the_SRAM					=> SRAM_LB_N,
		SRAM_OE_N_from_the_SRAM					=> SRAM_OE_N,
		SRAM_UB_N_from_the_SRAM 				=> SRAM_UB_N,
		SRAM_WE_N_from_the_SRAM 				=> SRAM_WE_N,
	
		top_row_export => top_row,
		bottom_row_export => bottom_row,
		location_export => SW(17)
	);
	
	process(control, LEDG)
	begin
	if rising_edge(control) then
		if LEDG(8) = '1' then
			score <= x"0000";
		else
			score <= score+1;
		end if;
	end if;
		
	end process;
	
	
	process(control)
	begin
	
	
	
	LEDG <= "000000001";
		if(top_row(15) = '1' or bottom_row(15) = '1') then
			if(SW(17) = '1') then
				if(SW(17) = top_row(15)) then
					if (score > 0) then
					LEDG <= "100000001";
					else
					LEDG <= "000000001";
					end if;
				end if;
			else
				if(not SW(17) = bottom_row(15)) then
					if (score > 0) then
					LEDG <= "100000001";
					else
					LEDG <= "000000001";
					end if;
				end if;
			end if;
		end if;
			
	if rising_edge(control) then
	top_row <= std_logic_vector(rotate_left(unsigned(top_row),1));
	bottom_row <= std_logic_vector(rotate_left(unsigned(bottom_row),1));
	end if;

	end process;
	
	process(sys_clk1, reset)
	variable count : integer :=1;
	variable speed : unsigned(31 downto 0) := x"00000000";
	begin 
	speed(2 downto 0) := unsigned(SW(2 downto 0));
		if reset='0' then   
			count := 1;
			control <= '0';
		else
		if(rising_edge(sys_clk1)) then
			if (count = (16384*(10-speed))) then
				count := 0;
				control <= '1';
			else
				control <= '0';
			end if;
			
			count := count+1; 
		 end if;
			
		end if;
		
	end process;   
	
end DE2_115_Media_Computer_rtl;

