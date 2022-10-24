------------------------------------------------------------
--
--! Example of 4-bit binary comparator using the when/else
--! assignments.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- Vivado v2018.3, EDA Playground, TerosHDL
--
--! @copyright 2020-Present Tomas Fryza
--! Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
--! This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for 4-bit binary comparator
------------------------------------------------------------
entity comparator_4bit is
    port (
        b_i           : in std_logic_vector(3 downto 0); --! Input data B
        a_i           : in std_logic_vector(3 downto 0); --! Input data A
        B_greater_A_o : out std_logic; --! Output is `1` if B>A
        B_equals_A_o  : out std_logic; --! Output is `1` if B=A
        B_less_A_o    : out std_logic --! Output is `1` if B<A
    );
end entity comparator_4bit;

------------------------------------------------------------
-- Architecture body for 4-bit binary comparator
------------------------------------------------------------
architecture Behavioral of comparator_4bit is
begin
    B_greater_A_o <= '1' when (b_i > a_i) else '0';
    B_equals_A_o  <= '1' when (b_i = a_i) else '0';
    B_less_A_o    <= '1' when (b_i < a_i) else '0';
end architecture Behavioral;
