--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:55:23 02/27/2020
-- Design Name:   
-- Module Name:   /home/lab661/Documents/fryza/Digital-electronics-1/Labs/04-adder/binary_adder/full_adder_tb00.vhd
-- Project Name:  binary_adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: full_adder
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
 
ENTITY full_adder_tb00 IS
END full_adder_tb00;
 
ARCHITECTURE behavior OF full_adder_tb00 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder
    PORT(
         carry_i : IN  std_logic;
         b_i : IN  std_logic;
         a_i : IN  std_logic;
         carry_o : OUT  std_logic;
         sum_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal carry_i : std_logic := '0';
   signal b_i : std_logic := '0';
   signal a_i : std_logic := '0';

 	--Outputs
   signal carry_o : std_logic;
   signal sum_o : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
          carry_i => carry_i,
          b_i => b_i,
          a_i => a_i,
          carry_o => carry_o,
          sum_o => sum_o
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
        carry_i <= '0';
        b_i     <= '0';
        a_i     <= '0'; wait for 100 ns;
        carry_i <= '0';
        b_i     <= '0';
        a_i     <= '1'; wait for 100 ns;
        carry_i <= '0';
        b_i     <= '1';
        a_i     <= '0'; wait for 100 ns;
        carry_i <= '0';
        b_i     <= '1';
        a_i     <= '1'; wait for 100 ns;
        carry_i <= '1';
        b_i     <= '0';
        a_i     <= '0'; wait for 100 ns;
        carry_i <= '1';
        b_i     <= '0';
        a_i     <= '1'; wait for 100 ns;
        carry_i <= '1';
        b_i     <= '1';
        a_i     <= '0'; wait for 100 ns;
        carry_i <= '1';
        b_i     <= '1';
        a_i     <= '1'; wait for 100 ns;

--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
