------------------------------------------------------------------------
--
-- N-bit binary counter.
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
-- Entity declaration for N-bit binary counter
------------------------------------------------------------------------
entity binary_cnt is
generic(
    g_NBIT : positive := 5      -- Number of bits
);
port(
    clk_i    : in  std_logic;
    srst_n_i : in  std_logic;   -- Synchronous reset (active low)
    en_i     : in  std_logic;   -- Enable
    cnt_o    : out std_logic_vector(g_NBIT-1 downto 0)
);
end entity binary_cnt;

------------------------------------------------------------------------
-- Architecture declaration for N-bit binary counter
------------------------------------------------------------------------
architecture Behavioral of binary_cnt is
    signal s_cnt : std_logic_vector(g_NBIT-1 downto 0);
begin

    --------------------------------------------------------------------
    -- p_binary_cnt:
    -- Sequential process with synchronous reset and clock enable,
    -- which implements an one-way binary counter.
    --------------------------------------------------------------------
    p_binary_cnt : process (clk_i)
    begin
        if rising_edge(clk_i) then  -- Rising clock edge
            if srst_n_i = '0' then  -- Synchronous reset (active low)
                s_cnt <= (others => '0');   -- Clear all bits
            elsif en_i = '1' then
                s_cnt <= s_cnt + 1; -- Normal operation
            end if;
        end if;
    end process p_binary_cnt;

    cnt_o <= s_cnt;                 -- Entity output

end architecture Behavioral;
