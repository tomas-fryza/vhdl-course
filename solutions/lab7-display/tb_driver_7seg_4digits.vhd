------------------------------------------------------------
--
-- Template for 4-digit 7-segment display driver testbench.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_driver_7seg_4digits is
    -- Entity of testbench is always empty
end entity tb_driver_7seg_4digits;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_driver_7seg_4digits is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    -- Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset      : std_logic;
    signal s_data0  : std_logic_vector(3 downto 0);
    signal s_data1  : std_logic_vector(3 downto 0);
    signal s_data2  : std_logic_vector(3 downto 0);
    signal s_data3  : std_logic_vector(3 downto 0);
    signal s_dp_in  : std_logic_vector(3 downto 0);
    signal s_dp_out : std_logic;
    signal s_seg    : std_logic_vector(6 downto 0);
    signal s_dig    : std_logic_vector(3 downto 0);

begin
    -- Connecting testbench signals with driver_7seg_4digits
    -- entity (Unit Under Test)
    uut_driver_7seg_4digits : entity work.driver_7seg_4digits
        port map(
            clk     => s_clk_100MHz,
            reset   => s_reset,
            data0_i => s_data0,
            data1_i => s_data1,
            data2_i => s_data2,
            data3_i => s_data3,
            dp_i    => s_dp_in,
            dp_o    => s_dp_out,
            seg_o   => s_seg,
            dig_o   => s_dig
        );

    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 400 ns loop -- 40 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    p_reset_gen : process
    begin
        -- WRITE YOUR CODE HERE AND ACTIVATE RESET FOR A WHILE
        s_reset <= '0';
        wait for 12 ns;

        s_reset <= '1'; -- Reset activated
        wait for 73 ns;

        s_reset <= '0'; -- Reset deactivated
        wait;
    end process p_reset_gen;

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started";

        -- WRITE YOUR CODE HERE AND TEST INPUT VALUE "3.142"
        -- Display "3.142"
        s_dp_in <= "0111"; -- Decimal point
        s_data3 <= x"3";
        s_data2 <= x"1";
        s_data1 <= x"4";
        s_data0 <= x"2";

        report "Stimulus process finished";
        wait;
    end process p_stimulus;

end architecture testbench;