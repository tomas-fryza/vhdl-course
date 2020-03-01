------------------------------------------------------------------------
--
-- Clock divider.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;    -- NEW

------------------------------------------------------------------------
-- Entity declaration for clock divider
------------------------------------------------------------------------
entity clock_divider is
generic(
    g_PERIODS : positive := 4       -- Number of clock periods
);
port(
    clk_i    : in  std_logic;
    srst_n_i : in  std_logic;       -- Synchronous reset (active low)
    ce_o     : out std_logic        -- Clock enable
);
end clock_divider;

------------------------------------------------------------------------
-- Architecture declaration for clock divider
------------------------------------------------------------------------
architecture Behavioral of clock_divider is
    signal s_cnt : integer := 0;    -- Counter for clock division
begin

    --------------------------------------------------------------------
    -- Divides input clock frequency and generates one-periode pulse
    p_clk_divider : process(clk_i)
    begin
        if rising_edge(clk_i) then  -- Rising edge edge
            if srst_n_i = '0' then  -- Synchronous reset (active low)
                s_cnt <= 0;
                ce_o <= '0';
            else
                ce_o <= '0';        -- By default ce_o is not set
                s_cnt <= s_cnt + 1;
                if s_cnt >= g_PERIODS-1 then
                    s_cnt <= 0;
                    ce_o <= '1';
                end if;
            end if;
        end if;
    end process p_clk_divider;

end Behavioral;
