------------------------------------------------------------------------
--
-- Implementation of seven-segment display driver.
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
-- Entity declaration for top level
------------------------------------------------------------------------
entity top is
port (
    clk_i      : in  std_logic;     -- 10 kHz clock signal
    BTN0       : in  std_logic;     -- Synchronous reset
    SW0_CPLD   : in  std_logic;     -- Input 0
    SW1_CPLD   : in  std_logic;
    SW2_CPLD   : in  std_logic;
    SW3_CPLD   : in  std_logic;
    SW4_CPLD   : in  std_logic;     -- Input 1
    SW5_CPLD   : in  std_logic;
    SW6_CPLD   : in  std_logic;
    SW7_CPLD   : in  std_logic;
    SW8_CPLD   : in  std_logic;     -- Input 2
    SW9_CPLD   : in  std_logic;
    SW10_CPLD  : in  std_logic;
    SW11_CPLD  : in  std_logic;
    SW12_CPLD  : in  std_logic;     -- Input 3
    SW13_CPLD  : in  std_logic;
    SW14_CPLD  : in  std_logic;
    SW15_CPLD  : in  std_logic;
    disp_dp    : out std_logic;     -- Decimal point
    disp_seg_o : out std_logic_vector(7-1 downto 0);
    disp_dig_o : out std_logic_vector(4-1 downto 0)
);
end entity top;

------------------------------------------------------------------------
-- Architecture declaration for top level
------------------------------------------------------------------------
architecture Behavioral of top is
    signal s_data0, s_data1 : std_logic_vector(4-1 downto 0);
    signal s_data2, s_data3 : std_logic_vector(4-1 downto 0);
begin

    -- Combine 4-bit inputs to internal signals
    -- WRITE YOUR CODE HERE
    s_data0(3) <= SW15_CPLD;
    s_data0(2) <= SW14_CPLD;
    s_data0(1) <= SW13_CPLD;
    s_data0(0) <= SW12_CPLD;

    s_data1(3) <= SW11_CPLD;
    s_data1(2) <= SW10_CPLD;
    s_data1(1) <= SW9_CPLD;
    s_data1(0) <= SW8_CPLD;

    s_data2(3) <= SW7_CPLD;
    s_data2(2) <= SW6_CPLD;
    s_data2(1) <= SW5_CPLD;
    s_data2(0) <= SW4_CPLD;

    s_data3(3) <= SW3_CPLD;
    s_data3(2) <= SW2_CPLD;
    s_data3(1) <= SW1_CPLD;
    s_data3(0) <= SW0_CPLD;


    --------------------------------------------------------------------
    -- Sub-block of driver_7seg entity
    --- WRITE YOUR CODE HERE
    DRIVER_7SEG : entity work.driver_7seg
    port map (
        clk_i    => clk_i,      -- 10 kHz
        srst_n_i => BTN0,       -- Synchronous reset
        data0_i  => s_data0,    -- Slide switches data
        data1_i  => s_data1,
        data2_i  => s_data2,
        data3_i  => s_data3,
        dp_i     => "1011",     -- Decimal point
        dp_o     => disp_dp,
        seg_o    => disp_seg_o,
        dig_o    => disp_dig_o
    );

end architecture Behavioral;
