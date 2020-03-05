------------------------------------------------------------------------
--
-- Up/down decimal counter with load.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;    -- Provides unsigned numerical computation

------------------------------------------------------------------------
-- Entity declaration for decimal counter
------------------------------------------------------------------------
entity decimal_cnt is
port (
    clk_i    : in  std_logic;
    srst_n_i : in  std_logic;   -- Synchronous reset (active low)
    en_i     : in  std_logic;   -- Enable
    up_i     : in  std_logic    -- Up direction
    -- Load
    -- Data outputs
);
end entity decimal_cnt;

------------------------------------------------------------------------
-- Architecture declaration for decimal counter
------------------------------------------------------------------------
architecture Behavioral of decimal_cnt is
    -- TBD
begin

    --------------------------------------------------------------------
    -- p_decimal_cnt:
    -- Sequential process with synchronous reset and clock enable,
    -- which implements a two-way decimal counter.
    --------------------------------------------------------------------
    p_decimal_cnt : process(clk_i)
    begin
        if rising_edge(clk_i) then  -- Rising clock edge
            if srst_n_i = '0' then  -- Synchronous reset (active low)
                -- WRITE YOUR CODE HERE
            elsif en_i = '1' then
                -- WRITE YOUR CODE HERE
            end if;
        end if;
    end process p_bcd_cnt;

    -- WRITE YOUR CODE HERE

end architecture Behavioral;
