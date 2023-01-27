------------------------------------------------------------
--
--! @title Binary comparator
--! @author Tomas Fryza, Dept. of Radio Electronics, Brno 
--!         Univ. of Technology, Czechia
--!
--! @copyright (c) 2020 Tomas Fryza, This work is licensed 
--!                under the terms of the MIT license
--!
--! Four-bit binary comparator using when/else
--! assignments. The comparator can distinguish three states
--! between two 4-bit inputs: greater than, equal, and less than.
--!
--! Wavedrom example:
--! {signal: [
--! {name: 'b_i[3:0]', wave: 'x333333', data: ['0','3','8','9','a','7']},
--! {name: 'a_i[3:0]', wave: 'x333333', data: ['0','c','9','3','a','6']},
--! {},
--! {name: 'b_greater_a_o', wave: 'xl..hlh'},
--! {name: 'b_equals_a_o',  wave: 'xhl..hl'},
--! {name: 'b_less_a_o',    wave: 'xlh.l..'},
--! ]}
--
-- Hardware: Nexys A7-50T, xc7a50ticsg324-1L
-- Software: Vivado v2018.3, EDA Playground, TerosHDL
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
        B_less_A_o    : out std_logic  --! Output is `1` if B<A
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
