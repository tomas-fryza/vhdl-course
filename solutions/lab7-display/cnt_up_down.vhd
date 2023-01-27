------------------------------------------------------------
--
-- N-bit Up/Down binary counter.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- Vivado v2018.3, EDA Playground, TerosHDL
--
-- Copyright (c) 2019 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------------------
-- Entity declaration for n-bit counter
------------------------------------------------------------
entity cnt_up_down is
    generic (
        g_CNT_WIDTH : natural := 4 --! Default number of counter bits
    );
    port (
        clk      : in std_logic; --! Main clock
        reset    : in std_logic; --! Synchronous reset
        en_i     : in std_logic; --! Enable input
        cnt_up_i : in std_logic; --! Direction of the counter
        cnt_o    : out std_logic_vector(g_CNT_WIDTH - 1 downto 0)
    );
end entity cnt_up_down;

------------------------------------------------------------
-- Architecture body for n-bit counter
------------------------------------------------------------
architecture Behavioral of cnt_up_down is

    signal s_cnt : unsigned(g_CNT_WIDTH - 1 downto 0); --! Local counter

begin
    --------------------------------------------------------
    -- p_cnt_up_down:
    -- Clocked process with synchronous reset which implements
    -- n-bit up/down counter.
    --------------------------------------------------------
    p_cnt_up_down : process (clk)
    begin
        if rising_edge(clk) then

            if (reset = '1') then     -- Synchronous reset
                s_cnt <= (others => '0'); -- Clear all bits

            elsif (en_i = '1') then -- Test if counter is enabled

                -- TEST COUNTER DIRECTION HERE
                if (cnt_up_i = '1') then
                    s_cnt <= s_cnt + 1;
                else
                    s_cnt <= s_cnt - 1;
                end if;
            end if;
        end if;
    end process p_cnt_up_down;

    -- Output must be retyped from "unsigned" to "std_logic_vector"
    cnt_o <= std_logic_vector(s_cnt);

end architecture Behavioral;