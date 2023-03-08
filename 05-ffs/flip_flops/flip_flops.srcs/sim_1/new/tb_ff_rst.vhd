----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2023 11:32:04 AM
-- Design Name: 
-- Module Name: tb_ff_rst - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_ff_rst is
--  Port ( );
end tb_ff_rst;

architecture testbench of tb_ff_rst is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    --Local signals
    signal sig_clk_100MHz : std_logic;
    signal sig_rst        : std_logic;
    signal sig_data       : std_logic;
    signal sig_dq         : std_logic;
    signal sig_dq_bar     : std_logic;
    signal sig_tq         : std_logic;
    signal sig_tq_bar     : std_logic;

begin
    -- Connecting testbench signals with d_ff_rst entity
    -- (Unit Under Test)
    uut_d_ff_rst : entity work.d_ff_rst
        port map (
            clk   => sig_clk_100MHz,
            rst   => sig_rst,
            d     => sig_data,
            q     => sig_dq,
            q_bar => sig_dq_bar
        );

    -- Connecting testbench signals with t_ff_rst entity
    -- (Unit Under Test)
    uut_t_ff_rst : entity work.t_ff_rst
        port map (
            clk   => sig_clk_100MHz,
            rst   => sig_rst,
            t     => sig_data,
            q     => sig_tq,
            q_bar => sig_tq_bar
        );

    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process is
    begin
        while now < 300 ns loop -- 30 periods of 100MHz clock
            sig_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            sig_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                -- Process is suspended forever
    end process p_clk_gen;

  --------------------------------------------------------
  -- Reset generation process
  --------------------------------------------------------
  p_reset_gen : process is
  begin

    sig_rst <= '0';
    wait for 28 ns;

    -- Reset activated
    sig_rst <= '1';
    wait for 83 ns;

    -- Reset deactivated
    sig_rst <= '0';

    wait;

  end process p_reset_gen;

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";

    sig_data <= '0';
    wait for 47 ns;

    sig_data <= '1';
    wait for 23 ns;

    sig_data <= '0';
    wait for 34 ns;

    sig_data <= '1';
    wait for 69 ns;

    sig_data <= '0';
    wait for 47 ns;

    sig_data <= '1';
    wait for 23 ns;

    sig_data <= '0';
    wait for 47 ns;

    sig_data <= '1';
    wait for 23 ns;

    report "Stimulus process finished";
    wait;

  end process p_stimulus;
end architecture testbench;
