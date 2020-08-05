------------------------------------------------------------------------
--
-- Generates clock enable signal.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   -- Provides unsigned numerical computation

------------------------------------------------------------------------
-- Entity declaration for clock enable
------------------------------------------------------------------------
entity clock_enable is
generic (
    g_MAX    : unsigned(16-1 downto 0) := x"0005"  -- Default value
);
port (
    clk_i          : in  std_logic;
    srst_n_i       : in  std_logic; -- Synchronous reset (active low)
    clk_en_o : out std_logic
);
end entity clock_enable;

------------------------------------------------------------------------
-- Architecture declaration for clock enable
------------------------------------------------------------------------
architecture Behavioral of clock_enable is

    -- Internal signals
    signal s_cnt : unsigned(16-1 downto 0) := (others => '0');

begin
    --------------------------------------------------------------------
    -- p_clk_enable:
    -- Generate clock enable signal instead of creating another clock 
    -- domain. By default enable signal is low and generated pulse is 
    -- always one clock long.
    --------------------------------------------------------------------
    p_clk_enable : process (clk_i)
    begin
		if rising_edge(clk_i) then			-- Rising clock edge

			if srst_n_i = '0' then			-- Synchronous reset (active low)
                s_cnt <= (others => '0');   -- Clear all bits
                clk_en_o <= '0';

			elsif s_cnt >= (g_MAX-1) then	-- Enable pulse
                s_cnt <= (others => '0');
                clk_en_o <= '1';

            else
                s_cnt <= s_cnt + 1;
                clk_en_o <= '0';
            end if;

		end if;	-- Rising edge
	end process p_clk_enable;

end architecture Behavioral;
