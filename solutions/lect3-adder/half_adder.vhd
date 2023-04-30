--! @title Half adder
--! @author Tomas Fryza
--! Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
--! @version 0.2
--! @date 2023-04-30
--!
--! @copyright Copyright (c) 2019 by Tomas Fryza
--! This work is licensed under the terms of the MIT license.
--!
--! A **half adder** is a digital logic circuit that performs
--! binary addition of two single-bit binary numbers A and B.
--! The SUM output is the least significant bit (LSB) of the
--! result, while the CARRY output is the most significant bit
--! (MSB) of the result, indicating whether there was a
--! carry-over from the addition of the two inputs.
--! See <https://www.geeksforgeeks.org/half-adder-in-digital-logic/>
--!
--! | b  | a  | carry | sum  |
--! |:--:|:--:| :--:  | :--: |
--! | 0 | 0 | 0 | 0 |
--! | 0 | 1 | 0 | 1 |
--! | 1 | 0 | 0 | 1 |
--! | 1 | 1 | 1 | 1 |
--!
--! @details
--! Hardware: None, just simulator
--! Software: TerosHDL, Vivado 2020.2, EDA Playground

library ieee;
  use ieee.std_logic_1164.all;

----------------------------------------------------------
-- Entity declaration for half adder
----------------------------------------------------------

entity half_adder is
  port (
    a     : in    std_logic; --! A input
    b     : in    std_logic; --! B input
    sum   : out   std_logic; --! LSB of result
    carry : out   std_logic  --! Output carry
  );
end entity half_adder;

----------------------------------------------------------
-- Architecture body for full adder
----------------------------------------------------------

architecture behavioral of half_adder is

begin

  sum   <= a xor b;
  carry <= a and b;

end architecture behavioral;
