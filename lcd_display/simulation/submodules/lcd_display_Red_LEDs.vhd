LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_misc.all;

-- ******************************************************************************
-- * License Agreement                                                          *
-- *                                                                            *
-- * Copyright (c) 1991-2013 Altera Corporation, San Jose, California, USA.     *
-- * All rights reserved.                                                       *
-- *                                                                            *
-- * Any megafunction design, and related net list (encrypted or decrypted),    *
-- *  support information, device programming or simulation file, and any other *
-- *  associated documentation or information provided by Altera or a partner   *
-- *  under Altera's Megafunction Partnership Program may be used only to       *
-- *  program PLD devices (but not masked PLD devices) from Altera.  Any other  *
-- *  use of such megafunction design, net list, support information, device    *
-- *  programming or simulation file, or any other related documentation or     *
-- *  information is prohibited for any other purpose, including, but not       *
-- *  limited to modification, reverse engineering, de-compiling, or use with   *
-- *  any other silicon devices, unless such use is explicitly licensed under   *
-- *  a separate agreement with Altera or a megafunction partner.  Title to     *
-- *  the intellectual property, including patents, copyrights, trademarks,     *
-- *  trade secrets, or maskworks, embodied in any such megafunction design,    *
-- *  net list, support information, device programming or simulation file, or  *
-- *  any other related documentation or information provided by Altera or a    *
-- *  megafunction partner, remains with Altera, the megafunction partner, or   *
-- *  their respective licensors.  No other licenses, including any licenses    *
-- *  needed under any third party's intellectual property, are provided herein.*
-- *  Copying or modifying any file, or portion thereof, to which this notice   *
-- *  is attached violates this copyright.                                      *
-- *                                                                            *
-- * THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    *
-- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   *
-- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    *
-- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER *
-- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING    *
-- * FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS  *
-- * IN THIS FILE.                                                              *
-- *                                                                            *
-- * This agreement shall be governed in all respects by the laws of the State  *
-- *  of California and by the laws of the United States of America.            *
-- *                                                                            *
-- ******************************************************************************

-- ******************************************************************************
-- *                                                                            *
-- * This module can read and/or write data to a parallel I/O port based        *
-- *  on various user selected parameters. It has some predefined               *
-- *  configurations for some devices on the Altera DE boards.                  *
-- *                                                                            *
-- ******************************************************************************

ENTITY lcd_display_Red_LEDs IS

-- *****************************************************************************
-- *                             Generic Declarations                          *
-- *****************************************************************************
	
GENERIC (
	
	-- DW represents the Data Width minus 1
	DW	:INTEGER									:= 17
	
);
-- *****************************************************************************
-- *                             Port Declarations                             *
-- *****************************************************************************
PORT (
	-- Inputs
	clk			:IN		STD_LOGIC;
	reset			:IN		STD_LOGIC;

	address		:IN		STD_LOGIC_VECTOR( 1 DOWNTO  0);	
	byteenable	:IN		STD_LOGIC_VECTOR( 3 DOWNTO  0);	
	chipselect	:IN		STD_LOGIC;
	read			:IN		STD_LOGIC;
	write			:IN		STD_LOGIC;
	writedata	:IN		STD_LOGIC_VECTOR(31 DOWNTO  0);	


	-- Bidirectionals

	-- Outputs
	LEDR			:BUFFER	STD_LOGIC_VECTOR(DW DOWNTO  0);	

	readdata		:BUFFER	STD_LOGIC_VECTOR(31 DOWNTO  0)	

);

END lcd_display_Red_LEDs;

ARCHITECTURE Behaviour OF lcd_display_Red_LEDs IS
-- *****************************************************************************
-- *                           Constant Declarations                           *
-- *****************************************************************************

-- *****************************************************************************
-- *                       Internal Signals Declarations                       *
-- *****************************************************************************
	-- Internal Wires
	
	-- Internal Registers
	SIGNAL	data				:STD_LOGIC_VECTOR(31 DOWNTO  0);	
	
	SIGNAL	data_in			:STD_LOGIC_VECTOR(DW DOWNTO  0);	
	SIGNAL	data_out			:STD_LOGIC_VECTOR(DW DOWNTO  0);	
	
	
	-- State Machine Registers
	
	-- Internal Variables
	--VARIABLE	i					:INTEGER;
	
	
-- *****************************************************************************
-- *                          Component Declarations                           *
-- *****************************************************************************
BEGIN
-- *****************************************************************************
-- *                         Finite State Machine(s)                           *
-- *****************************************************************************


-- *****************************************************************************
-- *                             Sequential Logic                              *
-- *****************************************************************************

	-- Input Registers
	PROCESS (clk)
	BEGIN
		IF clk'EVENT AND clk = '1' THEN
			data_in <= data(DW DOWNTO  0);
		END IF;
	END PROCESS;


	-- Output Registers

	PROCESS (clk)
	BEGIN
		IF clk'EVENT AND clk = '1' THEN
			IF (reset = '1') THEN
				readdata <= B"00000000000000000000000000000000";
			ELSIF (chipselect = '1') THEN
				IF (address = B"00") THEN
					readdata <= ((31 DOWNTO (DW + 1) => '0') & data_in);
				ELSE
					readdata <= B"00000000000000000000000000000000";
				END IF;
			END IF;
		END IF;
	END PROCESS;


	-- Internal Registers
	PROCESS (clk)
	BEGIN
		IF clk'EVENT AND clk = '1' THEN
			IF (reset = '1') THEN
				data <= (OTHERS => '0');
			ELSIF ((chipselect = '1') AND 
					(write = '1') AND 
					(address = B"00")) THEN
				IF (byteenable(0) = '1') THEN
					data( 7 DOWNTO  0) <= writedata( 7 DOWNTO  0);
				END IF;	
			
				IF (byteenable(1) = '1') THEN
					data(15 DOWNTO  8) <= writedata(15 DOWNTO  8);
				END IF;
			
				IF (byteenable(2) = '1') THEN
					data(23 DOWNTO 16) <= writedata(23 DOWNTO 16);
				END IF;		
			
				IF (byteenable(3) = '1') THEN
					data(31 DOWNTO 24) <= writedata(31 DOWNTO 24);
				END IF;
			END IF;
		END IF;
	END PROCESS;





	PROCESS (clk)
	BEGIN
		IF clk'EVENT AND clk = '1' THEN
				data_out <= data(DW DOWNTO  0);
		END IF;
	END PROCESS;


-- *****************************************************************************
-- *                            Combinational Logic                            *
-- *****************************************************************************

	-- Output Assignments

	LEDR <= data_out;

	-- Internal Assignments

-- *****************************************************************************
-- *                          Component Instantiations                         *
-- *****************************************************************************



END Behaviour;

