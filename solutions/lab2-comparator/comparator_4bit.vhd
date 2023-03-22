----------------------------------------------------------
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
--! {name: 'b_greater', wave: 'xl..hlh'},
--! {name: 'b_a_equal', wave: 'xhl..hl'},
--! {name: 'a_greater', wave: 'xlh.l..'},
--! ]}
--
-- Hardware: Nexys A7-50T, xc7a50ticsg324-1L
-- Software: TerosHDL, Vivado 2020.2, EDA Playground
--
----------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

----------------------------------------------------------
-- Entity declaration for 4-bit binary comparator
----------------------------------------------------------

entity comparator_4bit is
  port (
    b         : in    std_logic_vector(3 downto 0); --! Input data b[3:0]
    a         : in    std_logic_vector(3 downto 0); --! Input data a[3:0]
    b_greater : out   std_logic;                    --! Output is `1` if b > a
    b_a_equal : out   std_logic;                    --! Output is `1` if b = a
    a_greater : out   std_logic                     --! Output is `1` if b < a
  );
end entity comparator_4bit;

----------------------------------------------------------
-- Architecture body for 4-bit binary comparator
----------------------------------------------------------

architecture behavioral of comparator_4bit is

begin

  b_greater <= '1' when (b > a) else
               '0';
  b_a_equal <= '1' when (b = a) else
               '0';
  a_greater <= '1' when (b < a) else
               '0';

end architecture behavioral;
