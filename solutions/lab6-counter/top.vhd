------------------------------------------------------------
--
-- Top-level for bidirectional counter(s).
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
        SW        : in std_logic_vector(1 downto 0); --! Counter(s) direction
        LED       : out std_logic_vector(15 downto 0); --! Counter1 value
        CA        : out std_logic; --! Cathod A
        CB        : out std_logic; --! Cathod B
        CC        : out std_logic; --! Cathod C
        CD        : out std_logic; --! Cathod D
        CE        : out std_logic; --! Cathod E
        CF        : out std_logic; --! Cathod F
        CG        : out std_logic; --! Cathod G
        AN        : out std_logic_vector(7 downto 0); --! Common anode signals to individual displays
        BTNC      : in std_logic --! Synchronous reset
    );
end entity top;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top is
    -- 4-bit counter @ 250 ms
    signal s_en_250ms : std_logic; --! Clock enable signal for Counter0
    signal s_cnt_4bit : std_logic_vector(3 downto 0); --! Counter0

    -- 16-bit counter @ 10 ms
    signal s_en_10ms   : std_logic; --! Clock enable signal for Counter1
    signal s_cnt_16bit : std_logic_vector(15 downto 0); --! Counter1
begin

    --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 25000000 -- 250 ms
        )
        port map(
            clk   => CLK100MHZ,
            reset => BTNC,
            ce_o  => s_en_250ms
        );

    clk_en1 : entity work.clock_enable
        generic map(
            g_MAX => 1000000 -- 10 ms
        )
        port map(
            clk   => CLK100MHZ,
            reset => BTNC,
            ce_o  => s_en_10ms
        );

    --------------------------------------------------------------------
    -- Instance (copy) of cnt_up_down entity
    bin_cnt0 : entity work.cnt_up_down
        generic map(
            g_CNT_WIDTH => 4
        )
        port map(
            clk      => CLK100MHZ,
            reset    => BTNC,
            en_i     => s_en_250ms,
            cnt_up_i => SW(0),
            cnt_o    => s_cnt_4bit
        );

    bin_cnt1 : entity work.cnt_up_down
        generic map(
            g_CNT_WIDTH => 16
        )
        port map(
            clk      => CLK100MHZ,
            reset    => BTNC,
            en_i     => s_en_10ms,
            cnt_up_i => SW(1),
            cnt_o    => s_cnt_16bit
        );

    --------------------------------------------------------------------
    -- Instance (copy) of hex_7seg entity
    hex2seg : entity work.hex_7seg
        port map(
            blank_i  => BTNC,
            hex_i    => s_cnt_4bit,
            seg_o(6) => CA,
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,
            seg_o(0) => CG
        );

    -- Connect one common anode to 3.3V
    AN <= b"1111_1110";

    -- Display counter value on LEDs
    LED <= s_cnt_16bit;

end architecture Behavioral;