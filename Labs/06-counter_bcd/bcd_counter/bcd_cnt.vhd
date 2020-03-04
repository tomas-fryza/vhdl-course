------------------------------------------------------------------------
--
-- Up/down BCD counter with load and carry.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;    -- Provides unsigned numerical computation

------------------------------------------------------------------------
-- Entity declaration for BCD counter
------------------------------------------------------------------------
entity bcd_cnt is
port (
    clk_i    : in  std_logic;
    srst_n_i : in  std_logic;   -- Synchronous reset (active low)
    en_i     : in  std_logic;   -- Enable
    up_i     : in  std_logic;   -- Up direction
    -- Load, Carry
    cnt_o    : out std_logic_vector(4-1 downto 0)
);
end entity bcd_cnt;

------------------------------------------------------------------------
-- Architecture declaration for BCD counter
------------------------------------------------------------------------
architecture Behavioral of bcd_cnt is
    signal s_cnt : std_logic_vector(4-1 downto 0);
begin

    --------------------------------------------------------------------
    -- p_bcd_cnt:
    -- Sequential process with synchronous reset and clock enable,
    -- which implements a two-way BCD counter.
    --------------------------------------------------------------------
    p_bcd_cnt : process(clk_i)
    begin
        if rising_edge(clk_i) then  -- Rising clock edge
            if srst_n_i = '0' then  -- Synchronous reset (active low)
                s_cnt <= (others => '0');   -- Clear all bits
            elsif en_i = '1' then
                -- WRITE YOUR CODE HERE
            end if;
        end if;
    end process p_bcd_cnt;

    cnt_o <= s_cnt;

end architecture Behavioral;
