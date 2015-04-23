
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

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
	LEDG				: out std_logic_vector (8 downto 0);
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
	component lcd_display
		port (
              -- 1) global signals:
                 signal clk : IN STD_LOGIC;
                 signal clk_27 : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal sys_clk : OUT STD_LOGIC;
                 signal sdram_clk : OUT STD_LOGIC;
                 signal audio_clk : OUT STD_LOGIC;

              -- the_Char_LCD_16x2
                 signal LCD_BLON_from_the_Char_LCD_16x2 : OUT STD_LOGIC;
                 signal LCD_DATA_to_and_from_the_Char_LCD_16x2 : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal LCD_EN_from_the_Char_LCD_16x2 : OUT STD_LOGIC;
                 signal LCD_ON_from_the_Char_LCD_16x2 : OUT STD_LOGIC;
                 signal LCD_RS_from_the_Char_LCD_16x2 : OUT STD_LOGIC;
                 signal LCD_RW_from_the_Char_LCD_16x2 : OUT STD_LOGIC;


              -- the_SDRAM
                 signal zs_addr_from_the_SDRAM : OUT STD_LOGIC_VECTOR (12 DOWNTO 0);
                 signal zs_ba_from_the_SDRAM : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal zs_cas_n_from_the_SDRAM : OUT STD_LOGIC;
                 signal zs_cke_from_the_SDRAM : OUT STD_LOGIC;
                 signal zs_cs_n_from_the_SDRAM : OUT STD_LOGIC;
                 signal zs_dq_to_and_from_the_SDRAM : INOUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal zs_dqm_from_the_SDRAM : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal zs_ras_n_from_the_SDRAM : OUT STD_LOGIC;
                 signal zs_we_n_from_the_SDRAM : OUT STD_LOGIC;

              -- the_SRAM
                 signal SRAM_ADDR_from_the_SRAM : OUT STD_LOGIC_VECTOR (19 DOWNTO 0);
                 signal SRAM_CE_N_from_the_SRAM : OUT STD_LOGIC;
                 signal SRAM_DQ_to_and_from_the_SRAM : INOUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal SRAM_LB_N_from_the_SRAM : OUT STD_LOGIC;
                 signal SRAM_OE_N_from_the_SRAM : OUT STD_LOGIC;
                 signal SRAM_UB_N_from_the_SRAM : OUT STD_LOGIC;
                 signal SRAM_WE_N_from_the_SRAM : OUT STD_LOGIC

			  );
	end component;
	

begin


-- Initialize LED displays
LEDR(17 downto 11) <= SW(17 downto 11);
LEDR(9 downto 0) <= "1111111111";
LEDG(8 downto 0) <= "000000001";
HEX0 <= "1000000";
HEX1 <= "1000000";
HEX2 <= "1000000";
HEX3 <= "1000000";
HEX4 <= "1000000";
HEX5 <= "1000000";
HEX6 <= "1000000";
HEX7 <= "1000000";

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
		SRAM_WE_N_from_the_SRAM 				=> SRAM_WE_N
	);
	
end DE2_115_Media_Computer_rtl;

