------------------------------------------------------------
--
-- Testbench for basic gates circuit.
-- EDA Playground
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
entity tb_gates is
    -- Entity of testbench is always empty
end entity tb_gates;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_gates is

    -- Testbench local signals
    signal s_c      : std_logic;
    signal s_b      : std_logic;
    signal s_a      : std_logic;
    signal s_f_orig : std_logic;
    signal s_f_nand : std_logic;
    signal s_f_nor  : std_logic;

begin
    -- Connecting testbench signals with gates entity
    -- (Unit Under Test)
    uut_gates : entity work.gates
        port map(
            c_i      => s_c,
            b_i      => s_b,
            a_i      => s_a,
            f_orig_o => s_f_orig,
            f_nand_o => s_f_nand,
            f_nor_o  => s_f_nor
        );

    --------------------------------------------------------
    -- Testing data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin

        -- Set one test case and wait for 100 ns ...
        s_c <= '0';
        s_b <= '0';
        s_a <= '0';
        wait for 100 ns;
        -- ... and then continue with other test cases
        s_c <= '0';
        s_b <= '0';
        s_a <= '1';
        wait for 100 ns;
        s_c <= '0';
        s_b <= '1';
        s_a <= '0';
        wait for 100 ns;
        s_c <= '0';
        s_b <= '1';
        s_a <= '1';
        wait for 100 ns;
        s_c <= '1';
        s_b <= '0';
        s_a <= '0';
        wait for 100 ns;
        s_c <= '1';
        s_b <= '0';
        s_a <= '1';
        wait for 100 ns;
        s_c <= '1';
        s_b <= '1';
        s_a <= '0';
        wait for 100 ns;
        s_c <= '1';
        s_b <= '1';
        s_a <= '1';
        wait for 100 ns;

        wait; -- Generation process is suspended forever
    end process p_stimulus;

end architecture testbench;