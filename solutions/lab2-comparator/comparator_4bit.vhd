------------------------------------------------------------
--
--! @title Binary comparator
--! @author Tomas Fryza
--! Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
--!
--! @copyright (c) 2020 Tomas Fryza
--! This work is licensed under the terms of the MIT license
--!
--! Four-bit binary comparator using when/else
--! assignments. The comparator can distinguish three states
--! between two 4-bit inputs: greater than, equal, and less than.
--!
--! Wavedrom example:
--! {signal: [
--! {name: 'b[3:0]', wave: 'x333333', data: ['0','3','8','9','a','7']},
--! {name: 'a[3:0]', wave: 'x333333', data: ['0','c','9','3','a','6']},
--! {},
--! {name: 'B_greater_A', wave: 'xl..hlh'},
--! {name: 'B_equals_A',  wave: 'xhl..hl'},
--! {name: 'B_less_A',    wave: 'xlh.l..'},
--! ]}
--
-- Hardware: Nexys A7-50T, xc7a50ticsg324-1L
-- Software: TerosHDL, Vivado 2020.2
--
------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for 4-bit binary comparator
------------------------------------------------------------

entity comparator_4bit is
  port (
    b           : in    std_logic_vector(3 downto 0); --! Input data B[3:0]
    a           : in    std_logic_vector(3 downto 0); --! Input data A[3:0]
    b_greater_a : out   std_logic;                    --! Output is `1` if B>A
    b_equals_a  : out   std_logic;                    --! Output is `1` if B=A
    b_less_a    : out   std_logic                     --! Output is `1` if B<A
  );
end entity comparator_4bit;

------------------------------------------------------------
-- Architecture body for 4-bit binary comparator
------------------------------------------------------------

architecture behavioral of comparator_4bit is

begin

  b_greater_a <= '1' when (b > a) else
                 '0';
  b_equals_a  <= '1' when (b = a) else
                 '0';
  b_less_a    <= '1' when (b < a) else
                 '0';

end architecture behavioral;
