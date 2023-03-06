----------------------------------------------------------
--
--! @title Half adder
--! @author Tomas Fryza
--! Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
--!
--! @copyright (c) 2019 Tomas Fryza
--! This work is licensed under the terms of the MIT license
--!
--! Implementation of half adder.
--
-- Hardware: Nexys A7-50T, xc7a50ticsg324-1L
-- Software: TerosHDL, Vivado 2020.2, EDA Playground

library ieee;
  use ieee.std_logic_1164.all;

----------------------------------------------------------
-- Entity declaration for half adder
----------------------------------------------------------

entity half_adder is
  port (
    a     : in    std_logic;
    b     : in    std_logic;
    sum   : out   std_logic;
    carry : out   std_logic
  );
end entity half_adder;

----------------------------------------------------------
-- Architecture body for half adder
----------------------------------------------------------

architecture behavioral of half_adder is

begin

  sum   <= a xor b;
  carry <= a and b;

end architecture behavioral;
