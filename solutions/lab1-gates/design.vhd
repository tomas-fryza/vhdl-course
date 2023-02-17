------------------------------------------------------------
--
-- Example of basic gates in VHDL.
-- TerosHDL, EDA Playground
--
-- Copyright (c) 2019 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee; -- Standard library
  use ieee.std_logic_1164.all;
  -- Package for data type and logic operations

------------------------------------------------------------
-- Entity declaration for basic gates
------------------------------------------------------------

entity gates is
  port (
    c      : in    std_logic; -- Three data inputs
    b      : in    std_logic;
    a      : in    std_logic;
    f_orig : out   std_logic; -- Original function
    f_nand : out   std_logic; -- NAND version
    f_nor  : out   std_logic  -- NOR version
  );
end entity gates;

------------------------------------------------------------
-- Architecture body for basic gates
------------------------------------------------------------

architecture dataflow of gates is

begin

  f_orig <= (not(b) and a) or (not(c) and not(b));
  f_nand <= b nand a; -- MODIFY THIS FUNCTION
  f_nor  <= b nor a;  -- MODIFY THIS FUNCTION

end architecture dataflow;
