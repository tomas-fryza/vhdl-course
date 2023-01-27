------------------------------------------------------------
--
-- Top-level for 4-digit 7-segment display driver.
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

------------------------------------------------------------
-- Entity declaration for top-level design
------------------------------------------------------------
entity top is
    port (
        CLK100MHZ : in std_logic; --! Main clock
        SW        : in std_logic_vector(15 downto 0); --! 4 by 4-bit data values
        CA        : out std_logic; --! Cathod A
        CB        : out std_logic; --! Cathod B
        CC        : out std_logic; --! Cathod C
        CD        : out std_logic; --! Cathod D
        CE        : out std_logic; --! Cathod E
        CF        : out std_logic; --! Cathod F
        CG        : out std_logic; --! Cathod G
        DP        : out std_logic; --! Decimal point
        AN        : out std_logic_vector(7 downto 0); --! Common anode signals to individual displays
        BTNC      : in std_logic --! Synchronous reset
    );
end entity top;

------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------
architecture Behavioral of top is
    -- No internal signals are needed today:)
  begin
  
    --------------------------------------------------------
    -- Instance (copy) of driver_7seg_4digits entity
    driver_seg_4 : entity work.driver_7seg_4digits
        port map(
            clk        => CLK100MHZ,
            reset      => BTNC,
            data0_i(3) => SW(3),
            data0_i(2) => SW(2),
            data0_i(1) => SW(1),
            data0_i(0) => SW(0),
  
            -- MAP DATA INPUTS TO ON-BOARD SWITCHES
            data1_i(3) => SW(7),
            data1_i(2) => SW(6),
            data1_i(1) => SW(5),
            data1_i(0) => SW(4),
  
            data2_i(3) => SW(11),
            data2_i(2) => SW(10),
            data2_i(1) => SW(9),
            data2_i(0) => SW(8),

            data3_i(3) => SW(15),
            data3_i(2) => SW(14),
            data3_i(1) => SW(13),
            data3_i(0) => SW(12),
            dp_i       => "0111",
  
            -- MAP DECIMAL POINT AND DISPLAY SEGMENTS
            dp_o => DP,
            seg_o(6) => CA,
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,
            seg_o(0) => CG,

            dig_o(3 downto 0) => AN(3 downto 0)
        );
  
    -- Disconnect the top four digits of the 7-segment display
    AN(7 downto 4) <= b"1111";
  
  end architecture Behavioral;
