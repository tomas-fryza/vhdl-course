--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:30:23 03/13/2020
-- Design Name:   
-- Module Name:   /home/fryza/GIT/Digital-electronics-1/Labs/07-stopwatch/stopwatch/stopwatch_tb.vhd
-- Project Name:  stopwatch
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: stopwatch
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
 
ENTITY stopwatch_tb IS
END stopwatch_tb;
 
ARCHITECTURE behavior OF stopwatch_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT stopwatch
    PORT(
         clk_i : IN  std_logic;
         srst_n_i : IN  std_logic;
         ce_100Hz_i : IN  std_logic;
         cnt_en_i : IN  std_logic;
         sec_h_o : OUT  std_logic_vector(3 downto 0);
         sec_l_o : OUT  std_logic_vector(3 downto 0);
         hth_h_o : OUT  std_logic_vector(3 downto 0);
         hth_l_o : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal srst_n_i : std_logic := '0';
   signal ce_100Hz_i : std_logic := '0';
   signal cnt_en_i : std_logic := '0';

 	--Outputs
   signal sec_h_o : std_logic_vector(3 downto 0);
   signal sec_l_o : std_logic_vector(3 downto 0);
   signal hth_h_o : std_logic_vector(3 downto 0);
   signal hth_l_o : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: stopwatch PORT MAP (
          clk_i => clk_i,
          srst_n_i => srst_n_i,
          ce_100Hz_i => ce_100Hz_i,
          cnt_en_i => cnt_en_i,
          sec_h_o => sec_h_o,
          sec_l_o => sec_l_o,
          hth_h_o => hth_h_o,
          hth_l_o => hth_l_o
        );

   -- Clock process definitions
	Clk_gen: process
  	begin
    	while Now < 150000 NS loop
      		clk_i <= '0';
      		wait for 5 NS;
      		clk_i <= '1';
      		wait for 5 NS;
    	end loop;
    	wait;
  	end process Clk_gen;
--   clk_i_process :process
--   begin
--		clk_i <= '0';
--		wait for clk_i_period/2;
--		clk_i <= '1';
--		wait for clk_i_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      -- insert stimulus here
        srst_n_i <= '1';
        ce_100Hz_i <= '1';
        cnt_en_i <= '1';
        wait until rising_edge(clk_i);
        wait until rising_edge(clk_i);
        srst_n_i <= '0';
        wait until rising_edge(clk_i);
        wait until rising_edge(clk_i);
        wait until rising_edge(clk_i);
        srst_n_i <= '1';
        wait;
   end process;

END;
