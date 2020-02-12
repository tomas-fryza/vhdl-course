--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:35:56 02/11/2020
-- Design Name:   
-- Module Name:   /home/lab661/Documents/fryza/Digital-electronics-1/Labs/02-ise/comparator/top_tb00.vhd
-- Project Name:  comparator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY top_tb00 IS
END top_tb00;
 
ARCHITECTURE behavior OF top_tb00 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         BTN1 : IN  std_logic;
         BTN0 : IN  std_logic;
         LD2 : OUT  std_logic;
         LD1 : OUT  std_logic;
         LD0 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal BTN1 : std_logic := '0';
   signal BTN0 : std_logic := '0';

 	--Outputs
   signal LD2 : std_logic;
   signal LD1 : std_logic;
   signal LD0 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          BTN1 => BTN1,
          BTN0 => BTN0,
          LD2 => LD2,
          LD1 => LD1,
          LD0 => LD0
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here 
    BTN1 <= '0';
    BTN0 <= '0'; wait for 100 ns;
    
    BTN1 <= '0';
    BTN0 <= '1'; wait for 100 ns;
    
    BTN1 <= '1';
    BTN0 <= '0'; wait for 100 ns;
    
    BTN1 <= '1';
    BTN0 <= '1'; wait for 100 ns;
      wait;
   end process;

END;
