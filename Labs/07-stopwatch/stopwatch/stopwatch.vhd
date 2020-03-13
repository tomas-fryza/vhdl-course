------------------------------------------------------------------------
--
-- Stopwatch counter.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------------------------------
-- Entity declaration for stopwatch counter
------------------------------------------------------------------------
entity stopwatch is
port(
    clk_i      : in  std_logic;
    srst_n_i   : in  std_logic; -- Synchronous reset (active low)
    ce_100Hz_i : in  std_logic; -- Clock enable
    cnt_en_i   : in  std_logic; -- Stopwatch enable
    
    sec_h_o    : out std_logic_vector(4-1 downto 0); -- Tens of secs
    sec_l_o    : out std_logic_vector(4-1 downto 0); -- Seconds
    hth_h_o    : out std_logic_vector(4-1 downto 0); -- Tenths of secs
    hth_l_o    : out std_logic_vector(4-1 downto 0)  -- Hundredths of secs
);
end entity stopwatch;

------------------------------------------------------------------------
-- Architecture declaration for stopwatch counter
------------------------------------------------------------------------
architecture Behavioral of stopwatch is
    signal s_cnt3 : unsigned(4-1 downto 0) := (others => '0'); -- Tens of seconds
    signal s_cnt2 : unsigned(4-1 downto 0) := (others => '0'); -- Seconds
    signal s_cnt1 : unsigned(4-1 downto 0) := (others => '0'); -- Tenths of seconds
    signal s_cnt0 : unsigned(4-1 downto 0) := (others => '0'); -- Hundredths of seconds
begin

    --------------------------------------------------------------------
    -- p_stopwatch_cnt:
    -- Sequential process with synchronous reset and clock enable,
    -- which implements four BCD counters.
    --------------------------------------------------------------------
    p_stopwatch_cnt : process (clk_i)
    begin
        if rising_edge(clk_i) then
            if srst_n_i = '0' then
                s_cnt0 <= (others => '0'); -- Clear all bits
                s_cnt1 <= (others => '0');
                s_cnt2 <= (others => '0');
                s_cnt3 <= (others => '0');
            elsif ce_100Hz_i = '1' and cnt_en_i = '1' then
                s_cnt0 <= s_cnt0 + 1;
                if s_cnt0 = 9 then
                    s_cnt0 <= (others => '0');
                    s_cnt1 <= s_cnt1 + 1;
                    if s_cnt1 = 9 then
                        s_cnt1 <= (others => '0');
                        s_cnt2 <= s_cnt2 + 1;
                        if s_cnt2 = 9 then
                            s_cnt2 <= (others => '0');
                            s_cnt3 <= s_cnt3 + 1;
                            if s_cnt3 = 5 then
                                s_cnt3 <= (others => '0');
                            end if;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process p_stopwatch_cnt;

    sec_h_o <= std_logic_vector(s_cnt3);
    sec_l_o <= std_logic_vector(s_cnt2);
    hth_h_o <= std_logic_vector(s_cnt1);
    hth_l_o <= std_logic_vector(s_cnt0);

end architecture Behavioral;
