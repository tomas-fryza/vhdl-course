------------------------------------------------------------------------
--
-- Full adder.
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
-- Entity declaration for full adder
------------------------------------------------------------------------
entity full_adder is
port (
    carry_i : in  std_logic;
    b_i     : in  std_logic;
    a_i     : in  std_logic;
    carry_o : out std_logic;
    sum_o   : out std_logic
);
end entity full_adder;

------------------------------------------------------------------------
-- Architecture declaration for full adder
------------------------------------------------------------------------
architecture Behavioral of full_adder is
    -- Internal signals between two half adders
    signal s_carry0, s_carry1, s_sum0 : std_logic;
begin

    --------------------------------------------------------------------
    -- Sub-blocks of two half_adder entities
    HALF_ADDER_0 : entity work.half_adder
    port map (
        -- <component_signal> => <actual_signal>,
        -- <component_signal> => <actual_signal>,
        -- <other signals>...
        -- WRITE YOUR CODE HERE
        b_i     => b_i,
        a_i     => a_i,
        carry_o => s_carry0,
        sum_o   => s_sum0
    );

    HALF_ADDER_1 : entity work.half_adder
    port map (
        -- WRITE YOUR CODE HERE
        b_i     => carry_i,
        a_i     => s_sum0,
        carry_o => s_carry1,
        sum_o   => sum_o
    );

    -- Output carry
    -- WRITE YOUR CODE HERE
    carry_o <= s_carry0 or s_carry1;

end architecture Behavioral;
