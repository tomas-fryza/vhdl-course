------------------------------------------------------------
--
-- Testbench for 7-segment display decoder.
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
use ieee.numeric_std.all; -- Definition of "to_unsigned"

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_hex_7seg is
    -- Entity of testbench is always empty
end entity tb_hex_7seg;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_hex_7seg is

    -- Local signals
    signal s_blank : std_logic;
    signal s_hex   : std_logic_vector(3 downto 0);
    signal s_seg   : std_logic_vector(6 downto 0);

begin
    -- Connecting testbench signals with decoder entity
    -- (Unit Under Test)
    uut_hex_7seg : entity work.hex_7seg
        port map(
            blank_i => s_blank,
            hex_i   => s_hex,
            seg_o   => s_seg
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started";

        s_blank <= '0'; -- Normal operation
        s_hex   <= "0011"; -- Some default value
        wait for 50 ns;

        s_blank <= '1'; -- Blank display
        wait for 150 ns;
        s_blank <= '0'; -- Normal operation

        -- Loop for all hex values
        for ii in 0 to 15 loop
            -- Convert ii decimal value to 4-bit wide binary
            -- s_hex <= std_logic_vector(to_unsigned(ii, s_hex'length));
            s_hex <= std_logic_vector(to_unsigned(ii, 4));
            wait for 50 ns;
        end loop;

        report "Stimulus process finished";
        wait;
    end process p_stimulus;

end architecture testbench;