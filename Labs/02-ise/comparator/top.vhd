------------------------------------------------------------------------
--
-- VHDL template for combinational logic circuits.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2018-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for top level
------------------------------------------------------------------------
entity top is
    port (BTN1, BTN0:    in  std_logic;
          LD2, LD1, LD0: out std_logic);
end entity top;

------------------------------------------------------------------------
-- Architecture declaration for top level
------------------------------------------------------------------------
architecture Behavioral of top is
begin
    LD2 <= '1';
    LD1 <= '0';
    LD0 <= not(not(BTN1) and not(BTN0));
end architecture Behavioral;
