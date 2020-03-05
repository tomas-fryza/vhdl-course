------------------------------------------------------------------------
--
-- Multiplexer for seven-segment displays.
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
-- Entity declaration for display multiplexer
------------------------------------------------------------------------
entity mux_7seg is
port (
    clk_i    : in  std_logic;
    srst_n_i : in  std_logic;   -- Synchronous reset (active low)
    en_i     : in  std_logic;   -- Enable
    data0_i  : in  std_logic_vector(4-1 downto 0);  -- Input values
    data1_i  : in  std_logic_vector(4-1 downto 0);
    data2_i  : in  std_logic_vector(4-1 downto 0);
    data3_i  : in  std_logic_vector(4-1 downto 0);
    dp_i     : in  std_logic_vector(4-1 downto 0);  -- Decimal points
    data_o   : out std_logic_vector(4-1 downto 0);  -- Output value
    dp_o     : out std_logic;                       -- Decimal point
    dig_o    : out std_logic_vector(4-1 downto 0)   -- Digit position
);
end entity mux_7seg;

------------------------------------------------------------------------
-- Architecture declaration for display multiplexer
------------------------------------------------------------------------
architecture Behavioral of mux_7seg is
    signal s_cnt : std_logic_vector(2-1 downto 0) := "00";
begin

    --------------------------------------------------------------------
    -- p_select_cnt:
    -- Sequential process with synchronous reset and clock enable,
    -- which implements an internal 2-bit counter for multiplexer 
    -- selection bits.
    --------------------------------------------------------------------
    p_select_cnt : process(clk_i)
    begin
        if rising_edge(clk_i) then  -- Rising clock edge
            if srst_n_i = '0' then  -- Synchronous reset (active low)
                -- WRITE YOUR CODE HERE
                s_cnt <= (others => '0');
            elsif en_i = '1' then
                -- WRITE YOUR CODE HERE
                s_cnt <= s_cnt + 1;
            end if;
        end if;
    end process p_select_cnt;

    --------------------------------------------------------------------
    -- p_mux:
    -- Combinational process which implements a 4-to-1 mux.
    --------------------------------------------------------------------
    p_mux : process(s_cnt, data0_i, data1_i, data2_i, data3_i, dp_i)
    begin
        case s_cnt is
        when "00" =>
            -- WRITE YOUR CODE HERE
            data_o <= data0_i;
            dp_o   <= dp_i(0);
            dig_o  <= "1110";
        when "01" =>
            -- WRITE YOUR CODE HERE
            data_o <= data1_i;
            dp_o   <= dp_i(1);
            dig_o  <= "1101";
        when "10" =>
            -- WRITE YOUR CODE HERE
            data_o <= data2_i;
            dp_o   <= dp_i(2);
            dig_o  <= "1011";
        when others =>
            -- WRITE YOUR CODE HERE
            data_o <= data3_i;
            dp_o   <= dp_i(3);
            dig_o  <= "0111";
        end case;
    end process p_mux;

end architecture Behavioral;
