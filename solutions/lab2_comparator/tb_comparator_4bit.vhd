------------------------------------------------------------
--
-- Testbench for 4-bit binary comparator.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- Vivado v2018.3, EDA Playground, TerosHDL
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_comparator_4bit is
    -- Entity of testbench is always empty
end entity tb_comparator_4bit;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_comparator_4bit is

    -- Testbench local signals
    signal s_a           : std_logic_vector(4 - 1 downto 0);
    signal s_b           : std_logic_vector(4 - 1 downto 0);
    signal s_B_greater_A : std_logic;
    signal s_B_equals_A  : std_logic;
    signal s_B_less_A    : std_logic;

begin
    -- Connecting testbench signals with comparator_4bit
    -- entity (Unit Under Test)
    uut_comparator_4bit : entity work.comparator_4bit
        port map(
            a_i           => s_a,
            b_i           => s_b,
            B_greater_A_o => s_B_greater_A,
            B_equals_A_o  => s_B_equals_A,
            B_less_A_o    => s_B_less_A
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case ...
        s_b <= "0000";
        s_a <= "0000";
        wait for 100 ns;
        -- ... and its expected outputs
        assert (
        (s_B_greater_A = '0') and
        (s_B_equals_A = '1') and
        (s_B_less_A = '0')
        )
        -- If false, then report an error
        -- If true, then do not report anything
        report "Input combination 0000, 0000 FAILED" severity error;

        -- WRITE OTHER TEST CASES HERE
        s_b <= "0011";
        s_a <= "1100";
        wait for 100 ns;
        assert (
        (s_B_greater_A = '0') and
        (s_B_equals_A = '0') and
        (s_B_less_A = '1')
        )
        report "Input combination 0011, 1100 FAILED" severity error;

        s_b <= "1000";
        s_a <= "1001";
        wait for 100 ns;
        assert (
        (s_B_greater_A = '0') and
        (s_B_equals_A = '0') and
        (s_B_less_A = '1')
        )
        report "Input combination 1000, 1001 FAILED" severity error;

        s_b <= "1001";
        s_a <= "1000";
        wait for 100 ns;
        assert (
        (s_B_greater_A = '1') and
        (s_B_equals_A = '0') and
        (s_B_less_A = '0')
        )
        report "Input combination 1001, 1000 FAILED" severity error;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait; -- Data generation process is suspended forever
    end process p_stimulus;

end architecture testbench;