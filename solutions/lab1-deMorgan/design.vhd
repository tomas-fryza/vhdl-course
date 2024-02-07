--------------------------------------------------
--
-- Example of basic gates in VHDL.
-- TerosHDL, EDA Playground, Vivado
--
-- Copyright (c) 2019 Tomas Fryza
-- Dept. of Radio Electronics
-- Brno Univ. of Technology, Czechia
--
-- MIT license
--
--------------------------------------------------

library ieee; -- Standard library
  -- Package for data type and logic operations
  use ieee.std_logic_1164.all;

--------------------------------------------------
-- Entity declaration for basic gates
--------------------------------------------------

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

--------------------------------------------------
-- Architecture body for basic gates
--------------------------------------------------

architecture behavioral of gates is

begin

  f_orig <= not(c and b) or (not(b) and a);

  -- Use DeMorgans laws and modify the functions
  f_nand <= not((c and b) and not(not(b) and a));
  f_nor  <= (not(c) or not(b)) or not(b or not(a));

end architecture behavioral;
