----------------------------------------------------------
--
--! @title Full adder
--! @author Tomas Fryza
--! Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
--!
--! @copyright (c) 2019 Tomas Fryza
--! This work is licensed under the terms of the MIT license
--!
--! Implementation of full adder.
--
-- Hardware: Nexys A7-50T, xc7a50ticsg324-1L
-- Software: TerosHDL, Vivado 2020.2, EDA Playground

library ieee;
  use ieee.std_logic_1164.all;

----------------------------------------------------------
-- Entity declaration for full adder
----------------------------------------------------------

entity full_adder is
  port (
    a        : in    std_logic;
    b        : in    std_logic;
    carry_in : in    std_logic;
    sum      : out   std_logic;
    carry    : out   std_logic
  );
end entity full_adder;

----------------------------------------------------------
-- Architecture body for full adder
----------------------------------------------------------

architecture behavioral of full_adder is

  -- Internal signals between half adders
  signal sig_sum0_a1 : std_logic;  -- From sum0 to a1
  signal sig_carry0  : std_logic;
  signal sig_carry1  : std_logic;

begin

  --------------------------------------------------------
  -- Instance (copy) of the first half adder
  half_adder0 : entity work.half_adder
    port map (
      a     => a,
      b     => b,
      sum   => sig_sum0_a1,
      carry => sig_carry0
    );

  --------------------------------------------------------
  -- Instance (copy) of the second half adder
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
