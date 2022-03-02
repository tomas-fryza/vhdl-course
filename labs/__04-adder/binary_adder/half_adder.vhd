------------------------------------------------------------------------
--
-- Half adder.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for half adder
------------------------------------------------------------------------
entity half_adder is
port (
    b_i     : in  std_logic;
    a_i     : in  std_logic;
    carry_o : out std_logic;
    sum_o   : out std_logic
);
end entity half_adder;

------------------------------------------------------------------------
-- Architecture declaration for half adder
------------------------------------------------------------------------
architecture Behavioral of half_adder is
begin
    -- Logic functions for carry and sum outputs
    -- WRITE YOUR CODE HERE
    carry_o <= b_i and a_i;
    sum_o   <= b_i xor a_i;
end architecture Behavioral;
