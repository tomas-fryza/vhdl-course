--! @title Full adder
--! @author Tomas Fryza
--! Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
--! @version 0.2
--! @date 2023-04-30
--!
--! @copyright Copyright (c) 2019 by Tomas Fryza
--! This work is licensed under the terms of the MIT license.
--!
--! A **full Adder** is the adder that adds three inputs and
--! produces two outputs. The first two inputs are A and B
--! and the third input is an input carry as CARRY_IN. The
--! output carry is designated as CARRY and the normal output
--! is designated as SUM. A 1-bit full adder adds three
--! operands and generates 2-bit results.
--! See <https://www.geeksforgeeks.org/full-adder-in-digital-logic/>
--!
--! | carry_in | b  | a  | carry | sum  |
--! | :--:     |:--:|:--:| :--:  | :--: |
--! | 0 | 0 | 0 | 0 | 0 |
--! | 0 | 0 | 1 | 0 | 1 |
--! | 0 | 1 | 0 | 0 | 1 |
--! | 0 | 1 | 1 | 1 | 0 |
--! | 1 | 0 | 0 | 0 | 1 |
--! | 1 | 0 | 1 | 1 | 0 |
--! | 1 | 1 | 0 | 1 | 0 |
--! | 1 | 1 | 1 | 1 | 1 |
--!
--! @details
--! Hardware: None, just simulator
--! Software: TerosHDL, Vivado 2020.2, EDA Playground

library ieee;
  use ieee.std_logic_1164.all;

----------------------------------------------------------
-- Entity declaration for full adder
----------------------------------------------------------

entity full_adder is
  port (
    a        : in    std_logic; --! A input
    b        : in    std_logic; --! B input
    carry_in : in    std_logic; --! Input carry
    sum      : out   std_logic; --! LSB of result
    carry    : out   std_logic  --! Output carry
  );
end entity full_adder;

----------------------------------------------------------
-- Architecture body for full adder
----------------------------------------------------------

architecture behavioral of full_adder is

  -- Internal signals between half adders
  signal sig_sum0_a1 : std_logic; --! From SUM_0 to A_1
  signal sig_carry0  : std_logic; --! Carry of half adder 0
  signal sig_carry1  : std_logic; --! Carry of half adder 1

begin

  --------------------------------------------------------
  --! Instantiation (copy) of the first half adder
  half_adder0 : entity work.half_adder
    port map (
      a     => a,
      b     => b,
      sum   => sig_sum0_a1,
      carry => sig_carry0
    );

  --------------------------------------------------------
  --! Instantiation (copy) of the second half adder
  half_adder1 : entity work.half_adder
    port map (
      a     => sig_sum0_a1,
      b     => carry_in,
      sum   => sum,
      carry => sig_carry1
    );

  -- Output carry
  carry <= sig_carry0 or sig_carry1;

end architecture behavioral;
