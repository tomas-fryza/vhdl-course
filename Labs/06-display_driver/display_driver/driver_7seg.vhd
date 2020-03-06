------------------------------------------------------------------------
--
-- Driver for seven-segment displays.
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
-- Entity declaration for display driver
------------------------------------------------------------------------
entity driver_7seg is
port (
    clk_i    : in  std_logic;
    srst_n_i : in  std_logic;   -- Synchronous reset (active low)
    data0_i  : in  std_logic_vector(4-1 downto 0);  -- Input values
    data1_i  : in  std_logic_vector(4-1 downto 0);
    data2_i  : in  std_logic_vector(4-1 downto 0);
    data3_i  : in  std_logic_vector(4-1 downto 0);
    dp_i     : in  std_logic_vector(4-1 downto 0);  -- Decimal points
    dp_o     : out std_logic;                       -- Decimal point
    seg_o    : out std_logic_vector(7-1 downto 0);
    dig_o    : out std_logic_vector(4-1 downto 0)
);
end entity driver_7seg;

------------------------------------------------------------------------
-- Architecture declaration for display driver
------------------------------------------------------------------------
architecture Behavioral of driver_7seg is
    -- WRITE YOUR CODE HERE
    signal s_en  : std_logic;
    signal s_hex : std_logic_vector(4-1 downto 0);
begin

    --------------------------------------------------------------------
    -- Sub-block of clock_enable entity
    --- WRITE YOUR CODE HERE
    CLK_EN_0 : entity work.clock_enable
    generic map (
        g_NPERIOD => x"0028"        -- @ 4 ms if fclk = 10 kHz
    )
    port map (
        clk_i          => clk_i,
        srst_n_i       => srst_n_i,
        clock_enable_o => s_en
    );


    --------------------------------------------------------------------
    -- Sub-block of mux_7seg entity
    --- WRITE YOUR CODE HERE
    MUX_7SEG : entity work.mux_7seg
    port map (
        clk_i    => clk_i,
        srst_n_i => srst_n_i,
        en_i     => s_en,
        data0_i  => data0_i,
        data1_i  => data1_i,
        data2_i  => data2_i,
        data3_i  => data3_i,
        dp_i     => dp_i,
        data_o   => s_hex,
        dp_o     => dp_o,
        dig_o    => dig_o
    );


    --------------------------------------------------------------------
    -- Sub-block of hex_to_7seg entity
    --- WRITE YOUR CODE HERE
    HEX_TO_SEG : entity work.hex_to_7seg
    port map (
        hex_i => s_hex,
        seg_o => seg_o
    );

end architecture Behavioral;
