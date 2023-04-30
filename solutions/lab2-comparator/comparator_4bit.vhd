--! @title Binary comparator
--! @author Tomas Fryza
--! Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
--! @version 0.2
--! @date 2023-04-30
--!
--! @copyright Copyright (c) 2020 by Tomas Fryza
--! This work is licensed under the terms of the MIT license.
--!
--! A digital or **binary comparator** compares the digital
--! signals A, B presented at input terminal and produce
--! outputs depending upon the condition of those inputs.
--! Four-bit binary comparator use `when/else` assignments to
--! distinguish three states between two 4-bit inputs: greater
--! than, equal, and less than.
--!
--! Wavedrom example, see <https://wavedrom.com/>:
--! {signal: [
--!  {name: 'b[3:0]', wave: 'x333333', data: ['0','3','8','9','a','7']},
--!  {name: 'a[3:0]', wave: 'x333333', data: ['0','c','9','3','a','6']},
--!  {},
--!  {name: 'b_greater', wave: 'xl..hlh'},
--!  {name: 'b_a_equal', wave: 'xhl..hl'},
--!  {name: 'a_greater', wave: 'xlh.l..'},
--! ]}
--!
--! @details
--! Tested on Nexys A7-50T board, xc7a50ticsg324-1L FPGA
--! Software: TerosHDL, Vivado 2020.2, EDA Playground

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
